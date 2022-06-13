#JEM Agent Install
Set-ExecutionPolicy RemoteSigned -Force

#Creates Temp Directory on C:\
New-Item -Path 'C:\JEM\' -ItemType Directory


Add-Type -AssemblyName Microsoft.VisualBasic
$JEMURL = [Microsoft.VisualBasic.Interaction]::InputBox('JEM Agent URL:', 'JEM Agent Install', "Paste JEM Agent URL Here")

#Will need to generate new agent download URL and update below based offsite location
Invoke-WebRequest -Uri "$JEMURL" -OutFile "C:\JEM\JEMAgent.MSI";

#Installs JEM Agent
msiexec /i C:\JEM\JEMAgent.MSI /quiet /qn /norestart /log c:\AgentInstall.log

#Removes Files from temp directory and files
$RemovalPath = "C:\JEM\JEMAgent.MSI"
Get-ChildItem  -Path $RemovalPath -Recurse  | Remove-Item -Force -Recurse
Remove-Item $RemovalPath -Force -Recurse

exit
