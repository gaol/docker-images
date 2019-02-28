FROM docker.io/centos:centos7

MAINTAINER Leo Gao <aoingl@gmail.com>

# install basic utilities
RUN yum install -y epel-release psmisc gcc gcc-c++ net-tools wget curl jq python java-1.8.0-openjdk-devel maven git vim passwd less tree util-linux binutils unzip tar xz-utils gzip git-svn python2-pip golang golang-src golang-bin make sudo iproute yum-langpacks

# install node js to latest stable: 8.9.4
RUN curl --silent --location https://rpm.nodesource.com/setup_11.x | bash -
RUN yum -y install nodejs

# create workspace directory to share to all
RUN mkdir -p /workspace && chmod -R 777 /workspace

# install chinese support

RUN yum langinstall -y zh_CN
RUN sed -i "s/override_install_langs=/#override_install_langs=/" /etc/yum.conf
RUN yum reinstall -y glibc-common

# update root password
RUN echo "root:root!" |chpasswd

# add user lgao
RUN groupadd -g 1000 lgao && useradd -u 1000 -g 1000 lgao && echo "lgao:lgao" | chpasswd
USER lgao
WORKDIR /home/lgao

# install ninja for useful functions
RUN curl -s -L https://github.com/gaol/ninja/raw/master/install.sh | bash

