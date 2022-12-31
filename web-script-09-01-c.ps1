# Set execution policy
Set-ExecutionPolicy Unrestricted -Force
New-Item -ItemType directory -Path 'C:\temp'

# Install IIS and Web Management Tools
Import-Module ServerManager
install-windowsfeature web-server, web-webserver -IncludeAllSubFeature
install-windowsfeature web-mgmt-tools

# Download the code for our web application.
Set-Location -Path C:\inetpub\wwwroot
$shell_app = new-object -com shell.application
(New-Object System.Net.WebClient).DownloadFile("https://github.com/ahmadzahoory/gcpcev2/raw/main/lab-09-01-code-c.zip", (Get-Location).Path + "\lab-09-01-code-c.zip")
$zipfile = $shell_app.Namespace((Get-Location).Path + "\lab-09-01-code-c.zip")
$destination = $shell_app.Namespace((Get-Location).Path)
$destination.copyHere($zipfile.items())
New-WebApplication -Name netapp -PhysicalPath c:\inetpub\wwwroot\gcp-website -Site "Default Web Site" -force

# Open the ICMP port rule.
netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" dir=in action=allow enable=yes protocol=icmpv4:8,any

# Create user & set password and add the group
$sec_pass = ConvertTo-SecureString -String "lab-password@123" -AsPlainText -Force
New-LocalUser -Name gcpadmin -PasswordNeverExpires -Password $sec_pass
Add-LocalGroupMember -Group Administrators -Member gcpadmin

#End
