$folder = "Hello from Azure Devops"


#Install Update Module
Install-Module -Name PSWindowsUpdate –Force


#Download the update
Download-WindowsUpdate -KB KB4571462 -AcceptAll -Force -AutoReboot


#Install the update
Install-WindowsUpdate -KB KB4571462 -AcceptAll -Force -AutoReboot


# Disable Automatic Windows Update
$reg_path = "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU"
if (-Not (Test-Path $reg_path)) { New-Item $reg_path -Force }
Set-ItemProperty $reg_path -Name NoAutoUpdate -Value 1
Set-ItemProperty $reg_path -Name AUOptions -Value 3

