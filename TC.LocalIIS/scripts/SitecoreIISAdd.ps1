param($projectName, $webSiteFolder)

$iisName = "$projectName";
$appPoolName = "$iisName.AppPool";

[System.Reflection.Assembly]::LoadFrom("C:\windows\system32\inetsrv\Microsoft.Web.Administration.dll") | out-null;
$serverManager = New-Object Microsoft.Web.Administration.ServerManager;

$appPool = $serverManager.ApplicationPools.Add($appPoolName);
$appPool.ManagedRuntimeVersion = "v4.0";
$appPool.ProcessModel.IdentityType = "NetworkService"; 

$webSite = $serverManager.Sites.Add($iisName, "http", ":80:$iisName", $webSiteFolder);
$webSite.Applications[0].ApplicationPoolName = $appPoolName;
$webSite.ServerAutoStart = $True;

$serverManager.CommitChanges();