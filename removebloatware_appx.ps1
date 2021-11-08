# Microsoft 
get-appxpackage -all | where {$_.Name -eq "Microsoft.Office.OneNote"} | remove-appxpackage
get-appxpackage -all | where {$_.Name -eq "Microsoft.SkypeApp"} | remove-appxpackage

# Dell
get-appxpackage -all | where {$_.Name -eq "DellInc.DellCommandUpdate"} | remove-appxpackage
get-appxpackage -all | where {$_.Name -eq "DellInc.DellDigitalDelivery"} | remove-appxpackage
get-appxpackage -all | where {$_.Name -eq "HONHAIPRECISIONINDUSTRYCO.DellWatchdogTimer"} | remove-appxpackage
get-appxpackage -all | where {$_.Name -eq "DellInc.PartnerPromo"} | remove-appxpackage

# Other
get-appxpackage -all | where {$_.Name -eq "Disney.37853FC22B2CE"} | remove-appxpackage
get-appxpackage -all | where {$_.Name -eq "SpotifyAB.SpotifyMusic"} | remove-appxpackage
