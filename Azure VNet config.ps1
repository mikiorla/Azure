


Get-Command -Module Azure -Noun *vnet*

Get-AzureVNetConfig | fl *

Get-AzureVNetSite

Get-AzureVNetConnection

#public virtual IP (VIP) address belongs to the cloud service, not the VM. Each VM has its own direct
#IP (DIP) address. As long as one or more VMs are Running or Stopped, the VIP will remain. If all the
#VMs are Stopped, the VIP will be released. If you want to stop (―power down‖) the instance, yet
#preserve the VIP and DIP addresses, you will need to stop the VM, but do not deallocate the VM.

Get-AzureStorageAccount
