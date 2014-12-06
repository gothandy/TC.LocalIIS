$projectPath = "C:\TC\TC.Nuget.Modules\TC.NuGet.Modules"

Remove-Module "Add-Host"
Import-Module (Join-Path $projectPAth "tools\Add-Host.psm1") -Verbose -NoClobber

Remove-Module "Remove-Host"
Import-Module (Join-Path $projectPAth "tools\Remove-Host.psm1") -Verbose -NoClobber

#C:\WINDOWS\system32\drivers\etc\hosts

Add-Host "TEST123"

Remove-Host "TEST123"

