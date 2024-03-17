# Define the base registry path
$baseRegistryPath = "HKLM:\HARDWARE\DESCRIPTION\System\CentralProcessor\"

# Get the list of existing folders under the base registry path
$existingFolders = Get-ChildItem -Path $baseRegistryPath | Where-Object { $_.PSChildName -match '^\d+$' } | ForEach-Object { $_.PSChildName }

# Prompt the user to enter the new processor name
$newProcessorName = Read-Host "Enter the new processor name"

foreach ($folder in $existingFolders) {
    $registryPath = "$baseRegistryPath$folder"
    
    # Get the current value of ProcessorNameString
    $currentValue = Get-ItemProperty -Path $registryPath | Select-Object -ExpandProperty ProcessorNameString

    # Modify the value if needed
    if ($currentValue -ne $newProcessorName) {
        Set-ItemProperty -Path $registryPath -Name ProcessorNameString -Value $newProcessorName
        Write-Host "Value updated for  Processor Name $folder"
    } else {
        Write-Host "Value already up-to-date for Processor Name $folder"
    }
}
