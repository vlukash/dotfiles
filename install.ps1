$homeDir = $env:USERPROFILE
$dotfilesDir = $pwd.Path

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

#Install-module PsReadLine -Force
Install-Module posh-git -Force
Install-Module z -Force

cinst vim -y
cinst cmder -y
cinst curl -y
cinst python2 -y

cinst ditto -y
cinst sharpkeys -y

cinst keepass -y

cinst notepadplusplus -y
cinst visualstudiocode -y
cinst kdiff3 -y

cinst 7zip.install -y

# Creating vim directories
mkdir -p $homeDir\.vim-tmp -Force
mkdir -p $homeDir\.vim\undodir -Force
mkdir -p $homeDir\.vim\autoload -Force
mkdir -p $homeDir\vimfiles\autoload -Force

#Installing vim-plug
& curl.exe -kfLo $homeDir\vimfiles\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vimrc symlink
New-Item -Path $home\_vimrc -ItemType SymbolicLink -Value $dotfilesDir\vim\_vimrc -Force

# gitconfig symlink
New-Item -Path $home\.gitconfig -ItemType SymbolicLink -Value $dotfilesDir\git\gitconfig.symlink -Force

# ack symlink
New-Item -Path $home\.tern-config -ItemType SymbolicLink -Value $dotfilesDir\tern\.tern-config -Force

# Remap CapsLock -> Ctrl
$hexified = "00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00".Split(',') | % { "0x$_"};
$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout';
New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified);