[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern('^[^/\s]+/[^/\s]+$')]
    [string]$Repo,

    [string]$Ref = 'main'
)

$installer = Join-Path $env:USERPROFILE '.codex\skills\.system\skill-installer\scripts\install-skill-from-github.py'
if (-not (Test-Path -LiteralPath $installer)) {
    throw "Codex skill installer was not found at $installer"
}

$paths = @(
    'skills/formula-derivation',
    'skills/math-proof-check',
    'skills/paper-plan',
    'skills/paper-write',
    'skills/proof-checker',
    'skills/proof-writer',
    'skills/qmd-prover',
    'skills/n-body-paper-reading',
    'skills/math-journal-latex',
    'skills/math-journal-preflight',
    'skills/math-referee-response',
    'skills/celestial-mechanics-proof-audit'
)

& python $installer --repo $Repo --ref $Ref --path $paths
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
