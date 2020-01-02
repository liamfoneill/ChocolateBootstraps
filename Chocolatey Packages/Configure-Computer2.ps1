# VS Enterprise package has a bug and needs to be run twice to work
choco install visualstudio2019enterprise
choco install visualstudio2019enterprise
Install-Module -Name posh-git -Force -AllowPrerelease
Install-Module -Name oh-my-posh -Force
Install-Module -Name PSReadLine -AllowPrerelease -Force
Add-Content -Path $PROFILE -Value "Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox"

# Install VS Code Sync
code --install-extension shan.code-settings-sync

#Clean Up Desktop
Remove-Item -path ~\Desktop -include *.lnk -Recurse

#Some Problem with this
Remove-Item -path C:\Users\Public\Desktop -include *.lnk -Recurse

#Flatten Start Menu
.\Organise-Startmenu.ps1