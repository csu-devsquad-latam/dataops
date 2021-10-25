#!/usr/bin/env bash

file=$1
environment=$2
conf=$3

[ -z "$file" ] && echo "file is a required argument" && exit 1
[ -z "$environment" ] && echo "environment is a required argument" && exit 1
[ ! -f "$conf" ] && echo "$conf does not exist." && exit 1

servernameProperty=".server.${environment}"
appConfigServerName=$(jq -r "$servernameProperty" "$conf")
propertyPrefix="$(jq -r '.readWrite.namespace' "$conf")."

az appconfig kv import --name "$appConfigServerName"  --source file --path "$file" --format properties --prefix "$propertyPrefix" --yes
