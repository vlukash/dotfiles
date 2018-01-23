. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force

Install-PackageProvider -Name NuGet -Force
Import-PackageProvider NuGet -Force

# Windows Settings
Disable-BingSearch
Disable-GameBarTips

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions
Set-TaskbarOptions -Size Small -Lock -Combine Never

# Enable-RemoteDesktop
#netsh advfirewall firewall add rule name="Remote Desktop" dir=in localport=3389 protocol=TCP action=allow

install-module PsReadLine -Force
PowerShellGet\Install-Module posh-git -Force

choco install vim -y
choco install cmder -y