

$AZUREmodulepath = 'C:\Program Files (x86)\Microsoft SDKs\Azure\PowerShell\ServiceManagement\Azure\Azure.psd1'
Import-Module $AZUREmodulepath

#$env:PSModulePath += ";C:\Program Files (x86)\Microsoft SDKs\Windows Azure\PowerShell\"
#[Environment]::SetEnvironmentVariable("PSModulePath", $env:PSModulePath)
#Import-Module Azure # <-- Now you can do this!


#Get-Module Azure
#Get-Command -Module Azure

$KT_subscription = '1d3a2dce-8063-48fe-af1f-22c062ee0555'
$cred = Get-Credential -UserName milan@kt.rs -Message 'Azure user MILAN'
Add-AzureAccount -Credential $cred

#Get-AzureAffinityGroup
#Get-AzureStorageAccount #| Remove-AzureStorageAccount

Get-AzureVMImage | select ImageFamily -Unique #| measure
Get-AzureVMImage | select Label -Unique
$label = 'Windows Server 2012 R2 Datacenter, March 2015'
#$label = 'Windows Server 2012 R2 Datacenter'
$image = Get-AzureVMImage | where { $_.Label -eq $label } | sort PublishedDate -Descending | select -ExpandProperty ImageName -First 1

$newid = get-date

$vmname="KT-AZ-DC"#+$newid.Hour+"-"+$newid.Minute+"-"+$newid.Day+"-"+$newid.Month+"-"+$newid.Year
#$vmsize="<Specify one: Small, Medium, Large, ExtraLarge, A5, A6, A7, A8, A9>"
$vmsize="Small"
$vmconf=New-AzureVMConfig -Name $vmname -InstanceSize $vmsize -ImageName $image

#for a standalone Windows computer, specify the local administrator account and password.
$cred=Get-Credential -UserName $vmname"Admin" -Message "Type the name and password of the local administrator account."

<<<<<<< HEAD
$vmconf | Add-AzureProvisioningConfig -Windows -AdminUsername $cred.GetNetworkCredential().Username -Password $cred.GetNetworkCredential().Password

$disksize=20
$disklabel="DCData"
$lun=0

Get-AzureVM -ServiceName newktservice
Get-AzureDisk | fl AttachedTo,DiskSizeInGB,Diskname

get-azurevm -Name kt-az-dc -ServiceName newktservice | Set-AzureStaticVNetIP -IPAddress 10.10.10.4 | Update-AzureVM
Test-AzureStaticVNetIP –VNetName KTAzureVNet –IPAddress 10.10.10.4
Get-AzureVNetConnection

$primaryDNS = '10.10.10.4'
$dns = New-AzureDns -Name 'KT-AZ-DNS' -IPAddress $primaryDNS
Get-AzureVM -ServiceName KT-AZ-E1 

=======
$vmconf | Add-AzureProvisioningConfig -Windows -AdminUsername $cred.GetNetworkCredential().Username -Password $cred.GetNetworkCredential().Password
>>>>>>> origin/master
