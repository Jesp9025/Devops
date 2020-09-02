$folder = "Hello from Azure Devops"
$update = "KB4571462"

#Install Update Module
Install-Module -Name PSWindowsUpdate –Force
echo "Module has been installed."

#Download the update
Download-WindowsUpdate -KB $update -AcceptAll -Force -AutoReboot
echo "The update: "$update" has been downloaded."

#Install the update
Install-WindowsUpdate -KB $update -AcceptAll -Force -AutoReboot
echo "The update: "$update" has been installed."

# Disable Automatic Windows Update
$reg_path = "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU"
if (-Not (Test-Path $reg_path)) { New-Item $reg_path -Force }
Set-ItemProperty $reg_path -Name NoAutoUpdate -Value 1
Set-ItemProperty $reg_path -Name AUOptions -Value 3
echo "Auto Windows Update has been disabled!"
