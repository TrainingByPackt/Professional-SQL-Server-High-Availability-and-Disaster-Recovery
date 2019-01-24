# Remove Windows Server 2012 R2 ISO Image from the VM DVD Drive
Get-VMDvdDrive -VMName DPLDC -ControllerNumber 1 | Remove-VMDvdDrive -ErrorAction Ignore
Get-VMDvdDrive -VMName DPLPR -ControllerNumber 1 | Remove-VMDvdDrive -ErrorAction Ignore
Get-VMDvdDrive -VMName DPLHA -ControllerNumber 1 | Remove-VMDvdDrive -ErrorAction Ignore
Get-VMDvdDrive -VMName DPLDR -ControllerNumber 1 | Remove-VMDvdDrive -ErrorAction Ignore
