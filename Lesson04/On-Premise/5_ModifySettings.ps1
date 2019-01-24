param(
    [string]$VmName,
    [string]$IPAddress
)
<#
DPLDC: 192.168.1.20
DPLPR: 192.168.1.3
DPLHA: 192.168.1.4
DPLDR: 192.168.1.5
#>
# disable firewall
Write-Host "Disabling firewall..."
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

$NetworkProfile = Get-NetConnectionProfile
#set network profile to public
Set-NetConnectionProfile -InterfaceAlias $NetworkProfile.InterfaceAlias -NetworkCategory Public

# Change IP Address
Write-Host "Setting IPAddress..."

#$IpAdd = (Get-NetIPAddress -InterfaceAlias $NetworkProfile.InterfaceAlias -AddressFamily IPv4).IPAddress
$IPAddress.split(',').trim() | foreach-object {
$ipa =  $_
New-NetIPAddress -IPAddress $ipa -DefaultGateway 192.168.1.1 -AddressFamily IPv4 -PrefixLength 24 -InterfaceAlias $NetworkProfile.InterfaceAlias
}


# Change the computer name and restart 
if($env:COMPUTERNAME -ne $VmName)
{
    Write-Host "Renaming Computer...."
    Rename-Computer -ComputerName $env:COMPUTERNAME -NewName $VmName
    Write-Host "Computer will restart in 10 seconds.."
	Start-Sleep -Seconds 10
    Restart-Computer
}


