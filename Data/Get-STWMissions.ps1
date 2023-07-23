# Get STW Missions without auth
$ProgressPreference = 'SilentlyContinue'
$ErrorActionPreference = 'Stop'

Clear-Host
Write-Host "[ Get-STWMissions.ps1 ]"
Write-Host "Retrieving Access Token from NiteStats... " -NoNewline

$niteToken = Invoke-RestMethod -Method GET -Uri "https://api.nitestats.com/v1/epic/bearer" | Select-Object -Expand "accessToken"

Write-Host "Done!" -ForegroundColor Green
Write-Host "Retrieving current daily Save the World missions... " -NoNewline

$stwMissions = curl "https://fortnite-public-service-prod11.ol.epicgames.com/fortnite/api/game/v2/world/info?lang=en-US" -H "Authorization: Bearer $niteToken" --silent --output "C:\Users\Public\FortniteAPI-Game-v2-worldInfo-en.json"

Write-Host "Done!" -ForegroundColor Green
$userInput = Read-Host -Prompt "Operation completed successfully. Press Enter to exit."
