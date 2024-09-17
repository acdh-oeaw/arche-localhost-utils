#!/bin/bash
source "`dirname $0`/volumesdir.sh"
cd "`dirname $0`"
git clone --depth 1 https://github.com/acdh-oeaw/arche-docker-config.git -b arche $VOLUMES_DIR/config
cp custom_config/users.yaml "$VOLUMES_DIR/config/initScripts/users.yaml"
cp custom_config/local.yaml "$VOLUMES_DIR/config/yaml/local.yaml"
cp custom_config/dissServices.ttl "$VOLUMES_DIR/config/initScripts/dissServices.ttl"
for i in data tmp postgresql log vendor gui; do
    mkdir -p "$VOLUMES_DIR/$i"
done
# cp dump.sql -d ${VOLUMES_DIR}/data
# chmod -x ${VOLUMES_DIR}/config/initScripts/40-updateVocabularies.php

