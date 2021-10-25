# Deploy Bicep Template

Esta action faz o what-if de um template.



## Exemplo de Uso

```yaml
  - name: "Preview infrastructure changes"
    uses: ./.github/actions/azure-whatif
    with:
      subscription: ${{secrets.SUBSCRIPTION_ID}}
      resourceGroup: rg-groupname-dev
      templateFile: azuredeploy.json
      parametersFile: parameters/parameters.dev.json
      additionalParameters: environment=dev githubRepoName=repo-name
```

## Entradas

| Input | Obrigatório | Padrão | Descrição |
| ---: | :---: | --- | ---|
| `subscription` | true | | ID da subscription |
| `resourceGroup` | true | | Nome do resource group |
| `templateFile` | true | | Path do arquivo de template |
| `parametersFile` | false | | Path do arquivo de parâmetros a serem aplicados no template |
| `additionalParameters` | false | | Lista de parâmetros separados por espaço a serem aplicados no template |

## Pré-requisitos
É necessário estar autenticado na Azure para utilizar esta ação.

```yaml
  - uses: azure/login@v1.1
    with:
      creds: ${{secrets.AZURE_CREDENTIALS}}
```
