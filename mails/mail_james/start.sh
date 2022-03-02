#!/usr/bin/env bash

dcname="localtest.tld"
james_version="3.4.0"
imgname="aoingl/docker-images:mail_james"
if [ "$(docker ps --all | grep $dcname)" != "" ]; then
  docker stop $dcname
  docker rm $dcname
fi

wdir="`dirname $0`"
cwd="`cd $wdir && pwd`"
docker run --name $dcname --hostname $dcname -v "$cwd/destination/${james_version}/conf:/root/conf" -v "$cwd/destination/${james_version}/logs:/root/logs" --env SMTP_HOSTNAME=$dcname --env IMAP_HOSTNAME=$dcname -p 9080:80 -p 9465:465 -p 9025:25 --rm -it $imgname
