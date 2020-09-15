$ErrorActionPreference = 'Stop';
$toolsDir=Get-ToolsLocation
$url        = "https://github.com/yihui/chocolatey-tinytex/releases/download/v$($env:ChocolateyPackageVersion)/TinyTeX-1.zip"
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'f6c11e1a772b133dfda0aae5f13e871d'
  checksumType  = 'md5'
}

Install-ChocolateyZipPackage @packageArgs

# Adds to Path
$statementsToRun = "/C `"$toolsDir\TinyTeX\bin\win32\tlmgr.bat path add`""
Start-ChocolateyProcessAsAdmin $statementsToRun "cmd.exe"

$files = get-childitem $installDir -include *.exe -recurse
foreach ($file in $files) {
  #We are directly adding it to path so no need to generate shims
  New-Item "$file.ignore" -type file -force | Out-Null
}

#create a shim for tlmgr.bat https://chocolatey.org/docs/helpers-install-bin-file
Install-BinFile -Name tlmgr -Path "$toolsDir\TinyTeX\bin\win32\tlmgr.bat"
