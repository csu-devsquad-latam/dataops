param appName string
param squadName string
param location string
param environment string
param githubRepoName string
param resourceGroupName string
param dataFactoryName string = 'via-adf-${appName}-${environment}'
param keyVaultName string = 'via-kv-${appName}-${environment}'
param dataFactoryidentityType string = 'SystemAssigned'

@minValue(7)
@maxValue(90)
param kvSoftDeleteRetentionInDays int = 90

module dataFactoryModule 'modules/data-factory.bicep' = {
  name: 'dataFactoryDeployment'
  params: {
    dataFactoryName: dataFactoryName
    identityType: dataFactoryidentityType
    location: location
    appName: appName
    resourceGroupName: resourceGroupName
    squadName: squadName
    githubRepoName: githubRepoName
    environment: environment
  }
}

module keyVaultModule 'modules/key-vault.bicep' = {
  name: 'keyVaultDeployment'
  params: {
    dataFactoryObjectId: dataFactoryModule.outputs.adfPrincipalId
    keyVaultName: keyVaultName
    location: location
    softDeleteRetention: kvSoftDeleteRetentionInDays
    appName: appName
    resourceGroupName: resourceGroupName
    squadName: squadName
 }
}

output dataFactoryName string = dataFactoryName
output dataFactoryResourceGroup string = resourceGroupName
