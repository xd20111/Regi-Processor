# Define the base registry path
$baseRegistryPath = "HKLM:\HARDWARE\DESCRIPTION\System\CentralProcessor\"

# Define the range of folders (0 to 9)
$foldersRange = 0..9

foreach ($folder in $foldersRange) {
    $registryPath = "$baseRegistryPath$folder"
    
    # Check if the registry key exists
    if (Test-Path $registryPath) {
        # Get the current value of ProcessorNameString
        $currentValue = Get-ItemProperty -Path $registryPath | Select-Object -ExpandProperty ProcessorNameString

        # Modify the value if needed
        $newValueData = "NewProcessorName"
        if ($currentValue -ne $newValueData) {
            Set-ItemProperty -Path $registryPath -Name ProcessorNameString -Value $newValueData
            Write-Host "Value updated for folder $folder"
        } else {
            Write-Host "Value already up-to-date for folder $folder"
        }
    } else {
        Write-Host "Registry key not found for folder $folder"
    }
}
