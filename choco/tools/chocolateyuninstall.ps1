$toolsDir = Get-ToolsLocation

$statementsToRun = "/C `"$toolsDir\TinyTeX\bin\win32\tlmgr.bat path remove`""
Start-ChocolateyProcessAsAdmin $statementsToRun "cmd.exe"

$statementsToRun = "/C `"$toolsDir\TinyTeX\bin\win32\tlmgr.bat path --w32mode=admin remove`""
Start-ChocolateyProcessAsAdmin $statementsToRun "cmd.exe"
