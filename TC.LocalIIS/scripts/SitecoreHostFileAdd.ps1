param ($projectName)

$exists = Select-String "C:\WINDOWS\system32\drivers\etc\hosts" -Pattern "127.0.0.1[\W]*$projectName$" -Quiet;
if ($exists -eq $False)
{                                                                       
  Add-Content -Path "C:\WINDOWS\system32\drivers\etc\hosts" -Value "`r`n127.0.0.1 $projectName";
  #Write-Host "Added $projectName to host file";
}
else 
{
  Write-Host "$projectName already exists in host file. Skipping.";
}