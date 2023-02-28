get-package "*Dell SupportAssist*" | Uninstall-Package
#get-package "*Dell Command*" | Uninstall-Package
get-package "*Dell Power*" | Uninstall-Package
get-package "*Dell Digital*" | Uninstall-Package
get-package "*Dell Display*" | Uninstall-Package
get-package "*Dell Peripheral*" | Uninstall-Package

#REMOVE REMNANTS THAT ARE OLD SCHOOL PROGRAMS
$DellPackages = Get-ItemProperty HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where {$_.DisplayName -like "*Dell SupportAssist*"} 

if ($DellPackages) 
{ 
    write-host "Starting Uninstallation..." -ForegroundColor Cyan 
    foreach ($DellPackage in $DellPackages) 
    { 
        write-host "Removing $($DellPackage.DisplayName)" -ForegroundColor Yellow 
        $UninstallString = $DellPackage.UninstallString 
        $UninstallEXE = ($UninstallString -split '"')[1] 
        $UninstallArg = ($UninstallString -split '"')[2] + " DisplayLevel=False" 
        Start-Process -FilePath $UninstallEXE -ArgumentList $UninstallArg -Wait 
    } 
} 
else 
{ 
    write-host "None found." -ForegroundColor Green 
}
