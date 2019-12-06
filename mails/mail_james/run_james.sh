#!/usr/bin/env bash
if [ "$GLOWROOT_ACTIVATED" == "true" ]; then
    GLOWROOT_OPTIONS=wrapper.java.additional.15=-javaagent:/root/glowroot/glowroot.jar
fi

if [ ! -e "../conf/keystore" ]; then
    echo -e "Generate key store in conf directory on first start up"
    keytool -genkey -alias james -keyalg RSA -keystore ../conf/keystore -keypass yoursecret -storepass yoursecret -dname "CN=jamestest"
fi

echo -e "\nNow going to start http...\n"

httpd

./wrapper-linux-x86-64 ../conf/wrapper.conf wrapper.syslog.ident=james wrapper.pidfile=../var/james.pid wrapper.daemonize=FALSE $GLOWROOT_OPTIONS
