Set-ExecutionPolicy Unrestricted -Force
New-Item -ItemType directory -Path 'C:\temp'
Import-Module ServerManager
install-windowsfeature web-server, web-webserver -IncludeAllSubFeature
install-windowsfeature web-mgmt-tools
Set-Location -Path C:\inetpub\wwwroot
$shell_app = new-object -com shell.application
(New-Object System.Net.WebClient).DownloadFile("https://github.com/ahmadzahoory/gcpcev2/raw/main/lab-09-01-code-a.zip", (Get-Location).Path + "\lab-09-01-code-a.zip")
$zipfile = $shell_app.Namespace((Get-Location).Path + "\lab-09-01-code-a.zip")
$destination = $shell_app.Namespace((Get-Location).Path)
$destination.copyHere($zipfile.items())
New-WebApplication -Name netapp -PhysicalPath c:\inetpub\wwwroot\gcp-website -Site "Default Web Site" -force
netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" dir=in action=allow enable=yes protocol=icmpv4:8,any
function Disable-IEESC
{
    $AdminKey = “HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}”
    Set-ItemProperty -Path $AdminKey -Name “IsInstalled” -Value 0
    $UserKey = “HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}”
    Set-ItemProperty -Path $UserKey -Name “IsInstalled” -Value 0
    Stop-Process -Name Explorer
    Write-Host “IE Enhanced Security Configuration (ESC) has been disabled.” -ForegroundColor Green
    }
Disable-IEESC
