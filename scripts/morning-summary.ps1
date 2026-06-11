#requires -Version 5.1
# morning-summary job: headless Claude Code execution.
# Invoked by Windows Task Scheduler at 07:00 JST.
# Pure ASCII to avoid PS 5.1 cp932 source-encoding issues.

$ErrorActionPreference = "Stop"

$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$VaultRoot = "C:\Users\PC_User\Develop\obsidian"
$LogDir    = Join-Path $VaultRoot "scripts\logs"
$LogFile   = Join-Path $LogDir ("morning-summary_{0:yyyy-MM-dd}.log" -f (Get-Date))

if (-not (Test-Path $LogDir)) {
    New-Item -ItemType Directory -Path $LogDir -Force | Out-Null
}

Set-Location $VaultRoot

$prompt = "Run the morning-summary job exactly as defined in CLAUDE.md. Commit and push the result."

"=== $(Get-Date -Format o) morning-summary start ===" | Out-File -FilePath $LogFile -Append -Encoding utf8

& claude -p $prompt --dangerously-skip-permissions *>> $LogFile

"=== $(Get-Date -Format o) morning-summary end (exit=$LASTEXITCODE) ===" | Out-File -FilePath $LogFile -Append -Encoding utf8
exit $LASTEXITCODE
