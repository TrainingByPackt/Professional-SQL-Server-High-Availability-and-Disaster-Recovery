param(
[string]$DownloadLocation="C:\VMs\"
)

Set-ExecutionPolicy unrestricted

#download windows server 2012 R2 evaluation edition
$DownloadURL = "https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2016.bak"
Start-BitsTransfer -Source $DownloadURL -Destination "$DownloadLocation\AdventureWorks2016.bak"

$DownloadURL = "https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Full.bak"
Start-BitsTransfer -Source $DownloadURL -Destination "$DownloadLocation\WideWorldImporters-Full.bak"



