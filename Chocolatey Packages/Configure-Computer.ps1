[CmdletBinding()]
Param
(
    [Parameter(Mandatory=$true,Position=1,HelpMessage="Set to true if you want to also install desktop apps")]
    [bool]$Desktop
)

$StopWatch = New-Object -TypeName System.Diagnostics.Stopwatch
$StopWatch.Start()

Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco feature enable -n=allowGlobalConfirmation

# Windows Features
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Containers-DisposableClientVM -All -NoRestart

# Install all Choco Apps
choco install `
microsoft-edge-insider `
bitwarden `
bitwarden-cli `
vscode `
terraform `
pulumi `
kubernetes-cli `
kubernetes-helm `
minikube `
draft `
aks-engine `
az.powershell `
powershell-preview `
pester `
git --params "/WindowsTerminal /NoGitLfs /SChannel /NoAutoCrlf /NoShellIntegration" `
github-desktop `
python `
azure-cli `
docker-desktop `
postman `
powerbi --ignore-checksums `
kindle `
azure-data-studio `
sql-server-management-studio `
microsoftazurestorageexplorer `
powertoys `
spotify `
microsoft-teams `
camtasia `
nordvpn `
visualstudio2019enterprise `
dotnetcore-sdk `
office365business `
microsoft-teams `
visualstudio2019-workload-azurebuildtools `
visualstudio2019-workload-netcoretools `
teamviewer

if($Desktop){
    choco install plexmediaserver
    choco install sonarr
    choco install radarr
    choco install sabnzbd
}

# DAPR
powershell -Command "iwr -useb https://raw.githubusercontent.com/dapr/cli/master/install/install.ps1 | iex"
# NB: Docker needs to be running for init to work
dapr init

# VS Code Setup
# Install VS Code Sync
code --install-extension shan.code-settings-sync

New-Item -Path '~\Repositories' -ItemType Directory
New-Item -Path '~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1' -ItemType File
Add-Content -Path '~\.gitconfig' -Value "[user] 
    name = Liam F. O`'Neill 
    email = liamfoneill@outlook.com"

# Powershell Modules
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PackageManagement -Repository PSGallery -Force
Install-Module -Name PowerShellGet -Repository PSGallery -Force
Install-Module -Name posh-git -Force -AllowPrerelease
Install-Module -Name oh-my-posh -Force
Install-Module -Name PSReadLine -AllowPrerelease -Force
Add-Content -Path $PROFILE -Value "Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox"

.\Set-QuickAccess.ps1 -Action "Pin" -Path "c:\Users\$env:USERNAME\Pictures"
.\Set-QuickAccess.ps1 -Action "Pin" -Path "c:\Users\$env:USERNAME\Videos"
.\Set-QuickAccess.ps1 -Action "Pin" -Path "c:\Users\$env:USERNAME\Repositories"
.\Set-QuickAccess.ps1 -Action "Pin" -Path "c:\Users\$env:USERNAME\Documents"
.\Set-QuickAccess.ps1 -Action "Pin" -Path "c:\Users\$env:USERNAME\Downloads"
.\Set-QuickAccess.ps1 -Action "Pin" -Path "c:\Users\$env:USERNAME\Desktop"
.\Set-QuickAccess.ps1 -Action "Pin" -Path "c:\Users\$env:USERNAME"

#Clean Up Desktop
Remove-Item –path ~\Desktop -include *.lnk -Recurse
Remove-Item –path C:\Users\Public\Desktop -include *.lnk -Recurse

$StopWatch.Stop()
$StopWatch.Elapsed()

### MANUAL TASKS ###
<# 
Rename Computer
Configure VS Code Sync with Gist d33ebfe8fe1762c237e5a662e1e58cd1
Initiate VS Code Sync
Install RUDR
Install Visio x64
Install MS Project x64
Log into Azure CLI
Log into Cloud Shell
Create Unix User
Log Into Github
Create Edge Profiles for Work, Personal and Intelion
Install Cascadia Code PL Font from:https://github.com/microsoft/cascadia-code/releases
Move-Location of Videos Folder to .\OneDrive
Move-location of Pictures Folder to .\OneDrive
Copy Windows Terminal profile.json Settings In
Set Visual Studio to open blank project by default
Change Visual Studio save folder to be ~\Repositories
Add Git Logo to ~\Repositories folder
Configure OneDrive + OneDrive for Business
Disable Recycle Bin Icon
Remove suggested items from Quick Access
#>