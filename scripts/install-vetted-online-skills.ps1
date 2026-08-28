[CmdletBinding()]
param(
    [Parameter()]
    [string]$ProjectRoot = (Get-Location).Path,

    [Parameter()]
    [ValidateSet('recommended', 'annals', 'formal', 'open-problem', 'literature', 'review', 'extended-citations', 'all')]
    [string[]]$Profile = @('recommended'),

    [Parameter()]
    [string[]]$Name,

    [Parameter()]
    [switch]$List
)

$ErrorActionPreference = 'Stop'
$repositoryRoot = Split-Path -Parent $PSScriptRoot

$catalog = [ordered]@{
    'anmath-workflow' = @{
        Path = 'community-skills/awesome-journal-skills/skills/anmath-workflow'
        Groups = @('recommended', 'annals', 'all')
        Purpose = 'Route an Annals-style manuscript through the full editorial workflow.'
    }
    'anmath-scope-fit' = @{
        Path = 'community-skills/awesome-journal-skills/skills/anmath-scope-fit'
        Groups = @('recommended', 'annals', 'all')
        Purpose = 'Assess importance, originality, and journal fit honestly.'
    }
    'anmath-results-framing' = @{
        Path = 'community-skills/awesome-journal-skills/skills/anmath-results-framing'
        Groups = @('recommended', 'annals', 'all')
        Purpose = 'State and position the main theorem precisely.'
    }
    'anmath-methods' = @{
        Path = 'community-skills/awesome-journal-skills/skills/anmath-methods'
        Groups = @('recommended', 'annals', 'all')
        Purpose = 'Expose the proof architecture and novel technique.'
    }
    'anmath-figures' = @{
        Path = 'community-skills/awesome-journal-skills/skills/anmath-figures'
        Groups = @('annals', 'all')
        Purpose = 'Improve mathematical exposition, notation, diagrams, and structure.'
    }
    'anmath-supplementary' = @{
        Path = 'community-skills/awesome-journal-skills/skills/anmath-supplementary'
        Groups = @('annals', 'all')
        Purpose = 'Decide what belongs in appendices or supplementary material.'
    }
    'anmath-writing-style' = @{
        Path = 'community-skills/awesome-journal-skills/skills/anmath-writing-style'
        Groups = @('recommended', 'annals', 'all')
        Purpose = 'Apply concise, precise pure-mathematics writing conventions.'
    }
    'anmath-length-management' = @{
        Path = 'community-skills/awesome-journal-skills/skills/anmath-length-management'
        Groups = @('annals', 'all')
        Purpose = 'Remove bloat without hiding proof steps.'
    }
    'anmath-cover-letter' = @{
        Path = 'community-skills/awesome-journal-skills/skills/anmath-cover-letter'
        Groups = @('annals', 'all')
        Purpose = 'Draft a concise editor cover note after checking current requirements.'
    }
    'anmath-submission' = @{
        Path = 'community-skills/awesome-journal-skills/skills/anmath-submission'
        Groups = @('annals', 'all')
        Purpose = 'Prepare the final submission package and checklist.'
    }
    'anmath-referee-strategy' = @{
        Path = 'community-skills/awesome-journal-skills/skills/anmath-referee-strategy'
        Groups = @('recommended', 'annals', 'review', 'all')
        Purpose = 'Anticipate an expert referee and harden weak points.'
    }
    'anmath-revision' = @{
        Path = 'community-skills/awesome-journal-skills/skills/anmath-revision'
        Groups = @('annals', 'review', 'all')
        Purpose = 'Repair the manuscript and answer reports point by point.'
    }
    'lean4' = @{
        Path = 'community-skills/lean4-skills/skills/lean4'
        Groups = @('formal', 'all')
        Purpose = 'Develop and review Lean 4/mathlib formal proofs.'
    }
    'proof-blueprint-review' = @{
        Path = 'community-skills/ai4math-auto-research/skills/proof-blueprint-review'
        Groups = @('recommended', 'review', 'all')
        Purpose = 'Review a proof blueprint before investing in full formal detail.'
    }
    'open-problem-research-pipeline' = @{
        Path = 'community-skills/ai4math-auto-research/skills/open-problem-research-pipeline'
        Groups = @('recommended', 'open-problem', 'all')
        Purpose = 'Separate literature facts, method analysis, and candidate proof routes.'
    }
    'arxiv-latex-source' = @{
        Path = 'community-skills/research-plugins/skills/arxiv-latex-source'
        Groups = @('recommended', 'literature', 'all')
        Purpose = 'Retrieve and inspect arXiv LaTeX source.'
    }
    'crossref-api' = @{
        Path = 'community-skills/research-plugins/skills/crossref-api'
        Groups = @('recommended', 'literature', 'all')
        Purpose = 'Look up DOI and publication metadata through Crossref.'
    }
    'openalex-api' = @{
        Path = 'community-skills/research-plugins/skills/openalex-api'
        Groups = @('recommended', 'literature', 'all')
        Purpose = 'Search scholarly works and citation relations through OpenAlex.'
    }
    'citation-chaining-guide' = @{
        Path = 'community-skills/research-plugins/skills/citation-chaining-guide'
        Groups = @('recommended', 'literature', 'all')
        Purpose = 'Trace backward and forward citations systematically.'
    }
    'bibtex-management-guide' = @{
        Path = 'community-skills/research-plugins/skills/bibtex-management-guide'
        Groups = @('recommended', 'literature', 'all')
        Purpose = 'Maintain clean, validated BibTeX records.'
    }
    'peer-review' = @{
        Path = 'community-skills/kdense-scientific-writer/skills/peer-review'
        Groups = @('review', 'all')
        Purpose = 'Run a general claim/evidence and reproducibility review; adapt to mathematics.'
    }
    'citation-management' = @{
        Path = 'community-skills/kdense-scientific-writer/skills/citation-management'
        Groups = @('extended-citations', 'all')
        Purpose = 'Use scripted citation lookup and validation with optional external services.'
    }
}

if ($List) {
    $catalog.GetEnumerator() | ForEach-Object {
        [pscustomobject]@{
            Name = $_.Key
            Profiles = ($_.Value.Groups -join ', ')
            Purpose = $_.Value.Purpose
        }
    } | Format-Table -AutoSize
    return
}

if ($Name -and $Name.Count -gt 0) {
    $selectedNames = @($Name | Select-Object -Unique)
    foreach ($skillName in $selectedNames) {
        if (-not $catalog.Contains($skillName)) {
            throw "Unknown skill '$skillName'. Run with -List to see valid names."
        }
    }
}
else {
    $selectedNames = @(
        $catalog.GetEnumerator() |
            Where-Object {
                $groups = $_.Value.Groups
                ($Profile | Where-Object { $groups -contains $_ }).Count -gt 0
            } |
            ForEach-Object { $_.Key }
    )
}

$resolvedProjectRoot = [System.IO.Path]::GetFullPath($ProjectRoot)
if (-not (Test-Path -LiteralPath $resolvedProjectRoot -PathType Container)) {
    throw "Project root does not exist: $resolvedProjectRoot"
}

$destinationRoot = Join-Path $resolvedProjectRoot '.agents\skills'
New-Item -ItemType Directory -Force -Path $destinationRoot | Out-Null

$installed = 0
$skipped = 0
foreach ($skillName in $selectedNames) {
    $source = Join-Path $repositoryRoot $catalog[$skillName].Path
    $skillFile = Join-Path $source 'SKILL.md'
    if (-not (Test-Path -LiteralPath $skillFile -PathType Leaf)) {
        throw "Packaged skill is incomplete: $skillFile"
    }

    $declaredNameLine = Select-String -LiteralPath $skillFile -Pattern '^name:\s*(.+?)\s*$' | Select-Object -First 1
    if (-not $declaredNameLine -or $declaredNameLine.Matches[0].Groups[1].Value.Trim('"', "'") -ne $skillName) {
        throw "Skill folder '$skillName' does not match its SKILL.md name."
    }

    $destination = Join-Path $destinationRoot $skillName
    if (Test-Path -LiteralPath $destination) {
        Write-Warning "Skipped '$skillName': destination already exists at $destination"
        $skipped++
        continue
    }

    Copy-Item -Recurse -LiteralPath $source -Destination $destination
    Write-Host "Installed $skillName"
    $installed++
}

Write-Host "Installed $installed skill(s); skipped $skipped existing skill(s)."
Write-Host "Project skill directory: $destinationRoot"
Write-Host 'Codex normally detects new skills automatically. If a skill does not appear, restart Codex.'
