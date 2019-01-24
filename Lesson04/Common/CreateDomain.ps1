# Create a domain on DPLDC 
param
(
    [string]$DomainName="DPL.com"
)

#Change the DNS setting to 127.0.0.1
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 127.0.0.1

#Install Active Directory Domain Services
Install-WindowsFeature AD-Domain-Services

#Install domain services and register a domain
Import-Module ADDSDeployment 
# Prompts for SafeModeAdministratorPassword 
Install-ADDSForest -DomainName $DomainName


