@description('Globally unique storage account name (3-24 lowercase letters and numbers).')
@minLength(3)
@maxLength(24)
param storageAccountName string

@description('Azure region for the storage account.')
param location string

// Keep access OAuth-only and require secure transport for every storage service.
resource storageAccount 'Microsoft.Storage/storageAccounts@2026-06-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  tags: {
    provisionedBy: 'AZ-LZ-Provisioning'
  }
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    allowSharedKeyAccess: false
    defaultToOAuthAuthentication: true
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
  }
}

output storageAccountId string = storageAccount.id
