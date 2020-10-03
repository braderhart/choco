$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  Destination  = "$toolsDir"
  FileFullPath = Get-Item $toolsDir\*.zip
  packageName  = "$env:ChocolateyPackageName"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -force "$toolsDir\*.zip" -ea 0
