#Azure Reource Manager


Switch-AzureMode -Name AzureResourceManager

#sub.ID 1d3a2dce-8063-48fe-af1f-22c062ee0555

#ten.ID 65af6e70-bba2-44ec-a4cb-eb5451f333ea

#clientapp.ID 2fb1f479-7dc8-40b5-8829-c74367d45219



$subscriptionID = (Get-AzureAccount -Name 'milan@kt.rs').subscriptions
$TenantID = (Get-AzureAccount -Name 'milan@kt.rs').Tenants
$cred = Get-Credential 
Add-AzureAccount -Credential $cred

Get-AzureAccount

Get-AzureResourceGroup

Get-AzureResource

Get-AzureResourceProviderLog

Get-AzureResourceGroupGalleryTemplate

Get-Command -Noun AzureResource*

Get-AzureADServicePrincipal

#http://www.powershellmagazine.com/2014/12/24/using-azure-resource-management-rest-api-in-powershell/
#Invoke-WebRequest -Uri 'https://oneget.org/nuget-anycpu-2.8.3.6.exe' -OutFile "D:\nuget.exe"
#Start-Process -FilePath "D:\nuget.exe" -ArgumentList 'install Microsoft.IdentityModel.Clients.ActiveDirectory' -WorkingDirectory D:\
Add-Type -Path D:\Microsoft.IdentityModel.Clients.ActiveDirectory.2.19.208020213\lib\net45\Microsoft.IdentityModel.Clients.ActiveDirectory.dll

$clientID = "2fb1f479-7dc8-40b5-8829-c74367d45219"


$authUrl = "https://login.windows.net/${tenantId}"
$AuthContext = [Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext]$authUrl
$result = $AuthContext.AcquireToken("https://management.core.windows.net/",$clientId,[Uri]"http://localhost/AzureADappKT",[Microsoft.IdentityModel.Clients.ActiveDirectory.PromptBehavior]::Auto)
 
$authHeader = @{
'Content-Type'='application\json'
'Authorization'=$result.CreateAuthorizationHeader()
}

$allProviders = (Invoke-RestMethod -Uri "https://management.azure.com/subscriptions/${subscriptionId}/providers?api-version=2014-04-01-preview" -Headers $authHeader -Method Get -Verbose).Value
