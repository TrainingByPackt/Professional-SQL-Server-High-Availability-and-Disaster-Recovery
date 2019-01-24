# create the backup share folder on the primary instance
New-Item "C:\Logshipshare" -Type directory

#share the folder with DPL\Administrator user.
#you can share it with anyother user. Just replace the user name in read access parameter
New-SmbShare -Name "Logshipshare" -Path "C:\Logshipshare" -ReadAccess "DPL\Administrator"

#create the local folder at the secondary instance.
#the sql agent copy job at the secondary instance
#will copy the log backups from the backup share 
#\\DPLPR\Logshipshare to this local folder. 
PS C:\Users\Administrator.DPL> Invoke-Command -ComputerName DPLHA -ScriptBlock {New-Item -Path "C:\DPLPRTlogs" -Type Directory}

#the invoke-command cmdlet requries relevant credentials to connect 
#and execute scriptblock on another computer.
#The two machines DPLPR and DPLHA are in same domain DPL
#and the command is executed under the domain admin DPL\Administrator
#therefore additional credentials are not required. 