# Enable Hyper-V

$Enabled = Get-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V -Online 

if(!$Enabled)
{ 
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All 
}

