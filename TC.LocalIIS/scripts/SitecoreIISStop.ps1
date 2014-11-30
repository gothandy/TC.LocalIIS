param($projectName)

$iisName = $projectName;
$appPoolName = $projectName + ".AppPool";

[System.Reflection.Assembly]::LoadFrom("C:\windows\system32\inetsrv\Microsoft.Web.Administration.dll") | out-null;
$serverManager = New-Object Microsoft.Web.Administration.ServerManager;

$site = $serverManager.Sites[$iisName];
if($site.State -eq "Started")
{
	$site.Stop() | out-null;
	#Write-Host "Stopped Site $iisName";
}

$appPool = $serverManager.ApplicationPools[$appPoolName];
if($appPool.State -eq "Started")
{
	$appPool.Stop() | out-null;
	#Write-Host "Stopped AppPool $AppPoolName";
}

function get-aspnetwp([string]$name="*")
{
   $list = get-process | where {$_.ProcessName -like "w3wp"};
   foreach($p in $list)
   { 
      $filter = "Handle='" + $p.Id + "'"
      $wmip = get-WmiObject Win32_Process -filter $filter 
      
      if($wmip.CommandLine -match "-ap `"([^`"]+)")
      {
      
         $appName = $matches[1]
         $p | add-member NoteProperty AppPoolName $appName
      }
   }
   $list | where { $_.AppPoolName -like $name }
}

get-aspnetwp $appPoolName | kill -Force;