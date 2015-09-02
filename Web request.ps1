

#if proxy auth required
[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials

$url = 'http://www.monster.de/?disRe=true'

Invoke-WebRequest http://www.monster.de/?disRe=true #-ProxyUseDefaultCredentials -Proxy dr-tmg.ddor.local

Invoke-WebRequest http://www.google.com
$mde = Invoke-WebRequest -URI http://www.monster.de/?disRe=true #-UseBasicParsing #-ProxyCredential ddor\kt_morlovic
$mde.ParsedHtml.getElementsByTagName("div")




#Invoke-WebRequest http://www.leeholmes.com/blog

$blog = Invoke-WebRequest http://jdhitsolutions.com/blog
$blog.Links[0]


$r = Invoke-WebRequest -URI http://www.bing.com?q=how+many+feet+in+a+mile
$r.AllElements | where {$_.innerhtml -like "*=*"} | Sort { $_.InnerHtml.Length } | Select InnerText -First 5



Invoke-RestMethod -URI “http://www.seismi.org/api/eqs” | Select-Object -First 30 -ExpandProperty Earthquakes|Out-GridView 

$result = [System.uri]’http://powershell.com/cs/forums/’

#http://powershell.com/cs/PowerTips_Monthly_Volume_10.pdf

$object = New-Object Net.WebClient
$object | gm -MemberType Method
$object.UseDefaultCredentials=$true
$object.Proxy.Credentials=$object.Credentials
$object.DownloadString($url)

$keyword = “AWS fundations”
Invoke-RestMethod -Uri “https://gdata.youtube.com/feeds/api/videos?v=2&q=$($keyword.Replace(‘ ‘,’+’))” |
Select-Object -Property Title, @{N=’Author’;E={$_.Author.Name}}, @{N=’Link’;E={$_.Content.src}}, @{N=’Updated’;E={[DateTime]$_.Updated}} |
Sort-Object -Property Updated -Descending |
Out-GridView -Title “Select your ‘$Keyword’ video, then click OK to view.” -PassThru |
ForEach-Object { Start-Process $_.Link } 



[Microsoft.PowerShell.Commands.PSUserAgent].GetProperties() | 
Select-Object Name, @{n='UserAgent';e={ [Microsoft.PowerShell.Commands.PSUserAgent]::$($_.Name) }}

$userAgent = [Microsoft.PowerShell.Commands.PSUserAgent]::Chrome
Invoke-WebRequest http://www.powershellmagazine.com -UserAgent $userAgent