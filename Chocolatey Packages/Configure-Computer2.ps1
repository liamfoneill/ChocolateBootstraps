choco install visualstudio2019enterprise
Install-Module -Name posh-git -Force -AllowPrerelease
Install-Module -Name oh-my-posh -Force
Install-Module -Name PSReadLine -AllowPrerelease -Force
Add-Content -Path $PROFILE -Value "Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox"

#Clean Up Desktop
Remove-Item –path ~\Desktop -include *.lnk -Recurse

#Some Problem with this
Remove-Item –path C:\Users\Public\Desktop -include *.lnk -Recurse