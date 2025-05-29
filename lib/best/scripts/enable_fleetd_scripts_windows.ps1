#Requires -RunAsAdministrator

$service = Get-WmiObject -query 'select * from win32_service where name="fleet osquery"'

$binaryPath = $service.PathName
$args = $binaryPath -split " "
if ($args -contains "--enable_scripts") {
  Write-Host "enable scripts found"
} 
