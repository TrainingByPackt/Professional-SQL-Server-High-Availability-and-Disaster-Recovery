param(
[string]$DownloadLocation="C:\VMs"
)

Set-ExecutionPolicy unrestricted

#download windows server 2012 R2 evaluation edition
$DownloadURL = "https://download.microsoft.com/download/B/8/3/B839AD7D-DDC7-4212-9643-28E148251DC1/SSMS-Setup-ENU.exe"
Start-BitsTransfer -Source $DownloadURL -Destination "$DownloadLocation\SSMS-Setup-ENU.exe"


