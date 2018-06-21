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
git clone git@github.com:frankfuu/vsts-bulk-setup.git
cd vsts-bulk-setup
```

```
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
