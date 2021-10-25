# Deploy Bicep Template

Esta action faz o deploy de um ARM template.

Antes de utilizar essa action, é necessário realizar a autenticação com a action azure/login.

## Exemplo de Uso

```yaml
  - name: "Deploy template"
    uses: ./.github/actions/azure-deploy
    with:
      subscription: ${{secrets.AZ_SUBSCRIPTION_ID}}
      resourceGroup: rg-resourcegroup-dev
      templateFile: ./azuredeploy.json
      parametersFile: ./parameters/parameters.dev.json
      additionalParameters: environment=dev githubRepoName=repo-name
      deploymentOutputFilePath: ./deploymentResult.json
```

## Entradas

| Nome | Obrigatório | Padrão | Descrição |
| ---: | :---: | --- | --- |
| `subscription` | true | | Id da subscription na qual executar o deployment |
| `resourceGroup` | true | | Nome do resource group |
| `templateFile` | true | | Path para o arquivo de template ARM |
| `parametersFile` | true | | Path para o arquivo de parâmetros json |
| `additionalParameters` | false | | Parâmetros adicionais separados por espaço |
| `deploymentOutputFilePath` | true | | Path para o arquivo em que a saída do deployment será escrita |


## Pré-requisito
```yaml
- name: "Logging to Azure"
  uses: ./.github/actions/azure-login
  with:
    clientId: ${{ secrets.AZ_CLIENT_ID }}
    clientSecret: ${{ secrets.AZ_CLIENT_SECRET }}
    tenantId: ${{ secrets.AZ_TENANT_ID }}
```