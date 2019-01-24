# Provision 4 VMs DPLDC, DPLPR, DPLHA & DPLDR
param(
    [string]$BaseVMPath='C:\VMs\DPLBaseExport\DPLBase\Virtual Machines\8829DF48-1187-4C79-8502-B5E21F19E133.vmcx',
    [string]$NewVMBasePath="C:\VMs\AlwaysOn",
    [string]$BaseVMName="DPLBase"
)

# Create Hyper-V switches
$PrivateSwitch = Get-VMSwitch -Name DPLPrivate -ErrorAction Ignore
if(!$PrivateSwitch)
{
    New-VMSwitch -Name DPLPrivate -SwitchType Private
}
<#
$InternalSwitch = Get-VMSwitch -Name DPLInternal
if(!$InternalSwitch)
{
    New-VMSwitch -Name DPLInternal -SwitchType Internal
}
#>
$vms = @("DPLDC","DPLPR","DPLHA","DPLDR")
$vms | ForEach-Object { 
$NewVMName = $_
Write-Host "Creating $NewVMName..."
$NewVMPath = "$NewVMBasePath\$NewVMName" 
$vmexists = Get-VM -Name $NewVMName -ErrorAction Ignore
if(!$vmexists)
{
    $Impvm = Import-VM -Path $BaseVMPath -VirtualMachinePath $NewVMPath  -VhdDestinationPath "$NewVMPath\Virtual Hard Disks" -SnapshotFilePath "$NewVMPath\Snapshot" -Copy -GenerateNewId
    if($Impvm)
    {
        Set-VM -Name $BaseVMName -NewVMName $NewVMName
        Get-VMSwitch DPLPrivate | Connect-VMNetworkAdapter -VMName $NewVMName
        Get-VM -Name $NewVMName | Start-VM -Verbose
    }
}
}