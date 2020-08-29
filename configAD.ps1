#Install windows feature: 
Install-WindowsFeature -Name AD-Domain-Services
#Save password in variable for Safe Mode: 
$Password = Read-Host -Prompt   ‘Testpassword123’ -AsSecureString
#Set password of local administrator:
$username = Read-Host "Type the username:";
$user = [ADSI]"WinNT://./$username";
$user.SetPassword("Testpassword123");
#Add new forest (aka create your domain):
Install-ADDSForest -CreateDnsDelegation:$false -DatabasePath C:\Windows\NTDS -DomainMode WinThreshold -DomainName burger.local -DomainNetbiosName burger -ForestMode WinThreshold -InstallDns:$true -LogPath C:\Windows\NTDS -NoRebootOnCompletion:$true -SafeModeAdministratorPassword $Password -SysvolPath C:\Windows\SYSVOL -Force:$true
