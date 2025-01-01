@echo off
echo Закрываем процессы Roblox...
taskkill /F /IM RobloxPlayerBeta.exe >nul 2>&1
taskkill /F /IM RobloxStudioBeta.exe >nul 2>&1

echo Удаляем Roblox...

REM Удаляем основные директории
rmdir /s /q "%USERPROFILE%\AppData\Local\Roblox" >nul 2>&1
rmdir /s /q "C:\Program Files\Roblox" >nul 2>&1
rmdir /s /q "C:\Program Files (x86)\Roblox" >nul 2>&1
rmdir /s /q "%USERPROFILE%\AppData\Roaming\Roblox" >nul 2>&1

REM Удаляем ярлыки
del /f /q "%USERPROFILE%\Desktop\Roblox*.lnk" >nul 2>&1
del /f /q "%ALLUSERSPROFILE%\Desktop\Roblox*.lnk" >nul 2>&1
del /f /q "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Roblox*.lnk" >nul 2>&1

REM Удаляем из реестра
reg delete "HKCU\Software\Roblox" /f >nul 2>&1
reg delete "HKLM\Software\Roblox Corporation" /f >nul 2>&1
reg delete "HKLM\Software\Wow6432Node\Roblox Corporation" /f >nul 2>&1

echo Удаление завершено!
echo Рекомендуется перезагрузить компьютер.
pause
