FROM ubuntu:latest

MAINTAINER Leo Gao <aoingl@gmail.com>

# install basic utilities and open ssh
RUN apt-get update \
  && apt-get install -y openjdk-8-jdk \
  openssh-server net-tools \
  python \
  apt-utils vim passwd wget less curl tree debianutils util-linux binutils unzip tar xz-utils gzip jq iptables \
  git subversion git-svn \
  gcc

# install maven & ant
RUN mkdir -p /softwares/maven /softwares/ant /workspace && chmod -R 775 /softwares && chmod -R 777 /workspace

# wget maven 3.3.9
RUN wget -P /softwares/maven/ https://www.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip && (cd /softwares/maven && unzip -q apache-maven-3.3.9-bin.zip && rm -rf default && ln -s apache-maven-3.3.9 default)

# wget ant 1.9.7
RUN wget -P /softwares/ant/ https://www.apache.org/dist/ant/binaries/apache-ant-1.9.7-bin.zip && (cd /softwares/ant && unzip -q apache-ant-1.9.7-bin.zip && rm -rf default && ln -s apache-ant-1.9.7 default)

# add default user leo:leo
RUN useradd -m leo && echo "leo:leo" | chpasswd

# start openssh server on boot
RUN update-rc.d ssh defaults && update-rc.d ssh enable

ADD .bashrc /home/leo/
ADD .bashrc /root/

