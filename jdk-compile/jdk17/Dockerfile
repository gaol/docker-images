FROM fedora:35

MAINTAINER Leo Gao <aoingl@gmail.com>

# Boot JDK of JDK 17 must be 16 or 17

# install basic utilities
RUN dnf install -y gcc gcc-c++ net-tools wget curl jq git vim passwd less tree util-linux binutils unzip tar gzip make sudo iproute

RUN dnf install -y java-17-openjdk-devel

RUN dnf install -y zip libXtst-devel libXt-devel libXrender-devel libXrandr-devel libXi-devel cups-devel fontconfig-devel alsa-lib-devel

WORKDIR "/root/jdk-src"

ENV JTREG_HOME /root/jtreg

RUN wget -O /root/jtreg.tar.gz https://ci.adoptopenjdk.net/view/Dependencies/job/dependency_pipeline/lastSuccessfulBuild/artifact/jtreg/jtreg-6+1.tar.gz

RUN cd /root/ && tar -xzf jtreg.tar.gz && export PATH=$JTREG_HOME/bin:$PATH


