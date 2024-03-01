$ErrorActionPreference = 'Stop';
$version = '2024.03';
$toolsDir = Get-ToolsLocation
$url        = "https://github.com/rstudio/tinytex-releases/releases/download/v$($version)/TinyTeX-1-v$($version).zip"
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'dac23fa5626dcf3da44747c6e474eb38'
  checksumType  = 'md5'
}

# get Package Parameters
$pp = Get-PackageParameters

Install-ChocolateyZipPackage @packageArgs

Write-Host "Running tlmgr path add"
# Adds to Path
if ($pp['AddToSystemPath'] -eq 'true') {
	Write-Host "Running tlmgr AddToSystemPath"
	# AddToSystemPath
	$statementsToRun = "/C `"$toolsDir\TinyTeX\bin\windows\tlmgr.bat path --w32mode=admin add`""
} else {
	# AddToUserPath
	$statementsToRun = "/C `"$toolsDir\TinyTeX\bin\windows\tlmgr.bat path add`""
}
Start-ChocolateyProcessAsAdmin $statementsToRun "$env:WINDIR\system32\cmd.exe"

Write-Host "Updating tlmgr"
#updates tlmgr
$statementsToRun = "/C `"$toolsDir\TinyTeX\bin\windows\tlmgr.bat update --self`""
Start-ChocolateyProcessAsAdmin $statementsToRun "$env:WINDIR\system32\cmd.exe"

$files = Get-ChildItem $toolsDir -Include *.exe -Recurse
foreach ($file in $files) {
  #We are directly adding it to path so no need to generate shims
  New-Item "$file.ignore" -ItemType file -Force | Out-Null
}

Write-Host "Installing Extra Packages"
$tinytex_tmp_file = "$toolsDir\tinytex-pkg-installed.txt"
if (Test-Path "$tinytex_tmp_file") {
    $env:PATH = "$toolsDir\TinyTeX\bin\windows;$env:PATH"
    $tinytex_pkg_installed = (tlmgr info --list --only-installed --data name)
    $tinytex_reinstall = "$env:TMP\installed_old_packages.ps1"
    ((Get-Content $tinytex_tmp_file) | Where-Object { $tinytex_pkg_installed -NotContains $_}) | ForEach-Object {"Invoke-Expression '$toolsDir\TinyTeX\bin\windows\tlmgr.bat install {0}'" -f $_} > $tinytex_reinstall
    if ((Get-Content $tinytex_reinstall) -ne $null){
        Write-Host "Installing previous user installed packages"
        Invoke-Expression "$tinytex_reinstall"
    }
    Remove-Item -Force $tinytex_reinstall
    Remove-Item -Force $tinytex_tmp_file
}
