FROM docker.io/centos:centos7

MAINTAINER Leo Gao <aoingl@gmail.com>

# install basic utilities
RUN yum update \
    && yum install -y epel-release psmisc gcc gcc-c++ net-tools wget curl jq python java-1.8.0-openjdk-devel maven git vim passwd less tree util-linux binutils unzip tar xz-utils gzip git-svn

# create workspace directory to share to all
RUN mkdir -p /workspace && chmod -R 777 /workspace

# install ninja for useful functions
RUN curl -s -L https://github.com/gaol/ninja/raw/master/install.sh | bash

