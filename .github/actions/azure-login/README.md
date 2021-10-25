# Login into Azure using AZ CLI

Esta action faz o login no Azure usando AZ CLI.

## Exemplo de Uso

```yaml

  - name: "Logining in into Azure"
    uses: ./.github/actions/azure-login
    with:
      clientId: ${{ secrets.AZ_CLIENT_ID }}
      clientSecret: ${{ secrets.AZ_CLIENT_SECRET }}
      tenantId: ${{ secrets.AZ_TENANT_ID }}

```

## Entradas
* `clientId` (Obrigatório): Client ID do service principal
* `clientSecret` (Obrigatório): Client Secret do service principal
* `tenantId` (Obrigatório): Tenant ID do service principal