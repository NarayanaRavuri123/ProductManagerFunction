using '../main.bicep'

param applicationName = 'productmanager-api'
param environment = 'uat'
param location = 'South India'

param tags = {
  Environment: 'UAT'
  Application: 'ProductManagerApi'
  Owner: 'NarayanaReddy'
  ManagedBy: 'Bicep'
}