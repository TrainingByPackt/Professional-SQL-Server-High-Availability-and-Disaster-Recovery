param(
[string]$DownloadLocation="C:\VMs"
)

Set-ExecutionPolicy unrestricted

#download windows server 2012 R2 evaluation edition
if((Test-Path -Path $DownloadLocation) -eq $false)
{
    New-Item -Path "C:\" -Name "VMs" -ItemType "directory"

}
$DownloadURL = "http://download.microsoft.com/download/6/2/A/62A76ABB-9990-4EFC-A4FE-C7D698DAEB96/9600.17050.WINBLUE_REFRESH.140317-1640_X64FRE_SERVER_EVAL_EN-US-IR3_SSS_X64FREE_EN-US_DV9.ISO"
Start-BitsTransfer -Source $DownloadURL -Destination "$DownloadLocation\Win2012R2EvalEdition.iso "

