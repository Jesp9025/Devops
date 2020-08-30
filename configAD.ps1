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
