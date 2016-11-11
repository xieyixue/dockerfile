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
    aptitude \
    nginx \
    php5-fpm \
    zabbix-server-mysql \
    php5-mysql \
    zabbix-frontend-php \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN DEBIAN_FRONTEND=noninteractive aptitude -y install mysql-server && aptitude clean
RUN service mysql start && mysqladmin password qssec.com
RUN mysql -pqssec.com -e 'CREATE DATABASE  `zabbix` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;'
WORKDIR /usr/share/doc/zabbix-server-mysql

RUN gzip -d create.sql.gz
RUN mysql -pqssec.com zabbix < create.sql
RUN cp -r /usr/share/zabbix /usr/share/nginx/www
ADD zabbix_nginx.conf /etc/nginx/sites-enabled/default
ADD zabbix.conf.php /usr/share/nginx/www/conf/zabbix.conf.php

RUN echo 'DBUser=root' >> /etc/zabbix/zabbix_server.conf
RUN echo 'DBPassword=qssec.com' >> /etc/zabbix/zabbix_server.conf

RUN echo 'post_max_size = 16M' >> /etc/php5/fpm/php.ini
RUN echo 'max_input_time = 300' >> php.ini
RUN echo 'max_execution_time = 300' >> php.ini
RUN echo 'date.timezone = "Asia/Shanghai"' >> php.ini


ADD run.sh /run.sh

EXPOSE 80

CMD ["./run.sh"]
