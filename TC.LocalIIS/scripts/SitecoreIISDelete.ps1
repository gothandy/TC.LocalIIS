param($projectName)

$iisName = $projectName;
$appPoolName = $projectName + ".AppPool";

[System.Reflection.Assembly]::LoadFrom("C:\windows\system32\inetsrv\Microsoft.Web.Administration.dll") | out-null;
$serverManager = New-Object Microsoft.Web.Administration.ServerManager;


$site = $serverManager.Sites[$iisName];
if($site -ne $null)
{
	$serverManager.Sites.Remove($site);
	#Write-Host "Removed web site $iisName";
}

$appPool = $serverManager.ApplicationPools[$appPoolName];
if($appPool -ne $null)
{
	$serverManager.ApplicationPools.Remove($appPool);
	#Write-Host "Removed AppPool $appPoolName";
}

$serverManager.CommitChanges();