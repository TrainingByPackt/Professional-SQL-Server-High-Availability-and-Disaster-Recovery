# Provision 4 VMs DPLDC, DPLPR, DPLHA & DPLDR
param(
    [string]$SQLISOPath
 )


$vms = @("DPLPR","DPLHA","DPLDR")
$vms | ForEach-Object { 
$VMName = $_
Set-VMDvdDrive -VMName $VMName -Path $SQLISOPath
}