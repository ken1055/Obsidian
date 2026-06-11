#requires -Version 5.1
# Obsidian vault の morning-summary / evening-tidy を Windows タスクスケジューラに登録する。
# 一度だけ手動で実行する。再実行すると既存タスクを上書きする。

$ErrorActionPreference = "Stop"
$VaultRoot = "C:\Users\PC_User\Develop\obsidian"
$ScriptDir = Join-Path $VaultRoot "scripts"

function Register-VaultTask {
    param(
        [string]$TaskName,
        [string]$ScriptPath,
        [string]$Time
    )

    $action = New-ScheduledTaskAction `
        -Execute "powershell.exe" `
        -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$ScriptPath`"" `
        -WorkingDirectory $VaultRoot

    $trigger = New-ScheduledTaskTrigger -Daily -At $Time

    $settings = New-ScheduledTaskSettingsSet `
        -StartWhenAvailable `
        -AllowStartIfOnBatteries `
        -DontStopIfGoingOnBatteries `
        -MultipleInstances IgnoreNew

    $principal = New-ScheduledTaskPrincipal -UserId "$env:USERDOMAIN\$env:USERNAME" -LogonType Interactive -RunLevel Limited

    if (Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue) {
        Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
    }

    Register-ScheduledTask `
        -TaskName $TaskName `
        -Action $action `
        -Trigger $trigger `
        -Settings $settings `
        -Principal $principal `
        -Description "Obsidian vault $TaskName job"
}

Register-VaultTask -TaskName "Obsidian-MorningSummary" -ScriptPath (Join-Path $ScriptDir "morning-summary.ps1") -Time "07:00"
Register-VaultTask -TaskName "Obsidian-EveningTidy"    -ScriptPath (Join-Path $ScriptDir "evening-tidy.ps1")    -Time "23:00"

Write-Output "Registered: Obsidian-MorningSummary (07:00), Obsidian-EveningTidy (23:00)"
