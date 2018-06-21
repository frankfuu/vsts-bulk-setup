<# 

***** Description *****
Sets up VSTS agents in bulk

***** Example *****
.\setup.ps1 -pat "xxxxx" -url "https://xxxx.visualstudio.com" `
-agentSourcePath "vsts-agent-win-x64-2.129.1.zip" -targetPathRoot "e:\vsts" `
-copies 1 -agentPrefix "my-test-bd-agent" -pool "MyTestPool"

Note : Needs to run with Administrator rights

#>

Param(
  [string]$pat,
  [string]$url,
  [string]$agentPrefix,
  [string]$pool,
  [string]$agentSourcePath,
  [string]$targetPathRoot,
  [int]$copies
)

foreach($n in 1..$copies)
{
  $agentName = "$agentPrefix-$n"
  $tgtDir = "$targetPathRoot\$pool\$agentName"

  Expand-Archive -Path $agentSourcePath -DestinationPath $tgtDir
  
  Write-Host "Setting up $agentName"
  $cmd = "$tgtDir\config.cmd"
  $arg = "--unattended  --url $url --auth pat --token $pat --runAsService --pool $pool --agent $agentName"
  $fullCmd = "$cmd $arg"
  Invoke-Expression $fullCmd
}