# Download ARM Toolkit

Esta action valida um template ARM.

## Exemplo de Uso

```yaml
  - name: Validade
    uses: ./.github/actions/arm-template-validate
    with:
      templateDirPath: ./infrastructure
```
## Parâmetros

|  | Obrigatório | Padrão | Descrição  |
| ---: | :---: | --- | --- |
| `templateDirPath`      | true |  | Path do diretório que contém o template azuredeploy.json |
