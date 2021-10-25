# Nexus Upload

Esta action faz o download de um arquivo do nexus.

## Exemplo de uso

```yaml
- name: Nexus Download
  uses: ./.github/actions/nexus-download
  with:
    repositoryName: datalab
    projectName: pocdataops
    artifactName: iac-0.0.1.zip
    outputDirPath: ./mydir
```

## Parâmetros

| Nome | Obrigatório | Padrão | descrição |
| ---: | :---: | --- | --- |
| `serverUrl` | false | http://nexus.viavarejo.com.br | URL do nexus |
| `repositoryName` | true |  | Nome do repositório |
| `projectName` | true |  | Nome do projeto |
| `artifactName` | true |  | Nome do artefato |
| `outputDirPath` | false | Diretório onde o artefato será baixado e descompactado |
