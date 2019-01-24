$servers = @("DPLPR","DPLHA","DPLDR")
$servers | ForEach-Object { 
$server = $_
Write-Host "Installing Failover-Clustering feature on $server.."
Install-WindowsFeature -Name "Failover-Clustering" -IncludeManagementTools -ComputerName $server
}