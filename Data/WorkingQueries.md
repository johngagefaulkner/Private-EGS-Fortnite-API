# Data / Working Queries
This is random collection of API calls that I found in a notepad file/text document (*.txt) with no context.

### Check to see if your account has any Founder's Friend Invites/Codes

```powershell
$authAccessToken = "164ba9fb74984eab97b1ca2183d8fa83"
$playerEpicGamesId = "24a9a3ac53434732b350a507b3ec13bf"
$apiEndpointUrl = "https://fngw-mcp-gc-livefn.ol.epicgames.com/fortnite/api/game/v2/friendcodes/$playerEpicGamesId/founderfriendinvite"

curl -X GET $apiEndpointUrl -H "Accept: application/json" -H "Authorization: Bearer $authAccessToken" -H "Content-Type: application/json" --silent
```


### Get-VenturesData
```batch
curl -X POST "https://fngw-mcp-gc-livefn.ol.epicgames.com/fortnite/api/game/v2/profile/24a9a3ac53434732b350a507b3ec13bf/client/QueryProfile?profileId=theater2&rvn=-1" -H "Accept: application/json" -H "Authorization: Bearer ACCESS_TOKEN" -H "Content-Type: application/json" -d "{}" --silent --output "FN_STW_QueryProfile_VenturesBackpack.json"
```
