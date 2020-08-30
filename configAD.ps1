$folder = "Hello from Azure Devops"

echo "Hello from Azure.
Attempting to create folder: $folder..."

Try {
mkdir $env:SystemDrive\"$folder"
echo "The folder "$folder" has been created."
}
Catch {
echo "The folder "$folder" already exists. Skipping..."
}
