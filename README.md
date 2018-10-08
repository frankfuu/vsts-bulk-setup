# Description
Purpose of this project is to be able to easily setup VSTS with multiple agent pools and have multiple agents. For example, I might want to have

- Builds Pool (group of agents dedicated to compiling code and running unit tests)
  - Agent 1
  - Agent 2
- Deployments Pool (group of agents dedicated to deploying code)
  - Agent 1
  - Agent 2
- Automated Testing Pool (group of agents dedicated to doing automated integration tests)
  - Agent 1
  - Agent 2

## Prereqs
You'll need a [Personal Access Token](https://docs.microsoft.com/en-us/vsts/accounts/use-personal-access-tokens-to-authenticate?view=vsts) (PAT) and have already [created an agent pool](https://docs.microsoft.com/en-us/vsts/pipelines/agents/pools-queues?view=vsts#creating-agent-pools-and-queues)

## Installation

```
cd e:\
git clone https://github.com/frankfuu/vsts-bulk-setup.git
cd vsts-bulk-setup

## optionally download agent source from VSTS directly
iwr https://vstsagentpackage.azureedge.net/agent/2.134.2/vsts-agent-win-x64-2.134.2.zip -OutFile vsts-agent-win-x64-2.134.2.zip

```

```
 .\setup.ps1 -pat "INSERT_PAT" `
 -url "https://INSERT_ACCOUNTNAME.visualstudio.com" -agentSourcePath "vsts-agent-win-x64-2.129.1.zip" `
 -targetPathRoot "c:\vsts" -agentPrefix "INSERT_PCNAME-os-disk-bd-agent" -pool "INSERT_POOLNAME" -copies 2
```

This will create two agents in `E:\vsts\INSERT_POOLNAME\`
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
