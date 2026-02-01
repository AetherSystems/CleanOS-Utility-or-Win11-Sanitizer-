# CleanOS Utility v1.0 - Foundation Script

Write-Host "Starting CleanOS Optimization..." -ForegroundColor Cyan

# 1. Nuke Copilot (AI Removal)
Write-Host "Disabling Copilot..." -ForegroundColor Yellow
# Disables the Copilot button and the underlying service for the current user
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowCopilotButton" -Value 0

# 2. Kill Telemetry (Privacy Hardening)
Write-Host "Killing Telemetry and Tracking..." -ForegroundColor Yellow
# Stops the Connected User Experiences and Telemetry service
Stop-Service -Name "DiagTrack" -ErrorAction SilentlyContinue
Set-Service -Name "DiagTrack" -StartupType Disabled

# 3. Purge Bloatware
Write-Host "Purging pre-installed 'Microslop' apps..." -ForegroundColor Yellow
# List of common bloatware apps to remove
$Bloatware = @("Microsoft.BingNews", "Microsoft.ZuneVideo", "Microsoft.GamingApp", "Microsoft.SkypeApp")
foreach ($App in $Bloatware) {
    Get-AppxPackage -Name $App | Remove-AppxPackage -ErrorAction SilentlyContinue
}

Write-Host "Optimization Complete. Your PC is now cleaner." -ForegroundColor Green
