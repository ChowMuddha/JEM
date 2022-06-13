#JEM Agent Removal and Re-install
Set-ExecutionPolicy Unrestricted -Force

#Creates Temp Directory on C:\
New-Item -Path 'C:\JEM\' -ItemType Directory

#Download Automate Uninstaller
Invoke-WebRequest -Uri "https://s3.amazonaws.com/assets-cp/assets/Agent_Uninstaller.zip" -OutFile C:\JEM\Agent_Uninstall.zip;
#Extract Uninstaller
Expand-Archive -LiteralPath 'C:\JEM\Agent_Uninstall.zip' -DestinationPath C:\JEM\
#Delete .zip file
$RemovalPath = "C:\JEM\Agent_Uninstall.zip"
Remove-Item $RemovalPath -Force -Recurse


Add-Type -AssemblyName Microsoft.VisualBasic
$JEMURL = [Microsoft.VisualBasic.Interaction]::InputBox('JEM Agent URL:', 'JEM Agent Redployment', "Paste JEM Agent URL Here")

#Will need to generate new agent download URL and update below based offsite location
Invoke-WebRequest -Uri "$JEMURL" -OutFile "C:\JEM\JEMAgent.MSI";

#Executes silent removal of old Dooleys Agent
Invoke-Command -ScriptBlock {Start-Process "C:\JEM\Agent_Uninstall.exe" -ArgumentList "/q" -Wait} 
Start-Sleep -s 15

#Installs JEM Agent
msiexec /i C:\JEM\JEMAgent.MSI /quiet /qn /norestart /log c:\AgentMigration.log

#Removes Files from temp directory and files
$RemovalPath = "C:\JEM\Agent_Uninstaller.zip"
Get-ChildItem  -Path $RemovalPath -Recurse  | Remove-Item -Force -Recurse
Remove-Item $RemovalPath -Force -Recurse

exit