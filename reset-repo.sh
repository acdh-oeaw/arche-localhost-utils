#!/bin/bash
cd "`dirname $0`"
source volumesdir.sh
#
docker stop acdh-repo
for i in data tmp postgresql log vendor gui; do
    rm -rf "$VOLUMES_DIR/$i"
    mkdir "$VOLUMES_DIR/$i"
done
rm -fr "$VOLUMES_DIR/config"
git clone https://github.com/acdh-oeaw/arche-docker-config.git -b arche "$VOLUMES_DIR/config"
cp users.yaml "$VOLUMES_DIR/config/initScripts/users.yaml"
cp custom_config/dissServices.ttl "$VOLUMES_DIR/config/initScripts/dissServices.ttl"

