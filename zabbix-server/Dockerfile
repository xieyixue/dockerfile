FROM ubuntu:14.04
MAINTAINER xyx_0410@163.com

RUN wget http://repo.zabbix.com/zabbix/3.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.0-1+trusty_all.deb
RUN dpkg -i zabbix-release_3.0-1+trusty_all.deb

RUN apt-get update && \
    apt-get -y install \
    zabbix-server-mysql \
    php5-mysql \
    zabbix-frontend-php \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


EXPOSE [22,3306,10050,10051,10052,80,8080,8000]

CMD ["/usr/sbin/sshd","-D"]
