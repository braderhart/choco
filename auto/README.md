# Chocolatey Force Update
To force update:
> Replace version with version you want to force

```
powershell.exe -executionpolicy bypass -command {$au_Force = $true; $au_Version = "1.17.0"; .\update.ps1}
```
