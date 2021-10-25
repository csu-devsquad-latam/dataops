# Extrair parâmetros de saída de um deployment

Esta action extrai os parâmetros de saída de um Azure Deployment para um arquivo no formato properties.

## Exemplo de Uso

```yaml
- name: Extract output params
  uses: ./.github/actions/extract-output-params
  with:
    deploymentOutputFilePath: azureDeploymentOutput.json
    outputParamsFilePath: params.properties
```

## Entradas
* `deploymentOutputFilePath` (Obrigatório) Arquivo de saída do azure deployment contendo os parâmetros de output
* `outputParamsFilePath` (Opcional): Path do arquivo a ser gerado com os parâmetros
