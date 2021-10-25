# Login into Azure using PowerShell

Esta action faz o login no Azure usando PowerShell.

## Exemplo de Uso

```yaml

  - name: "Logining in into Azure via PowerShell"
    uses: ./.github/actions/azure-login-powershell
    with:
      clientId: ${{ secrets.AZ_CLIENT_ID }}
      clientSecret: ${{ secrets.AZ_CLIENT_SECRET }}
      tenantId: ${{ secrets.AZ_TENANT_ID }}
```

## Entradas
* `clientId` (Obrigatório): Client ID do service principal
* `clientSecret` (Obrigatório): Client Secret do service principal
* `tenantId` (Obrigatório): Tenant ID do service principal