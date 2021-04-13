# VS Enterprise package has a bug and needs to be run twice to work
choco install visualstudio2019enterprise
choco install visualstudio2019enterprise

#Clean Up Desktop
Remove-Item -path ~\Desktop -include *.lnk -Recurse

#Some Problem with this
Remove-Item -path C:\Users\Public\Desktop -include *.lnk -Recurse

#Flatten Start Menu
.\Organise-Startmenu.ps1