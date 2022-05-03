# How to build and test OpenJDK 17

* Checkout openjdk sources

* In source directory, run:
> git clone https://github.com/openjdk/jdk17u

> docker run --rm -it -v "$(pwd):/root/jdk-src" aoingl/jdk-compile:jdk17 /bin/bash

* In `jdk17-src` sub directory, run:

> git checkout jdk-17.0.2+8
> bash configure --with-jtreg=$JTREG_HOME --with-conf-name=linux-x64 --enable-debug --with-boot-jdk=/etc/alternatives/java_sdk_17_openjdk
> make images CONF=linux-x64
> make run-test TEST="test/jdk/jdk/internal/platform/cgroup/TestCgroupSubsystemFactory.java" CONF=linux-x64

