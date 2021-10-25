# Build Bicep Template

Esta action executa o build de um template Bicep e gera um ARM template azuredeploy.json no diretório especificado.

## Exemplo de Uso

```yaml
  - name: Build Bicep Template
    uses: ./.github/actions/bicep-build
    with:
      bicepTemplatePath: main.bicep
      outputTemplatePath: ./azuredeploy.json
```
## Parâmetros

|  | Obrigatório | Padrão | Descrição  |
| ---: | :---: | --- | --- |
| `bicepTemplatePath`      | true |  | Path do arquivo de template bicep |
| `outputTemplatePath`      | true |  | Path do template ARM |