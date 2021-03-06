$StopWatch = New-Object -TypeName System.Diagnostics.Stopwatch
$StopWatch.Start()

Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco feature enable -n=allowGlobalConfirmation

if (!(Test-Path -Path '~\Repositories')) { 
    New-Item -ItemType Directory -Path '~\Repositories' -Force 
}

# Windows Features
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Containers-DisposableClientVM -All -NoRestart

.\Set-QuickAccess.ps1 -Action "Pin" -Path "c:\Users\$env:USERNAME\Pictures"
.\Set-QuickAccess.ps1 -Action "Pin" -Path "c:\Users\$env:USERNAME\Videos"
.\Set-QuickAccess.ps1 -Action "Pin" -Path "c:\Users\$env:USERNAME\Repositories"
.\Set-QuickAccess.ps1 -Action "Pin" -Path "c:\Users\$env:USERNAME\Documents"
.\Set-QuickAccess.ps1 -Action "Pin" -Path "c:\Users\$env:USERNAME\Downloads"
.\Set-QuickAccess.ps1 -Action "Pin" -Path "c:\Users\$env:USERNAME\Desktop"
.\Set-QuickAccess.ps1 -Action "Pin" -Path "c:\Users\$env:USERNAME"
# Install all Choco Apps
choco install `
bitwarden-cli `
vscode `
terraform `
pulumi `
kubernetes-cli `
kubernetes-helm `
minikube `
draft `
# aks-engine `
az.powershell `
powershell-core `
pester `
git --params "/WindowsTerminal /NoGitLfs /SChannel /NoAutoCrlf /NoShellIntegration" `
github-desktop `
python `
azure-cli `
docker-desktop `
postman `
kindle `
azure-data-studio `
sql-server-management-studio `
microsoftazurestorageexplorer `
powertoys `
spotify `
microsoft-teams `
camtasia `
nordvpn `
dotnetcore-sdk --version=5.0.100 `
office365business `
microsoft-teams `
windows-admin-center `
golang `
jmeter `
ChocolateyGUI `
linkshellextension

# DAPR
powershell -Command "iwr -useb https://raw.githubusercontent.com/dapr/cli/master/install/install.ps1 | iex"
# NB: Docker needs to be running for init to work
dapr init

Add-Content -Path '~\.gitconfig' -Value "[user] 
    name = Liam F. O`'Neill 
    email = liamfoneill@outlook.com"

$StopWatch.Stop()
$StopWatch.Elapsed

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
Add git.ico Logo to ~\Repositories folder
Configure OneDrive + OneDrive for Business
Disable Recycle Bin Icon
Remove suggested items from Quick Access
Install Post-Git, oh-my-posh etc on PowerShell 7
#>
