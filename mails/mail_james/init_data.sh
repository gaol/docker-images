#!/usr/bin/env bash

dcname="localtest.tld"
[ "$(docker ps --all | grep $dcname)" == "" ] && echo -e "Container id or name is not found" && exit 1

dname="${dcname}"
echo -e "Adding user: testa@${dname} with password: testa"
docker exec -t $dcname ./james-cli.sh AddUser "testa@${dname}" testa

echo -e "Adding user: testb@${dname} with password: testb"
docker exec -t $dcname ./james-cli.sh AddUser "testb@${dname}" testb

echo -e "Please NOTE:\n\n* James SMTP server treat username in lowercase\n* domainname does not allow underline '_'\n* domain names in this set up contain: ${dname}\n"

echo -e "\n\n* Now you can login to the webmail: http://localhost:9080/webmail/\n*   Username: testa@${dname}, password: testa\n   Username: testb@${dname}, password: testb\n"


