$toolsDir = Get-ToolsLocation

If ([Environment]::GetEnvironmentVariables("User").Path -split ";" | ?{$_ -like "*TinyTeX\*"}){
    $statementsToRun = "/C `"$toolsDir\TinyTeX\bin\windows\tlmgr.bat path remove`""
} Else{
    $statementsToRun = "/C `"$toolsDir\TinyTeX\bin\windows\tlmgr.bat path --w32mode=admin remove`""
}

Start-ChocolateyProcessAsAdmin $statementsToRun "cmd.exe"
