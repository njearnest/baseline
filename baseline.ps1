if(test-path "C:\ProgramData\chocolatey\choco.exe")
{
    write-host "Choco is installed!" -ForegroundColor Green
    
    Write-Host "Installing baseline apps now..." -ForegroundColor Cyan
    
    # GET INSTALLED / MANAGED PACKAGES
    choco list --localonly 
    choco outdated

    # EVERYONE
    choco upgrade adobereader -y
    choco upgrade googlechrome -y
    choco upgrade 7zip -y
    choco upgrade microsoft-edge -y

    # Dell workstations
    choco upgrade dellcommandupdate -y   
}
else
{
    Write-Host "Choco is not installed. Attempting to install now..." -ForegroundColor Cyan
    # https://chocolatey.org/docs/installation
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# LOG
#C:\ProgramData\chocolatey\logs\chocolatey.log

