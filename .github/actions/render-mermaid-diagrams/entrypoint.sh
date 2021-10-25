#!/bin/sh

path=$1
echo "path = $path"
for md in $(find "$path" -name "*.md"); do /render-md-mermaid.sh "$md" in-container; done
