$folder = "Hello from Azure Devops"

echo "Hello from Azure.
Attempting to create folder: $folder..."

Try {
mkdir $env:SystemDrive\"$folder"
echo "The following folder has been created: $folder"
}
Catch {
echo "$folder already exists. Skipping..."
}

# Disable Automatic Windows Update
$reg_path = "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU"
if (-Not (Test-Path $reg_path)) { New-Item $reg_path -Force }
Set-ItemProperty $reg_path -Name NoAutoUpdate -Value 1
Set-ItemProperty $reg_path -Name AUOptions -Value 3
echo "Auto Windows Update has been disabled!"

Install-Module -Name PSWindowsUpdate –Force
Download-WindowsUpdate -KB KB4571462 -AcceptAll
Install-WindowsUpdate -KB KB4571462 -AcceptAll -AutoReboot
