# Docker Images of Apache James Server

`mail_james` branch contains set up for james mail server and a roundcube webmail


## How to use it

```
git clone https://github.com/gaol/docker-images
cd docker-images
git checkout mail_james
cd mails/mail_james/
./start.sh   # This will start a james server container with port: 9025 in local host
```

In another console:

```
cd mails/mail_james/
./init_data.sh     # This will create 2 test users:
```

The above `init_data.sh` will create 2 test users:
* testa@localtest.tld, password: testa
* testb@localtest.tld, password: testb

After that, you can access the web mail via link:

> http://localhost:9080/webmail/

Enjoy it!

## You can also build the docker image yourself

```
cd mails/mail_james/
docker build .
```

