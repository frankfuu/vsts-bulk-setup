<# 

**** Description ******
Uninstalls every VSTS agent in every folder matching the folder pattern in the given target directory
by removing the windows service and the reference in VSTS online

**** Example *******
.\removal.ps1 -pat "xxxx" -targetPathRoot "e:\vsts\MyTestPool" -folderPattern "*agent*" 

#>

Param(
  [string]$pat,
  [string]$folderPattern,
  [string]$targetPathRoot
)


$folders = Get-ChildItem -Path $targetPathRoot -Filter $folderPattern
foreach($folder in $folders)
{
    $exp = "$($folder.FullName)\config.cmd remove --auth pat --token $pat"
    Invoke-Expression $exp
}

## Removing dangling folders
foreach($folder in $folders)
{
    Write-Host "Removing dangling folder $($folder.FullName) ..."
    rm $folder.FullName -Recurse -Force    
}

