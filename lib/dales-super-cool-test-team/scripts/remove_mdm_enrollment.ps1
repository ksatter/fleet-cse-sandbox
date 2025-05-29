$enrollmentsPath = "HKLM:\Software\Microsoft\Enrollments"

function Remove-AllRegistryKeys {
    param (
        [Parameter(Mandatory=$true)]
        [string]$RegistryPath
    )

    # Check if the registry path exists
    if (Test-Path $RegistryPath) {
        # Get all subkeys
        $subkeys = Get-ChildItem -Path $RegistryPath -ErrorAction SilentlyContinue

        if ($subkeys) {
            # Loop through and remove each subkey
            foreach ($subkey in $subkeys) {
                Remove-Item -Path $subkey.PSPath -Recurse -Force
                Write-Host "Registry key $($subkey.PSPath) deleted."
            }
        } else {
            Write-Host "No subkeys found under $RegistryPath."
        }
    } else {
        Write-Host "Registry path $RegistryPath does not exist."
    }
}

# Call the function to remove all keys
Remove-AllRegistryKeys -RegistryPath $enrollmentsPath

$status = $LASTEXITCODE
Write-Host "Exit Code: $status"