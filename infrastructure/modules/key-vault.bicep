param keyVaultName string
param dataFactoryObjectId string
param location string
param softDeleteRetention int
param appName string
param resourceGroupName string
param squadName string

resource keyVault 'Microsoft.KeyVault/vaults@2021-06-01-preview' = {
  name: keyVaultName
  location: location
  tags: {
    'app': '${appName}-iniciative'
    'resource-group-name': resourceGroupName
    'resource-name': keyVaultName
    'squad': squadName
    'tier': 'storage'
    'tier-type': 'key-vault'
  }
  properties: {
    enableSoftDelete: true
    softDeleteRetentionInDays: softDeleteRetention
    tenantId: subscription().tenantId
    networkAcls: {
      defaultAction:'Deny'
    }
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        objectId: dataFactoryObjectId
        tenantId: subscription().tenantId
        permissions: {
          secrets: [
            'get'
          ]
        }
      }
    ]
  }
}
