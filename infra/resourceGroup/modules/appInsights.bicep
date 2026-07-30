@description('Application Insights name')
param applicationInsightsName string

@description('Azure region')
param location string

@description('Tags')
param tags object

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
	Application_Type: 'web'
	WorkspaceResourceId: null
  }
  tags: tags
}

output appInsightsId string = appInsights.id
output connectionString string = appInsights.properties.ConnectionString