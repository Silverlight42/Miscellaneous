# Winget

```
winget install --scope machine Microsoft.PowerToys -s winget
winget install -e --id Mozilla.Firefox
winget install -e --id GitHub.GitHubDesktop
```
# Registry

```powershell
New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Value 0 -Type DWord -Force
```
