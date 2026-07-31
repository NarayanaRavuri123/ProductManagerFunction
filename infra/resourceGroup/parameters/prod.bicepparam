using '../main.bicep'

param applicationName = 'productmanager-api'
param environment = 'prod'
param location = 'South India'

param tags = {
  Environment: 'PRODUCTION'
  Application: 'ProductManagerApi'
  Owner: 'NarayanaReddy'
  ManagedBy: 'Bicep'
}