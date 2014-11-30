param($installPath, $toolsPath, $package, $project)

$projectName = $project.Name;

Write-Host "Sitecore IIS - Stopping Website and AppPool for $projectName."
& "$installPath\scripts\SitecoreIISStop" $projectName

Write-Host "Sitecore IIS - Deleting Website and AppPool for $projectName."
& "$installPath\scripts\SitecoreIISDelete" $projectName

Write-Host "Sitecore IIS - Removing Host File entry for $projectName."
& "$installPath\scripts\SitecoreHostFileRemove" $projectName

Write-Host "Sitecore IIS - Setting Project back to IIS Express."
foreach ($prop in $project.Properties)
{
	#Write-Host $prop.Name " = " $prop.Value
	if($prop.Name -eq "WebApplication.UseIIS") { $prop.Value = $false }
	elseif($prop.Name -eq "WebApplication.IsUsingIISExpress") { $prop.Value = $true }
	elseif($prop.Name -eq "WebApplication.UseIISExpress") { $prop.Value = $true }
}
 
 $project.Save();

 Write-Host "Sitecore IIS - Uninstall script complete."