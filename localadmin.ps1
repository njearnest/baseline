#----------------------------------------
# Reset and enable local administrator
#----------------------------------------
$BuiltInAdminUser = "administrator"
$UserAccount = Get-LocalUser -Name $BuiltInAdminUser

# set password for local admin
$password = read-host "Password for $BuiltInAdminUser" -AsSecureString
$UserAccount | Set-LocalUser -Password $password 

# enable local admin
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.localaccounts/enable-localuser?view=powershell-5.1
$UserAccount | Enable-LocalUser

# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.localaccounts/set-localuser?view=powershell-5.1
$UserAccount | Set-LocalUser -PasswordNeverExpires $true 
