choco install visualstudio2019enterprise
Install-Module -Name posh-git -Force -AllowPrerelease
Install-Module -Name oh-my-posh -Force
Install-Module -Name PSReadLine -AllowPrerelease -Force
Add-Content -Path $PROFILE -Value "Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox"