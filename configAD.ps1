echo "Hello Mr. Good day, sir!"
$folder = "Hello from Azure Devops"
Try {
mkdir $env:SystemDrive\"$folder"
}
Catch {
echo "The folder $folder already exists. Skipping..."
}
