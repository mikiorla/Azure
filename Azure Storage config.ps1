
Get-Command -Module Azure -Noun *vhd*

Get-AzureSubscription

#Azure Storage Accounts
#http://azure.microsoft.com/en-us/documentation/articles/storage-create-storage-account/#view-copy-and-regenerate-storage-access-keys

Get-AzureAccount | fl *
Get-AzureStorageAccount | fl StorageAccountName,Endpoints


    
Get-AzureStorageContainer -Name vhds 
Get-AzureStorageContainer | gm

Get-AzureDisk | select MediaLink
Get-AzureDisk -DiskName newktservice-KTAzure1-0-201503311214230815 



#region Configuring Azure Connection Strings




#endregion

#region Billing Azure storage

#Storage costs are based on four factors:
#storage capacity, replication scheme, storage transactions, and data egress

#http://azure.microsoft.com/en-us/pricing/details/storage/


#endregion
