@description('Hosting plan name')
param hostingPlanName string

@description('Azure region')
param location string

@description('Tags')
param tags object

resource hostingPlan 'Microsoft.Web/serverfarms@2024-11-01' = {
  name: hostingPlanName
  location: location
  kind: 'functionapp'
  sku: {
	name: 'FC1'
	tier: 'FlexConsumption'
  }
  properties: {
	reserved: true
  }
  tags: tags
}

output hostingPlanId string = hostingPlan.id
output hostingPlanName string = hostingPlan.name