#Requires -RunAsAdministrator

Set-ExecutionPolicy Bypass -Scope Process -Force

# install chocolatey if not installed
if (!(Test-Path -Path "$env:ProgramData\Chocolatey")) {
  Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Ask the user if they want to install general packages
$gen_answer = Read-Host "Do you want to install packages listed in \packages\general_packages.txt? (y/n)"
# Ask the user if they want to install dev packages
$dev_answer = Read-Host "Do you want to install packages listed in \packages\dev_packages.txt? (y/n)"
# Ask the user if they want to install game packages
$game_answer = Read-Host "Do you want to install packages listed in .\packages\game_packages.txt? (y/n)"

if ($gen_answer -eq "y") {
    # for each package in the list run install
    Get-Content "C:\install_choco_with_packages_script\packages\general_packages.txt" | ForEach-Object{($_ -split "\r\n")[0]} | ForEach-Object{choco install -y $_}
  }

if ($dev_answer -eq "y") {
    # for each package in the list run install
    Get-Content "C:\install_choco_with_packages_script\packages\dev_packages.txt" | ForEach-Object{($_ -split "\r\n")[0]} | ForEach-Object{choco install -y $_}
  }

if ($game_answer -eq "y") {
    # for each package in the list run install
    Get-Content "C:\install_choco_with_packages_script\packages\game_packages.txt" | ForEach-Object{($_ -split "\r\n")[0]} | ForEach-Object{choco install -y $_}
  }
