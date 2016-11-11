FROM ubuntu:14.04
MAINTAINER xyx_0410@163.com
RUN groupadd mysql
RUN groupadd nginx 
RUN groupadd zabbix
RUN useradd -r -g mysql mysql
RUN useradd -r -g zabbix zabbix
RUN useradd -r -g nginx nginx

RUN apt-get update && \
    apt-get -y install \
    wget \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget http://repo.zabbix.com/zabbix/3.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.0-1+trusty_all.deb
RUN dpkg -i zabbix-release_3.0-1+trusty_all.deb

RUN apt-get update && \
    apt-get -y install \
    nginx \
    php5-fpm \
    zabbix-server-mysql \
    php5-mysql \
    zabbix-frontend-php \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cp -r /usr/share/zabbix /usr/share/nginx/www
ADD zabbix_nginx.conf /etc/nginx/sites-enabled/default

ADD run.sh /run.sh

EXPOSE 80

CMD ["./run.sh"]
