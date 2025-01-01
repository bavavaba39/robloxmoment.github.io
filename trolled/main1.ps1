# Stop
Stop-Process -Name "RobloxPlayerBeta" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "RobloxStudioBeta" -Force -ErrorAction SilentlyContinue

# Remove Main DIRs
Remove-Item -Path "$env:LOCALAPPDATA\Roblox" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Program Files (x86)\Roblox" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:USERPROFILE\AppData\Roaming\Roblox" -Recurse -Force -ErrorAction SilentlyContinue

# Remove symlinks
Remove-Item -Path "$env:USERPROFILE\Desktop\Roblox*.lnk" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:PROGRAMDATA\Microsoft\Windows\Start Menu\Programs\Roblox*.lnk" -Force -ErrorAction SilentlyContinue
