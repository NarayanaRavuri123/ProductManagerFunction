using '../main.bicep'

param applicationName = 'productmanager-api'
param environment = 'dev'
param location = 'South India'

param tags = {
  Environment: 'Development'
  Application: 'ProductManagerApi'
  Owner: 'NarayanaReddy'
  ManagedBy: 'Bicep'
}