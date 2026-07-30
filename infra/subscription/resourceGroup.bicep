targetScope = 'subscription'

@description('Azure region')
param location string

@description('Application name')
param applicationName string

@description('Environment name')
@allowed([
  'dev'
  'qa'
  'uat'
  'prod'
])
param environment string

@description('Tags applied to all resources')
param tags object

var resourceGroupname = 'rg-${applicationName}-${environment}'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: resourceGroupname
  location: location
  tags: tags
}

output resourceGroupName string = resourceGroup.name
output resourceGroupId string = resourceGroup.id