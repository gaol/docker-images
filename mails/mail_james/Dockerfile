FROM docker.io/centos:centos7

MAINTAINER Leo Gao <aoingl@gmail.com>

# install basic utilities
RUN yum install -y epel-release gcc gcc-c++ net-tools wget curl jq python3 java-1.8.0-openjdk-devel git vim passwd less tree util-linux binutils unzip tar xz-utils gzip make sudo iproute

WORKDIR /root

# download glowroot for APM
ARG GLOWROOT_VERSION=0.13.5
RUN wget -q -O glowroot-${GLOWROOT_VERSION}-dist.zip https://github.com/glowroot/glowroot/releases/download/v${GLOWROOT_VERSION}/glowroot-${GLOWROOT_VERSION}-dist.zip
RUN unzip -q glowroot-${GLOWROOT_VERSION}-dist.zip

# install webmail
RUN yum install -y httpd php php-xml php-sqlite3 php-mbstring

# The Roundcube Webmail suite https://roundcube.net
ENV webmail_version "1.4.1"
RUN wget -q -O /tmp/roundcubemail-${webmail_version}-complete.tar.gz https://github.com/roundcube/roundcubemail/releases/download/${webmail_version}/roundcubemail-${webmail_version}-complete.tar.gz

# Install james by downloading the distribution
# http://mirror.bit.edu.cn/apache/james/server/3.4.0/james-server-app-3.4.0-app.zip
ARG VERSION=3.4.0
RUN wget -q -O james-server-app-$VERSION.zip http://mirror.bit.edu.cn/apache/james/server/$VERSION/james-server-app-$VERSION-app.zip
RUN unzip -q james-server-app-$VERSION.zip

ADD destination/glowroot/plugins /root/glowroot/plugins
ADD destination/glowroot/admin.json /root/glowroot/admin.json

ADD run_james.sh /root/run_james.sh

VOLUME /root/logs
VOLUME /root/conf


EXPOSE 25 80 465 993 995

# Copy configuration.
RUN rm -r "james-server-app-$VERSION/conf" && cd "james-server-app-$VERSION" && ln -s /root/conf conf
RUN rm -r "james-server-app-$VERSION/log" && cd "james-server-app-$VERSION" && ln -s /root/logs log

ENV PATH "$PATH:/root/glowroot/lib"

RUN cd /var/www/html/ \
  && tar xzf /tmp/roundcubemail-${webmail_version}-complete.tar.gz \
  && mv roundcubemail-${webmail_version}/ webmail \
  && chown -R apache:apache webmail/ \
  && rm -fr /var/www/html/webmail/installer \
  && mkdir -p /mnt/sqlite/roundcube \
  && chown -R apache /mnt/sqlite/roundcube

COPY config.inc.php /var/www/html/webmail/config/config.inc.php
COPY index.html /var/www/html/

VOLUME /mnt/sqlite

WORKDIR "/root/james-server-app-$VERSION/bin"

CMD ["/root/run_james.sh"]


