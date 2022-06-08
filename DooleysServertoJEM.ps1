#Dooleys to JEM Automate Migration
Set-ExecutionPolicy Unrestricted -Force

#Removed old instances of control
#Will need to add mutiple lines for Screenconnect depending on how many versions or instances are installed on the PC
#wmic product where name="ScreenConnect Client (xxxxxxxxxxxxxxxx)" call uninstall /nointeractive

#Creates Temp Directory on C:\
New-Item -Path 'C:\JEM\' -ItemType Directory

#Download Automate Uninstaller
Invoke-WebRequest -Uri "https://s3.amazonaws.com/assets-cp/assets/Agent_Uninstaller.zip" -OutFile C:\JEM\Agent_Uninstall.zip;
#Extract Uninstaller
Expand-Archive -LiteralPath 'C:\JEM\Agent_Uninstall.zip' -DestinationPath C:\JEM\
#Delete .zip file
$RemovalPath = "C:\JEM\Agent_Uninstall.zip"
Remove-Item $RemovalPath -Force -Recurse

#Will need to generate new agent download URL and update below based offsite location
Invoke-WebRequest -Uri "AutomateAgentDeploymentToken" -OutFile "C:\JEM\Dooleys_ServersJEM.MSI";

#Executes Silent removal of old Dooleys Agent
Invoke-Command -ScriptBlock {Start-Process "C:\JEM\Agent_Uninstall.exe" -ArgumentList "/q" -Wait} 
Start-Sleep -s 15

#Installs JEM Agent
msiexec /i C:\JEM\Dooleys_ServersJEM.MSI /quiet /qn /norestart /log c:\AgentMigration.log

#Removes Files from temp directory and files
$RemovalPath = "C:\JEM\Agent_Uninstaller.zip"
Get-ChildItem  -Path $RemovalPath -Recurse  | Remove-Item -Force -Recurse
Remove-Item $RemovalPath -Force -Recurse

exit
