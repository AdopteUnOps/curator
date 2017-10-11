#!/bin/bash
export ELASTICSEARCH_CREDENTIAL=$SERVICE_ELASTICSEARCH_USERNAME:$SERVICE_ELASTICSEARCH_PASSWORD
CONFIG_FILE=/config/curator.yaml
ACTION_FILE=/config/custom-actions.yml

RANCHER_BASEURL="rancher-metadata.rancher.internal/latest"

echo "Fetching curator custom actions"
curl -sf ${RANCHER_BASEURL}/self/service/metadata/curator-actions >> ${ACTION_FILE}

echo "Executing curator"
curator --config ${CONFIG_FILE} ${ACTION_FILE}
