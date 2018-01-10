FROM docker.io/centos:centos7

MAINTAINER Leo Gao <aoingl@gmail.com>

ENV container docker

# install basic utilities and open ssh
RUN yum update \
  && yum install -y epel-release \
  && yum install -y \
  java-1.8.0-openjdk-devel ant maven \
  python \
  golang \
  openssh-server net-tools \
  vim passwd wget less curl tree util-linux binutils unzip tar xz-utils gzip jq \
  git subversion git-svn \
  gcc

RUN mkdir -p /workspace && chmod -R 777 /workspace

RUN curl -s -L https://github.com/gaol/ninja/raw/master/install.sh | bash


