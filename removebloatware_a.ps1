#$app = Get-WmiObject -Class Win32_Product -Filter "Name = 'Software Name'"

# REMOVE STOCK JUNK SOFTWARE
$MyBloatware = @('Dell', 'McAfee')

foreach ($Bloatware in $MyBloatware)
{
    Write-Host "Removing Bloatware from $Bloatware..." -ForegroundColor Yellow
    $uninstall32 = gci "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" | foreach { gp $_.PSPath } | ? { $_ -match $Bloatware } | select UninstallString
    $uninstall64 = gci "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" | foreach { gp $_.PSPath } | ? { $_ -match $Bloatware } | select UninstallString

    
    if ($uninstall64) 
    {
        $uninstall64.Count
        $uninstall64 = $uninstall64.UninstallString -Replace "msiexec.exe","" -Replace "/I","" -Replace "/X",""
        $uninstall64 = $uninstall64.Trim()
        #$uninstall64
        Write "Uninstalling..."
        Foreach ($BloatGUID in $uninstall64)
        {
            #$BloatGUID
            #start-process "msiexec.exe" -arg "/X $uninstall64 /qb" -Wait

            try
            {
                if ($BloatGUID.Contains("C:\"))
                {
                    "Different"
                    $BloatGUID
                    start-process $BloatGUID
                }
                else
                {
                    "GUID"
                    #$return = start-process "msiexec.exe" -arg "/X $uninstall64 /qb" -Wait
                    start-process "msiexec.exe" -arg "/x$BloatGUID `/norestart `/qn" -Wait
                }
            }
            catch
            {
                Write-Host $Exception
            }
            finally
            {
                switch ($($return.returnvalue)){
                  0 { "Uninstallation command triggered successfully" }
                  2 { "You don't have sufficient permissions to trigger the command on $Computer" }
                  3 { "You don't have sufficient permissions to trigger the command on $Computer" }
                  8 { "An unknown error has occurred" }
                  9 { "Path Not Found" }
                  9 { "Invalid Parameter"}
                  }
            }

        }
    }

    if ($uninstall32) 
    {
        $uninstall32.Count
        $uninstall32 = $uninstall32.UninstallString -Replace "msiexec.exe","" -Replace "/I","" -Replace "/X",""
        $uninstall32 = $uninstall32.Trim()
        #$uninstall32
        Write "Uninstalling..."
        Foreach ($BloatGUID in $uninstall32)
        {
            $BloatGUID
            #start-process "msiexec.exe" -arg "/X $uninstall32 /qb" -Wait
            
            try
            {
                if ($BloatGUID.Contains("C:\"))
                {
                    "Different"
                    $BloatGUID
                    start-process $BloatGUID -arg "/uninstall /quiet" -wait
                }
                else
                {
                    "GUID"
                    #$return = start-process "msiexec.exe" -arg "/X $uninstall64 /qb" -Wait
                    start-process "msiexec.exe" -arg "/x$BloatGUID `/norestart `/qn" -Wait
                }
            }
            catch
            {
                Write-Host $Exception
            }
            finally
            {

            }
        }
        
    }
}
