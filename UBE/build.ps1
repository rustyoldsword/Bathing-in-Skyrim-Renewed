# Builds the UBE routing scripts of this branch.
#
# The compiler also searches its own working directory, so this script runs from
# a neutral location -- building from inside a mod folder silently compiles an
# old copy of the source file.
#
# UBE\stubs shadows PapyrusUtil / NiOverride / the mzin scripts that are not
# rebuilt.  They declare only the members used, with real signatures; the VM
# binds by name at runtime.

param(
    [string]$Game = $env:SKYRIM_GAME,   # Skyrim SE folder with 'Papyrus Compiler' and Data\Scripts\Source
    [string[]]$Targets = @('mzinUBEDirtTextures', 'mzinOverlayUtility')
)

$ErrorActionPreference = 'Stop'
if (-not $Game) { throw 'Pass -Game (or set SKYRIM_GAME).' }

$Repo     = Split-Path -Parent $PSScriptRoot
$Compiler = Join-Path $Game 'Papyrus Compiler\PapyrusCompiler.exe'
$Flags    = 'TESV_Papyrus_Flags.flg'
$Src      = Join-Path $Repo 'Core\Source\Scripts'
$Out      = Join-Path $PSScriptRoot 'Scripts'

$Imports = @(
    (Join-Path $PSScriptRoot 'stubs'),         # stubs first
    $Src,
    (Join-Path $Game 'Data\Scripts\Source'),   # SKSE-extended vanilla sources
    (Join-Path $Game 'Data\Source\Scripts')    # plain vanilla + the flags file
) -join ';'

New-Item -ItemType Directory -Force -Path $Out | Out-Null

Push-Location $env:TEMP
try {
    foreach ($t in $Targets) {
        $psc = Join-Path $Src "$t.psc"
        & $Compiler $psc -i="$Imports" -o="$Out" -f="$Flags"
        if ($LASTEXITCODE -ne 0) { throw "Compile failed: $t" }

        # A failed compile leaves the old .pex in place, so verify freshness.
        $pex = Join-Path $Out "$t.pex"
        if (-not (Test-Path $pex)) { throw "Missing output: $pex" }
        if ((Get-Item $pex).LastWriteTime -lt (Get-Item $psc).LastWriteTime) {
            throw "Stale output (pex older than psc): $pex"
        }
    }
}
finally { Pop-Location }

Write-Output 'Build OK'
