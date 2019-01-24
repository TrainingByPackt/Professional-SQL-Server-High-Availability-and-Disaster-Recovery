param(
    [string]$VMName,
    [string]$VMBasePath="C:\VMs\AlwaysOn",
    [bool]$DeleteVMDir=$true,
    [bool]$RemoveAll
)
if($RemoveAll)
{
    $vms = @("DPLDC","DPLPR","DPLHA","DPLDR")
}else {
    $vms=$VMName
}

$vms | ForEach-Object { 
$VMName = $_
Write-Host "Deleting $VMName..."
$VMPath = "$VMBasePath\$VMName"
$VM = Get-VM -Name $VMName 
if($VM.state -eq "Running")
{
    Stop-VM $VMName
}
Remove-VM -Name $VMName
Remove-Item $VMPath -Recurse -Force
}
