@echo off
echo Закрываем браузеры...
taskkill /F /IM chrome.exe /T >nul 2>&1
taskkill /F /IM browser.exe /T >nul 2>&1
taskkill /F /IM iexplore.exe /T >nul 2>&1

echo Очищаем cookie...

REM Google Chrome
del /q /s /f "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cookies" >nul 2>&1
del /q /s /f "%USERPROFILE%\Local Settings\Application Data\Google\Chrome\User Data\Default\Cookies" >nul 2>&1

REM Yandex Browser
del /q /s /f "%USERPROFILE%\Local Settings\Application Data\Yandex\YandexBrowser\User Data\Default\Cookies" >nul 2>&1
del /q /s /f "%USERPROFILE%\AppData\Local\Yandex\YandexBrowser\User Data\Default\Cookies" >nul 2>&1

REM Internet Explorer
del /q /s /f "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Cookies\*.*" >nul 2>&1

echo Очищаем временные файлы...
del /q /s /f "%TEMP%\*.*" >nul 2>&1
del /q /s /f "C:\Windows\Temp\*.*" >nul 2>&1

echo Очистка завершена!
pause
