$ErrorActionPreference = 'Stop';
$toolsDir=Get-ToolsLocation
$url        = "https://github.com/yihui/tinytex-releases/releases/download/v$($env:ChocolateyPackageVersion)/TinyTeX-1-v$($env:ChocolateyPackageVersion).zip"
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'ed942c1acc4ba73409e2ddc483bd45b8'
  checksumType  = 'md5'
}

Install-ChocolateyZipPackage @packageArgs

# Adds to Path
$statementsToRun = "/C `"$toolsDir\TinyTeX\bin\win32\tlmgr.bat path add`""
Start-ChocolateyProcessAsAdmin $statementsToRun "cmd.exe"

#updates tlmgr
$statementsToRun = "/C `"$toolsDir\TinyTeX\bin\win32\tlmgr.bat update --self`""
Start-ChocolateyProcessAsAdmin $statementsToRun "cmd.exe"

$files = get-childitem $toolsDir -include *.exe -recurse
foreach ($file in $files) {
  #We are directly adding it to path so no need to generate shims
  New-Item "$file.ignore" -type file -force | Out-Null
}
