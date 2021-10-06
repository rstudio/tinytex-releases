$toolsDir = Get-ToolsLocation

Write-Host "Generating extra installed packages."
$installed_packages_command = "/C `"$toolsdir\TinyTeX\bin\win32\tlmgr.bat info --list --only-installed --data name > $toolsDir/tinytex-pkg-installed.txt`""
Start-ChocolateyProcessAsAdmin $installed_packages_command "cmd.exe"

