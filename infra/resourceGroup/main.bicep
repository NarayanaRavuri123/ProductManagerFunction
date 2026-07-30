param applicationName string
param environment string
param location string
param tags object


var storageAccountName = 'stpm${environment}001'
var functionAppName = 'func-${applicationName}-${environment}'
var hostingPlanName = 'plan-${applicationName}-${environment}'
var appInsightsName = 'appi-${applicationName}-${environment}'

module storage './modules/storage.bicep' = {
  name: 'storageDeployment'
  params: {
	storageAccountName: storageAccountName
	location: location
	tags: tags
  }
}

module hosting './modules/hostingPlan.bicep' = {
  name: 'hostingPlanDeployment'
  params: {
	hostingPlanName: hostingPlanName
	location: location
	tags: tags
  }
}


module appInsights './modules/appInsights.bicep' = {
  name: 'appInsightsDeployment'
  params: {
	applicationInsightsName: appInsightsName
	location: location
	tags: tags
  }
}

module functionApp './modules/functionapp.bicep' = {
  name: 'functionAppDeployment'
  params: {
	functionAppName: functionAppName
	location: location
	tags: tags
	storageAccountName: storage.outputs.storageAccountName
	hostingPlanId: hosting.outputs.hostingPlanId
	blobServiceUri: storage.outputs.blobServiceUri
	applicationInsightsConnectionString: appInsights.outputs.connectionString
  }
}