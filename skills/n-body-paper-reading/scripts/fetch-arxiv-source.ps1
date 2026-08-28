param(
    [Parameter(Mandatory = $true)]
    [string]$ArxivId,

    [Parameter(Mandatory = $false)]
    [string]$OutputDir = ".",

    [Parameter(Mandatory = $false)]
    [string]$FolderName = ""
)

$ErrorActionPreference = "Stop"

function Normalize-ArxivId {
    param([string]$Raw)
    $id = $Raw.Trim()
    $id = $id -replace '^arXiv:', ''
    $id = $id -replace '^https?://arxiv\.org/(abs|pdf|e-print)/', ''
    $id = $id -replace '\.pdf$', ''
    return $id
}

$id = Normalize-ArxivId -Raw $ArxivId
if ([string]::IsNullOrWhiteSpace($id)) {
    throw "ArxivId is empty after normalization."
}

$safeId = $id -replace '[^A-Za-z0-9._-]', '_'
if ([string]::IsNullOrWhiteSpace($FolderName)) {
    $FolderName = "arxiv-$safeId-source"
}

$root = Resolve-Path -LiteralPath $OutputDir -ErrorAction SilentlyContinue
if (-not $root) {
    New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null
    $root = Resolve-Path -LiteralPath $OutputDir
}

$targetDir = Join-Path $root.Path $FolderName
New-Item -ItemType Directory -Force -Path $targetDir | Out-Null

$archivePath = Join-Path $targetDir "arxiv-$safeId-eprint"
$url = "https://arxiv.org/e-print/$id"

Invoke-WebRequest -Uri $url -OutFile $archivePath

$extractDir = Join-Path $targetDir "source"
New-Item -ItemType Directory -Force -Path $extractDir | Out-Null

$usedMode = "unknown"
$tarList = $null
try {
    $tarList = & tar -tf $archivePath 2>$null
    if ($LASTEXITCODE -eq 0) {
        & tar -xf $archivePath -C $extractDir
        if ($LASTEXITCODE -ne 0) {
            throw "tar extraction failed."
        }
        $usedMode = "tar"
    }
} catch {
    $tarList = $null
}

if ($usedMode -eq "unknown") {
    $texPath = Join-Path $extractDir "source.tex"
    try {
        $inStream = [System.IO.File]::OpenRead($archivePath)
        try {
            $gzip = New-Object System.IO.Compression.GzipStream($inStream, [System.IO.Compression.CompressionMode]::Decompress)
            try {
                $outStream = [System.IO.File]::Create($texPath)
                try {
                    $gzip.CopyTo($outStream)
                    $usedMode = "gzip-single-file"
                } finally {
                    $outStream.Dispose()
                }
            } finally {
                $gzip.Dispose()
            }
        } finally {
            $inStream.Dispose()
        }
    } catch {
        Copy-Item -LiteralPath $archivePath -Destination $texPath -Force
        $usedMode = "plain-or-unknown-single-file"
    }
}

$files = Get-ChildItem -LiteralPath $extractDir -Recurse -File | ForEach-Object {
    $_.FullName.Substring($extractDir.Length).TrimStart('\', '/')
}

$manifest = [ordered]@{
    arxiv_id = $id
    eprint_url = $url
    downloaded_at = (Get-Date).ToString("o")
    archive_path = $archivePath
    source_dir = $extractDir
    extraction_mode = $usedMode
    files = @($files)
}

$manifestPath = Join-Path $targetDir "source-manifest.json"
$manifest | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath $manifestPath -Encoding UTF8

Write-Output "arxiv_id=$id"
Write-Output "target_dir=$targetDir"
Write-Output "archive_path=$archivePath"
Write-Output "source_dir=$extractDir"
Write-Output "manifest=$manifestPath"
Write-Output "extraction_mode=$usedMode"
