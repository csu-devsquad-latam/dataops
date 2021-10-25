# Export AppConfig Variables

Esta action exporta key/values do [Azure App Configuration](https://docs.microsoft.com/en-us/azure/azure-app-configuration/overview)
para variáveis de ambiente do GitHub.

## Exemplo de Uso

```yaml
- uses: azure/login@v1.1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}

- name: Exports Configs
  uses: ./.github/actions/appconfig-export
  with:
    environment: dev
```

## Entradas
* `environment` (obrigatório): Nome do ambiente
* `conf` (opcional): Arquivo de configuração do DataOps. Valor padrão: `conf.json`
