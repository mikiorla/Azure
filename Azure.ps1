

$AZUREmodulepath = 'C:\Program Files (x86)\Microsoft SDKs\Azure\PowerShell\ServiceManagement\Azure\Azure.psd1'
Import-Module $AZUREmodulepath

#if proxy auth required
[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials

#$env:PSModulePath += ";C:\Program Files (x86)\Microsoft SDKs\Windows Azure\PowerShell\"
#[Environment]::SetEnvironmentVariable("PSModulePath", $env:PSModulePath)
#Import-Module Azure # <-- Now you can do this!


#Get-Module Azure
#Get-Command -Module Azure




$KT_subscription = '1d3a2dce-8063-48fe-af1f-22c062ee0555'
$cred = Get-Credential -UserName milan@kt.rs -Message 'Azure user MILAN'
Add-AzureAccount -Credential $cred

Get-AzureAccount | fl *
Get-AzureSubscription 
#Get-AzurePublishSettingsFile
#Import-AzurePublishSettingsFile 'C:\Users\Milan.KTEHNIKA\Downloads\Microsoft Partner Network-3-25-2015-credentials.publishsettings'

Get-Command -Module azure -Noun *defaul*
Get-Command -Module azure -Noun *contain*

Get-AzureLocation | select DisplayName

New-AzureAffinityGroup -Name 'KT-NE-AG' -Location 'North Europe' 
Get-AzureAffinityGroup

 
New-AzureStorageAccount -StorageAccountName 'ktstorageaccount' -AffinityGroup 'KT-NE-AG' 
Get-AzureStorageAccount | fl * #| Remove-AzureStorageAccount

Get-AzureStorageContainer | fl *

Set-AzureSubscription -SubscriptionId $KT_subscription -CurrentStorageAccountName 'ktstorageaccount'
Get-AzureSubscription 

Get-AzureVM | fl *

Get-AzureVMImage | select ImageFamily -Unique #| measure
Get-AzureVMImage | select Label -Unique
$label = 'Windows Server 2012 R2 Datacenter, March 2015'
#$label = 'Windows Server 2012 R2 Datacenter'
$image = Get-AzureVMImage | where { $_.Label -eq $label } | sort PublishedDate -Descending | select -ExpandProperty ImageName -First 1

$vmname="KTINA1"
#$vmsize="<Specify one: Small, Medium, Large, ExtraLarge, A5, A6, A7, A8, A9>"
<<<<<<< HEAD
$vmsize = "Small"
$vmconf = New-AzureVMConfig -Name $vmname -InstanceSize $vmsize -ImageName $image

$vmcred = Get-Credential -Message "Type the name and password of the local administrator account." -UserName milan #Novisad1 
$vmconf|Add-AzureProvisioningConfig -Windows -AdminUsername $cred.GetNetworkCredential().Username -Password $cred.GetNetworkCredential().Password

#$cred1=Get-Credential –Message "Type the name and password of the local administrator account."
#$cred2=Get-Credential –Message "Now type the name (not including the domain) and password of an account that has permission to add the machine to the domain."
#$domaindns="<FQDN of the domain that the machine is joining>"
#$domacctdomain="<domain of the account that has permission to add the machine to the domain>"
#$vm1 | Add-AzureProvisioningConfig -AdminUsername $cred1.GetNetworkCredential().Username -Password $cred1.GetNetworkCredential().Password -WindowsDomain -Domain $domacctdomain -DomainUserName $cred2.GetNetworkCredential().Username -DomainPassword $cred2.GetNetworkCredential().Password -JoinDomain $domaindns

#Optionally, assign the virtual machine a specific IP address, known as a static DIP.
# $vm1 | Set-AzureStaticVNetIP -IPAddress <IP address>

#You can verify that a specific IP address is available with
#Test-AzureStaticVNetIP –VNetName <VNet name> –IPAddress <IP address>

#Optionally, assign the virtual machine to a specific subnet in an Azure virtual network.
# $vm1 | Set-AzureSubnet -SubnetNames "<name of the subnet>"

#Optionally, add a single data disk to the virtual machine.
#$disksize=<size of the disk in GB>
#$disklabel="<the label on the disk>"
#$lun=<Logical Unit Number (LUN) of the disk>
#$hcaching="<Specify one: ReadOnly, ReadWrite, None>" #For an Active Directory domain controller, set $hcaching to "None".
#$vm1 | Add-AzureDataDisk -CreateNew -DiskSizeInGB $disksize -DiskLabel $disklabel -LUN $lun -HostCaching $hcaching

#Optionally, add the virtual machine to an existing load-balanced set for external traffic.
#$prot="<Specify one: tcp, udp>"
#$localport=<port number of the internal port>
#$pubport=<port number of the external port>
#$endpointname="<name of the endpoint>"
#$lbsetname="<name of the existing load-balanced set>"
#$probeprotocol="<Specify one: tcp, udp>"
#$probeport=<TCP or UDP port number of probe traffic>
#$probepath="<URL path for probe traffic>"
#$vm1 | Add-AzureEndpoint -Name $endpointname -Protocol $prot -LocalPort $localport -PublicPort $pubport -LBSetName $lbsetname -ProbeProtocol $probeprotocol -ProbePort $probeport -ProbePath $probepath

#Option 1: Create the virtual machine in a new cloud service.
#New-AzureVM –Location "<An Azure location, such as US West>" -VMs $vm1
New-AzureVM -AffinityGroup 'KT-NE-AG' -VMs $vmconf -ServiceName newktservice
Get-AzureVM | fl *

#Option 2: Create the virtual machine in an existing cloud service.
#New-AzureVM –ServiceName "<short name of the cloud service>" -VMs $vm1

#Option 3: Create the virtual machine in an existing cloud service and virtual network.
#$svcname="<short name of the cloud service>"
#$vnetname="<name of the virtual network>"
#New-AzureVM –ServiceName $svcname -VMs $vm1 -VNetName $vnetname

=======
$vmsize="Small"
$vmconf=New-AzureVMConfig -Name $vmname -InstanceSize $vmsize -ImageName $image
>>>>>>> origin/master
