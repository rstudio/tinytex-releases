$ErrorActionPreference = 'Stop';
$toolsDir = Get-ToolsLocation
$url        = "https://github.com/yihui/tinytex-releases/releases/download/v$($env:ChocolateyPackageVersion)/TinyTeX-1-v$($env:ChocolateyPackageVersion).zip"
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '755f7f66a0c35432ea38694c1233035b'
  checksumType  = 'md5'
}

Install-ChocolateyZipPackage @packageArgs


Write-Host "Running tlmgr path add"
# Adds to Path
$statementsToRun = "/C `"$toolsDir\TinyTeX\bin\win32\tlmgr.bat path add`""
Start-ChocolateyProcessAsAdmin $statementsToRun "cmd.exe"


Write-Host "Updating tlmgr"
#updates tlmgr
$statementsToRun = "/C `"$toolsDir\TinyTeX\bin\win32\tlmgr.bat update --self`""
Start-ChocolateyProcessAsAdmin $statementsToRun "cmd.exe"


$files = get-childitem $toolsDir -include *.exe -recurse
foreach ($file in $files) {
  #We are directly adding it to path so no need to generate shims
  New-Item "$file.ignore" -type file -force | Out-Null
}


Write-Host "Installing Extra Packages"
$tinytex_tmp_file = "$toolsDir\tinytex-pkg-installed.txt"
if (Test-Path "$tinytex_tmp_file") {
    $env:PATH = "$toolsDir\TinyTeX\bin\win32;$env:PATH"
    $tinytex_pkg_installed = (tlmgr info --list --only-installed --data name)
    $tinytex_reinstall = "$env:TMP\installed_old_packages.ps1"
    ((Get-Content $tinytex_tmp_file) | Where { $tinytex_pkg_installed -NotContains $_}) | % {"Invoke-Expression '$toolsDir\TinyTeX\bin\win32\tlmgr.bat install {0}'" -f $_} > $tinytex_reinstall
    if ((Get-Content $tinytex_reinstall) -ne $null){
        Write-Host "Installing previous user installed packages"
        Invoke-Expression "$tinytex_reinstall"    
    }
    Remove-Item -force $tinytex_reinstall
    Remove-Item -force $tinytex_tmp_file
}

