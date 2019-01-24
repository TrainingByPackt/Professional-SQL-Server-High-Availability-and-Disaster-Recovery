# Provision Base VM.
# Base VM is used to create new VMs as and when required.
# Before you run this make sure you enabled hyper-v and downloaded windows server 2012 r2 evaluation edition
param(
[boolean]$isdownload=$false,
[string]$VMpath="C:\VMs\AlwaysOn",
[string]$VMName="DPLBase",
# path to Windows Server 2012 R2 Evaluation Edition ISO file
[string]$DvdPath="C:\VMs\Win2012R2EvalEdition.iso"
)

if((Test-Path -Path $VMpath) -eq $false)
{
    New-Item -Path "C:\VMs" -Name "AlwaysOn" -ItemType "directory"

}
$VHDPath = "$VMpath\$VMName\Virtual Hard Disks\DPLBase.vhdx"
New-VM -Name $VMName -MemoryStartupBytes 1GB -Path C:\VMs\AlwaysOn\ -NewVHDPath $VHDPath -NewVHDSizeBytes 40GB
Set-VM -Name $VMName -ProcessorCount 1 -MemoryMaximumBytes 1GB
Set-VMDvdDrive -VMName $VMName -Path $DvdPath 
Start-VM -Name $VMName

# Get VM Details
Get-VM -Name $VMName

# Next Steps
# Open Hyper-V Manager. Connect to VM and install Windows Server 2012 R2 