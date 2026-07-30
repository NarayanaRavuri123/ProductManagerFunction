param functionAppName string
param location string
param tags object

param hostingPlanId string

param storageAccountName string
param blobServiceUri string

param applicationInsightsConnectionString string

resource functionApp 'Microsoft.Web/sites@2023-12-01' = {
  name: functionAppName
  location: location
  kind: 'functionapp,linux'
  identity: {
	  type: 'SystemAssigned'
  }
  properties: {
	serverFarmId: hostingPlanId
	functionAppConfig: {
		deployment: {
			storage: {
			  type: 'blobContainer'
			  value: '<deployment package location>'
			  authentication: {
				type: 'SystemAssignedIdentity'
			  }
			}
		 }
		runtime: {
			name: 'dotnet-isolated'
			version: '10.0'
		}

		scaleAndConcurrency: {
			maximumInstanceCount: 100
			instanceMemoryMB: 2048
		}
	}
	siteConfig: {
	  appSettings: [
		{
		  name: 'AzureWebJobsStorage__blobServiceUri'
		  value: blobServiceUri
		}
		{
		  name: 'AzureWebJobsStorage__accountName'
		  value: storageAccountName
		}
		{
		  name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
		  value: applicationInsightsConnectionString
		}
	  ]
	}
	httpsOnly: true
  }
  tags: tags
}


output functionAppName string = functionApp.name