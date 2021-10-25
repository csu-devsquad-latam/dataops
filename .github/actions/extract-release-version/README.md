# Extract Release Version

Esta action extrai a versão semnântica de uma branch de release no formato `release/*`.

## Exemplo de Uso

```yaml
- name: Extract release version
  id: step_name
  uses: ./.github/actions/extract-release-version

- name: Sample usage
  run: echo ${{ steps.step_name.outputs.version }}
```

## Saídas

* `version`: Versão extraída do nome da branch de release
