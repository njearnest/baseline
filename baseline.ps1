##############################################
# FUNCTIONS
##############################################
function IsChocolateyInstalled()
{
    if(test-path "C:\ProgramData\chocolatey\choco.exe")
    {
        return $true
    }
    else
    {
        return $false
    }
}

function InstallChocolatey()
{
    write-host "Choco is installed!" -ForegroundColor Green

    # https://chocolatey.org/docs/installation
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

function InstallBaselineAppsViaChoco()
{
    Write-Host "Installing baseline apps now..." -ForegroundColor Cyan

    # EVERYONE
    choco upgrade adobereader -y
    choco upgrade googlechrome -y
    choco upgrade 7zip -y
    choco upgrade microsoft-edge -y

    # Dell workstations
    choco upgrade dellcommandupdate -y 
}

##############################################
# VARIABLES
##############################################


##############################################
# MAIN
##############################################

if (IsChocolateyInstalled)
{
    write-host "Choco is installed!" -ForegroundColor Green
    InstallBaselineAppsViaChoco
}
else
{
    Write-Host "Choco is not installed. Attempting to install now..." -ForegroundColor Cyan
    InstallChocolatey
    
    Start-Sleep 5

    InstallBaselineAppsViaChoco
}

# GET INSTALLED / MANAGED PACKAGES
#choco list --localonly 
choco list -lo --include-programs
choco outdated
# LOG
#C:\ProgramData\chocolatey\logs\chocolatey.log
