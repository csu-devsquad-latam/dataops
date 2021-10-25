#!/usr/bin/env bash
# Usage: render-md-mermaid.sh document.md
#
# This can be invoked on any Markdown file to render embedded mermaid diagrams, provided they are presented in the following format:
#
# ![rendered image description](relative/path/to/rendered_image.png)
# <details>
#   <summary>diagram source</summary>
#   This details block is collapsed by default when viewed in GitHub. This hides the mermaid graph definition, while the rendered image
#   linked above is shown. The details tag has to follow the image tag. (newlines allowed)
#
# ```mermaid
# graph LR
#     A[README.md]
#     B{Find mermaid graphs<br>and image paths}
#     C[[docker mermaid-cli]]
#     D[[docker mermaid-cli]]
#     E(Graph 1 png image)
#     F(Graph 2 svg image)
#
#     A -->|passed to| B
#     subgraph render-md-mermaid.sh
#       B --> |path/to/image1.png<br>+mermaid source| C
#       B --> |path/to/image2.svg<br>+mermaid source| D
#     end
#     C --> E
#     D --> F
# ```
# </details>
#
# The script will pick up the graph definition from the mermaid code block and render it to the image file and path specified in the
# image tag using mermaid-cli. The rendered image can be in svg or png format, whatever is specified will be generated.

set -eu

if [ "$1" == "" ]; then
  echo "$(tput setaf 1)No Markdown document specified$(tput sgr0)"
  echo ""
  cat $0 | grep -E "^#" | grep -Ev "^#!/" | sed -E 's/^#[ ]?//'
  exit 1
fi

# Detect Markdown file
markdown_input=$1
markdown_dir="$(dirname $markdown_input)"
echo "Markdown file: $markdown_input"

# Generate temp mermaid config file (more info: https://mermaid-js.github.io/mermaid/#/./Setup)
mermaid_config='{"flowchart": {"useMaxWidth": false }}'
echo "$mermaid_config" >> .render-md-mermaid-config.json

# Generate temp mermaid CSS file
mermaid_css='#container > svg { max-width: 100% !important; }'
echo "$mermaid_css" >> .render-md-mermaid.css

mermaid_file=""
IFS=$'\n'
image_re=".*\.(svg|png)$"

# Iterate over lines in the file and check if the pattern matches
# If exists, generate a .mermaid file
for line in $(perl -0777 -ne 'while(m/!\[.*?\]\(([^\)]+)\)\n+<details>([\s\S]*?)```mermaid\n([\s\S]*?)\n```/g){print "$1\n$3\n";} ' "$markdown_input")
do
  if [[ $line =~ $image_re ]]; then
    mermaid_file="$line.mermaid"

    if [[ ! "$mermaid_file" =~ ^.*/.* ]]; then
      mermaid_file="./$mermaid_file"
    fi

    mkdir -p -- "${mermaid_file%/*}"
  else
    if [[ ! "$mermaid_file" = "" ]]; then
      echo "$line" >> "$mermaid_file"
    fi
  fi
done;

# Iterate over the images associated on .mermaid files
for mermaid_img in $(find . -name "*.mermaid" | sed -E 's/((.*).mermaid)/\2|\1/')
do
  # Trim the image file path considering it in relative path format
  file_name=${mermaid_img%|*}
  trimmed_image_file=${file_name#"./"}

  if [[ $trimmed_image_file == /* ]]; then
    trimmed_image_file=${trimmed_image_file:1}
  fi

  image_file="$markdown_dir/$trimmed_image_file"
  mermaid_file=${mermaid_img#*|}

  # Run the mermaid cli to render the mermaid spec to an image file
  if [[ "$2" == "in-container" ]]; then
    /home/mermaidcli/node_modules/.bin/mmdc -p /puppeteer-config.json -o "$image_file" -i "$mermaid_file" -t neutral -C ".render-md-mermaid.css" -c ".render-md-mermaid-config.json" -s 4
  else
    docker run --rm -t -v "$PWD:/data" minlag/mermaid-cli:latest -o "/data/$image_file" -i "/data/$mermaid_file" -t neutral -C "/data/.render-md-mermaid.css" -c "/data/.render-md-mermaid-config.json" -s 4
  fi

  # Add line breaks for better readability
  if [[ "$image_file" =~ ^.*\.svg$ ]]; then
    sed -i.bak -e 's/<br>/<br\/>/g' $image_file
  fi

  echo "Generated: $image_file"
  rm -f "$mermaid_file" "$image_file.bak"
done

# Remove temp files
rm -f .render-md-mermaid-config.json .render-md-mermaid.css
