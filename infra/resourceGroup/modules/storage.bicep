@description('Storage account name')
param storageAccountName string

@description('Azure region')
param location string

@description('Tags')
param tags object

resource storage 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: storageAccountName
  location: location
  sku: {
	name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  tags: tags
  properties: {
	minimumTlsVersion: 'TLS1_2'
	supportsHttpsTrafficOnly: true
	allowBlobPublicAccess: false
	allowSharedKeyAccess: true
	publicNetworkAccess: 'Enabled'
  }
}


output storageAccountName string = storage.name
output storageAccountId string = storage.id
output blobServiceUri string = storage.properties.primaryEndpoints.blob