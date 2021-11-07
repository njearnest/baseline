$app = Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -match "Microsoft Office 365 - en-us" }
Uninstall-Package $app.name

$app = Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -match "Microsoft Office 365 - es-es" }
Uninstall-Package $app.name

$app = Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -match "Microsoft Office 365 - fr-fr" }
Uninstall-Package $app.name
