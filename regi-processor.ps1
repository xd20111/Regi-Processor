
$baseRegistryPath = "HKLM:\HARDWARE\DESCRIPTION\System\CentralProcessor\"

$existingFolders = Get-ChildItem -Path $baseRegistryPath | Where-Object { $_.PSChildName -match '^\d+$' } | ForEach-Object { $_.PSChildName }

foreach ($folder in $existingFolders) {
    $registryPath = "$baseRegistryPath$folder"
    
    $currentValue = Get-ItemProperty -Path $registryPath | Select-Object -ExpandProperty ProcessorNameString


    $newValueData = "Update V2"
    if ($currentValue -ne $newValueData) {
        Set-ItemProperty -Path $registryPath -Name ProcessorNameString -Value $newValueData
        Write-Host "Value updated for ProcessorNameString $folder"
    } else {
        Write-Host "Value already up-to-date for ProcessorNameString $folder"
    }
}
