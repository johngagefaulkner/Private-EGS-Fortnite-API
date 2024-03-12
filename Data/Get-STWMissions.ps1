<#
  - Name: Get-STWMissions.ps1
  - Description: This PowerShell script obtains the raw JSON data of all available Daily Missions in Save the World WITHOUT requiring an authorization Access Token.
#>

# Configure script action preferences
$ProgressPreference = 'SilentlyContinue'
$ErrorActionPreference = 'Stop'

# Clear the PowerShell console, then display script info
Clear-Host
Write-Host "[ Get-STWMissions.ps1 ]" -ForegroundColor Magenta

# Step 1: Retrieve an Access Token (not tied to a user) from the NiteStats API.
Write-Host " 1. Retrieving generic Access Token from NiteStats API... " -NoNewline
$niteToken = Invoke-RestMethod -Method GET -Uri "https://api.nitestats.com/v1/epic/bearer" | Select-Object -Expand "accessToken"
Write-Host "Done!" -ForegroundColor Green

# Step 2: Use the Access Token from the previous step to authenticate our request for the daily missions data.
Write-Host "Retrieving current daily Save the World missions... " -NoNewline
## Define where you want to save/export the JSON response data
$outputFilePath = "C:\Users\Public\FortniteAPI-Game-v2-worldInfo-en.json"
## Send the API Request
$stwMissions = curl "https://fortnite-public-service-prod11.ol.epicgames.com/fortnite/api/game/v2/world/info?lang=en-US" -H "Authorization: Bearer $niteToken" --silent --output "$outputFilePath"
Write-Host "Done!" -ForegroundColor Green

# Gracefully exit
Write-Host "File successfully exported to: $outputFilePath"
Read-Host -Prompt "Operation completed successfully! Press Enter to exit."
