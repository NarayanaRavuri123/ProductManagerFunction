using '../main.bicep'

param applicationName = 'productmanager-api'
param environment = 'qa'
param location = 'South India'

param tags = {
  Environment: 'QA'
  Application: 'ProductManagerApi'
  Owner: 'NarayanaReddy'
  ManagedBy: 'Bicep'
}