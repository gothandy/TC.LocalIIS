param($installPath, $toolsPath, $package, $project)

$projectFolderName = Split-Path -parent $project.FileName;
$projectName = $project.Name;

Write-Host "Sitecore IIS - Adding Website and AppPool for $projectName."
& "$installPath\scripts\SitecoreIISAdd" $projectName $projectFolderName

Write-Host "Sitecore IIS - Adding Host File for $projectName."
& "$installPath\scripts\SitecoreHostFileAdd" $projectName

Write-Host "Sitecore IIS - Setting Project to use Local IIS against http://$projectName/"
foreach ($prop in $project.Properties)
{
	#Write-Host $prop.Name " = " $prop.Value
	if($prop.Name -eq "WebApplication.UseIIS") { $prop.Value = $true }
	elseif($prop.Name -eq "WebApplication.IsUsingIISExpress") { $prop.Value = $false }
	elseif($prop.Name -eq "WebApplication.UseIISExpress") { $prop.Value = $false }
	elseif($prop.Name -eq "WebApplication.IISUrl") { $prop.Value = "http://$projectName" }
}
 
 $project.Save();

Write-Host "Sitecore IIS - Install script complete."