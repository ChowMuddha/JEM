Write-Host "JEM Installer Script"
""
Start-Sleep -s 2
""
Write-Host "Used to assist in obtaining installs for standard or key applications for JEM Staff"
""
Start-Sleep -s 2
""
Write-Host "Please note some of these files are stored on JEM-CH-FTP"
""
Start-Sleep -s 2
""
Write-Host "Creating folder JEM on C"
""
New-Item -Path 'C:\JEM\' -ItemType Directory
""
Write-Host "Folder Created"
""
Start-Sleep -s 2
Write-Host "Downloading ControlCenterInstaller"
""
Start-Sleep -s 1
""
Copy-Item -Path \\Jem-ch-ftp\ftp\JEMInstallers\ControlCenterInstaller.exe -Destination C:\JEM\ControlCenterInstaller.exe;
""
Write-Host "Download Complete"
""
Start-Sleep -s 1
""
Write-Host "Downloading GlobalProtect"
""
Start-Sleep -s 1
""
Copy-Item -Path \\Jem-ch-ftp\ftp\JEMInstallers\GlobalProtect64.msi -Destination C:\JEM\GlobalProtect64.msi;
""
Write-Host "Download Complete"
""
Start-Sleep -s 1
""
Write-Host "Downloading O365 Installer"
""
Start-Sleep -s 1
""
Write-Host "Downloading O365 Installer"
""
Start-Sleep -s 1
Copy-Item -Path \\Jem-ch-ftp\ftp\JEMInstallers\readerdc64_en_xa_crd_install.exe -Destination C:\JEM\readerdc64_en_xa_crd_install.exe;
Write-Host "Download Complete"
Copy-Item -Path \\Jem-ch-ftp\ftp\JEMInstallers\OfficeSetup.exe -Destination C:\JEM\OfficeSetup.exe;
""
Write-Host "Download Complete"
""
Start-Sleep -s 1
""
Write-Host "Downloading Teams Installer"
""
Start-Sleep -s 1
""
Copy-Item -Path \\Jem-ch-ftp\ftp\JEMInstallers\Teams_windows_x64.exe -Destination C:\JEM\Teams_windows_x64.exe;
""
Write-Host "Download Complete"
""
Start-Sleep -s 1
""
Write-Host "Downloading JEM Bookmarks"
""
Start-Sleep -s 1
""
Copy-Item -Path \\Jem-ch-ftp\ftp\JEMInstallers\JEMStandardBookmarks.html -Destination C:\JEM\JEMStandardBookmarks.html;
""
Write-Host "Download Complete"
""
Start-Sleep -s 1
""
Write-Host "Downloading Micollab Installer"
""
Start-Sleep -s 1
""
Copy-Item -Path \\Jem-ch-ftp\ftp\JEMInstallers\micollab_pc.msi -Destination C:\JEM\micollab_pc.msi;
""
Write-Host "Download Complete"
""
Start-Sleep -s 1
""
Copy-Item -Path \\Jem-ch-ftp\ftp\JEMInstallers\putty-64bit-0.76-installer.msi -Destination C:\JEM\putty-64bit-0.76-installer.msi;
""
Write-Host "Downloading putty"
""
Start-Sleep -s 1
""
Write-Host "Download Complete"
""
Start-Sleep -s 1
""
Copy-Item -Path \\Jem-ch-ftp\ftp\JEMInstallers\FortiClientVPNOnlineInstaller.exe -Destination C:\JEM\FortiClientVPNOnlineInstaller.exe;
""
Write-Host "Downloading FortiVPNClient"
""
Start-Sleep -s 1
""
Write-Host "Download Complete"
""
Start-Sleep -s 1
Copy-Item -Path \\Jem-ch-ftp\ftp\JEMInstallers\mRemoteNG-Installer-1.76.20.24615.msi -Destination C:\JEM\mRemoteNG-Installer-1.76.20.24615.msi;
""
Write-Host "Downloading mRemoteNG"
""
Start-Sleep -s 1
""
Write-Host "Download Complete"
""
Start-Sleep -s 1
Invoke-WebRequest -Uri "https://university.connectwise.com/install/2022.1.0/ConnectWise-Manage-Internet-Client-x64.msi" -OutFile "C:\JEM\ConnectWise-Manage-Internet-Client-x64.msi"
""
Write-Host "Downloading of Connectwise Manage Complete"
""
Start-Sleep -s 1
""
Invoke-WebRequest -Uri "https://ninite.com/7zip-chrome-firefox-notepadplusplus-vlc/ninite.exe" -OutFile "C:\JEM\ninite.exe";
""
Write-Host "Downloading of Ninite Installer Complete"
""
Start-Sleep -s 1
""
Write-Host "JEMInstallers Download Completed, Enjoy :)"
Start-Sleep -s 2
""
Write-Host "If you need files updated or want additional installers added to the script please lodge a ticket to development@jem.com.au"
Start-Sleep -s 5
