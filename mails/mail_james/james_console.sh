#!/usr/bin/env bash

dcname="localtest.tld"
[ "$(docker ps --all | grep $dcname)" == "" ] && echo -e "Container id or name is not found" && exit 1

podman exec -t $dcname ./james-cli.sh $@
