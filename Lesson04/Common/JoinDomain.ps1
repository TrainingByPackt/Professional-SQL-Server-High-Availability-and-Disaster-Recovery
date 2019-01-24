# Join to the domain created earlier
# to be run for all replicas from within the VM.
param (
    [string]$domain = "dpl.com",
    [string]$domainadminpassword = 'Awesome@1234',
    [string]$DNSIPAddress = "192.168.1.20"
    
)

$password = $domainadminpassword | ConvertTo-SecureString -asPlainText -Force
$username = "$domain\Administrator" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password) 

$InterfaceAlias = (Get-NetConnectionProfile -ErrorAction Stop).InterfaceAlias 
Set-DnsClientServerAddress -InterfaceAlias $InterfaceAlias -ServerAddresses $DNSIPAddress -ErrorAction Stop
Add-Computer -DomainName $domain -Credential $credential -ErrorAction Stop

Write-Host "Your Computer will restart in 10 seconds..."
Start-Sleep -Seconds 10
Restart-Computer