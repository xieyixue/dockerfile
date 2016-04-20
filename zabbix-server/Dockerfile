From index.tenxcloud.com/alan_xie/ubuntu-ssh 
MAINTAINER xieyixue

RUN wget http://repo.zabbix.com/zabbix/3.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.0-1+trusty_all.deb
RUN dpkg -i zabbix-release_3.0-1+trusty_all.deb
RUN apt-get install -y zabbix-server-mysql

EXPOSE [22,3306,10050,10051,10052,80,8080,8000]

CMD ["/usr/sbin/sshd","-D"]




