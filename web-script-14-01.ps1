Set-ExecutionPolicy Unrestricted -Force
New-Item -ItemType directory -Path 'C:\temp'
Import-Module ServerManager
install-windowsfeature web-server, web-webserver -IncludeAllSubFeature
install-windowsfeature web-mgmt-tools
Set-Location -Path C:\inetpub\wwwroot
$shell_app = new-object -com shell.application
(New-Object System.Net.WebClient).DownloadFile("https://github.com/ahmadzahoory/gcpcev2/raw/main/lab-12-01-code.zip", (Get-Location).Path + "\lab-12-01-code.zip")
$zipfile = $shell_app.Namespace((Get-Location).Path + "\lab-12-01-code.zip")
$destination = $shell_app.Namespace((Get-Location).Path)
$destination.copyHere($zipfile.items())
New-WebApplication -Name netapp -PhysicalPath c:\inetpub\wwwroot\vnet-app-website -Site "Default Web Site" -force
$sec_pass = ConvertTo-SecureString -String "lab-password@123" -AsPlainText -Force
New-LocalUser -Name gcpadmin -PasswordNeverExpires -Password $sec_pass
Add-LocalGroupMember -Group Administrators -Member gcpadmin
