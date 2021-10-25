# Render Mermaid Diagrams

Esta action renderiza os diagramas Mermaid utilizados em arquivos Markdown, a partir de um diretório especificado, e gera os diagrams em formatos `.png` ou `.svg`.

## Exemplo de uso

```yaml
steps:
  - name: Checkout code
    uses: actions/checkout@v2

  - name: Render images for every Mermaid diagram in all Markdown files (*.md) in the repo
    uses: ./.github/actions/render-mermaid-diagrams
    with:
      path: mydir

  - name: Commit rendered png and svg files
    uses: stefanzweifel/git-auto-commit-action@v4
    with:
      file_pattern: "*[.svg,.png]"
      commit_message: automatically rendered mermaid diagrams
```

## Entradas

* `path` (opcional): Diretório que contém os arquivos Markdown que serão validados
