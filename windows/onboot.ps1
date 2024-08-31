Set-Location $env:temp

Write-Host "Installing Windows Package Manager (winget)..." -ForegroundColor Green
$progressPreference = 'silentlyContinue'

Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile $env:temp\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile $env:temp\Microsoft.VCLibs.x64.14.00.Desktop.appx
Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile $env:temp\Microsoft.UI.Xaml.2.8.x64.appx

Add-AppxPackage $env:temp\Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage $env:temp\Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage $env:temp\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

$SoftwareToInstall = "Microsoft.VisualStudioCode", "qBittorrent.qBittorrent", "VideoLAN.VLC"

foreach ($Software in $SoftwareToInstall) {
    WinGet.exe install $software --silent --force --accept-source-agreements --disable-interactivity --source winget
}