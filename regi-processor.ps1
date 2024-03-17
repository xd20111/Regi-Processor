$baseRegistryPath = "HKLM:\HARDWARE\DESCRIPTION\System\CentralProcessor\"

$existingFolders = Get-ChildItem -Path $baseRegistryPath | Where-Object { $_.PSChildName -match '^\d+$' } | ForEach-Object { $_.PSChildName }

$newProcessorName = Read-Host "Enter the new processor name"

foreach ($folder in $existingFolders) {
    $registryPath = "$baseRegistryPath$folder"

    $currentValue = Get-ItemProperty -Path $registryPath | Select-Object -ExpandProperty ProcessorNameString

    if ($currentValue -ne $newProcessorName) {
        Set-ItemProperty -Path $registryPath -Name ProcessorNameString -Value $newProcessorName
        Write-Host "Value updated for  Processor Name $folder"
    } else {
        Write-Host "Value already up-to-date for Processor Name $folder"
    }
}
