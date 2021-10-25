#!/usr/bin/env bash

# --environment: (Required)
# --conf: if not informed, try reading from $GITHUB_WORKSPACE/conf.json

environment=$1
conf=$2

[  -z "$environment" ] && echo "environment is a required argument" && exit 1
[ ! -f "$conf" ] && echo "$conf does not exist." && exit 1

appConfigServerName=$(jq -r '.server.'"$environment" "$conf") 

exportConfigs() {
    configs=$1
    removePrefix=$2
    addPrefix=$3

    for configRow in $(echo "$configs" | jq -c '.[]'); do
        configKey=$(echo "$configRow" | jq -r '.key')
        configKey=${configKey#"$removePrefix."}
        [ -n "$addPrefix" ] && configKey=${configKey^}
        keyToExport=${addPrefix}${configKey}
        valueToExport=$(echo "$configRow" | jq -r '.value')
        echo "${keyToExport}=${valueToExport}" >> $GITHUB_ENV
    done
}

for namespaceRow in $(jq -c '.read[]' "$conf"); do
    namespace=$(echo "$namespaceRow" | jq -r '.namespace')
    exportPrefix=$(echo "$namespaceRow" | jq -r '.exportPrefix')
    configs=$(az appconfig kv list --name "$appConfigServerName" --key "$namespace.*")
    exportConfigs "$configs" "$namespace" "$exportPrefix"
done

namespace=$(jq -r '.readWrite.namespace' "$conf")
configs=$(az appconfig kv list --name "$appConfigServerName" --key "$namespace.*")
exportConfigs "$configs" "$namespace" ""
