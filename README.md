# Setup

```
cd e:\
git clone git@github.com:frankfuu/vsts-bulk-setup.git
```

## Installation
```
cd vsts-bulk-setup
.\setup.ps1 -pat "xxxxx" -url "https://xxxx.visualstudio.com" `
-agentSourcePath "vsts-agent-win-x64-2.129.1.zip" -targetPathRoot "e:\vsts" `
-copies 2 -agentPrefix "my-test-bd-agent" -pool "MyTestPool"
```

This will create two agents in `E:\vsts\MyTestPool\`
```
> gci E:\vsts\MyTestPool\    

Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d-----       21/06/2018  12:54 PM                my-test-bd-agent-1
d-----       21/06/2018  12:54 PM                my-test-bd-agent-2
```

## Uninstall
```
.\removal.ps1 -pat "xxxx" -targetPathRoot "e:\vsts\MyTestPool" -folderPattern "*agent*" 
```
