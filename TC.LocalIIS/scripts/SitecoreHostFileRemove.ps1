param ($projectName)

$bindings = $projectName
$file = "C:\WINDOWS\system32\drivers\etc\hosts"

$content = Get-Content $file;
foreach($binding in $bindings.split("|"))
{   
	# remove bindings
    $content = $content -replace "\b$binding |\b$binding$", ""
}

# if the bindings now leave an orphan IP address remove
$content = $content -replace "\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}\s*$", ""

# remove empty lines and write back to file
$content | ? {$_.trim() -ne "" }  | Set-Content $file 