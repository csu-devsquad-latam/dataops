# Import AppConfig Variables
Esta action importa key/values para [Azure App Configuration](https://docs.microsoft.com/en-us/azure/azure-app-configuration/overview)
a partir de um arquivo de properties.

## Exemplo de Uso
```yaml
  - name: "Import config file"
    uses: ./.github/actions/appconfig-import
    with:
      parametersFilePath: params.properties
      environment: dev
```


|  | Obrigatório | Padrão | Descrição  |
| ---: | :---: | --- | --- |
| `parametersFilePath`      | false      |    | Arquivo json gerado pelo deployment que contém as variáveis de output |
| `environment`      | true      |    | Nome do ambiente |
| `conf`      | false      |   conf.json | Arquivo de configuração do DataOps |