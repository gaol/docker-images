#!/usr/bin/env bash

wdir="`dirname $0`"
cwd="`cd $wdir && pwd`"

echo -e "Now start the james server"

dcname="localtest.tld"
james_version="3.5.0"
imgname="aoingl/docker-images:mail_james"
if [ "$(docker ps --all | grep $dcname)" != "" ]; then
  docker stop $dcname
  docker rm $dcname
fi

docker run --name $dcname --hostname $dcname -v "$cwd/destination/${james_version}/conf:/root/conf" --env SMTP_HOSTNAME=$dcname -v "$cwd/config.inc.php:/var/www/html/webmail/config/config.inc.php" -v "$cwd/.htaccess:/var/www/html/webmail/.htaccess" --env IMAP_HOSTNAME=$dcname -p 9080:80 -p 9025:25 -p 9143:143 --rm -it $imgname
