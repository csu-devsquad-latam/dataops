@minLength(3)
@maxLength(63)
@description('Data factory name')
param dataFactoryName string
param location string
param resourceGroupName string
param appName string
param squadName string
param githubRepoName string
param environment string

@allowed([
  'SystemAssigned'
])
param identityType string 

var repoConfigDev = {
  type: 'FactoryGitHubConfiguration'
  accountName: 'viavarejo-internal'
  collaborationBranch: 'develop'
  rootFolder: '/datafactory'
  repositoryName: githubRepoName
}

resource dataFactoryResource 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: location
  tags: {
    'app': '${appName}-iniciative'
    'resource-group-name': resourceGroupName
    'resource-name': dataFactoryName
    'squad': squadName
    'tier': 'orchestration'
    'tier-type': 'data-factory'
  }
  identity: {
    type: identityType
  }
  properties: {
    repoConfiguration: environment == 'dev' ? repoConfigDev : null
  }
}

output adfPrincipalId string = dataFactoryResource.identity.principalId
