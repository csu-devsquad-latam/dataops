# Nexus Upload

Esta action faz o upload de um arquivo para o nexus.

## Exemplo de uso

```yaml
- name: Upload artifact to Nexus
  uses: ./.github/actions/nexus-upload
  with:
    username: ${{ secrets.NEXUS_USERNAME }}
    password: ${{ secrets.NEXUS_PASSWORD }}
    repositoryName: datalab
    projectName: pocdataops
    artifactName: iac-0.0.1
    uploadDirPath: ./mydir
```

## Parâmetros

| Nome | Obrigatório | Padrão | descrição |
| ---: | :---: | --- | --- |
| `username` | true |  | Usuário do Nexus |
| `password` | true |  | Senha do Nexus |
| `serverUrl` | false | http://nexus.viavarejo.com.br | URL do nexus |
| `repositoryName` | true |  | Nome do repositório |
| `projectName` | true |  | Nome do projeto |
| `artifactName` | true |  | nome do artefato |
| `uploadDirPath` | true |  | Path do diretório que contém os artefatos para upload |
