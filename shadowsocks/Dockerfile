FROM ubuntu:14.04
MAINTAINER xieyixue

RUN apt-get update
RUN apt-get install python-pip
RUN apt-get clean
RUN pip install shadowsocks
ADD conf.json /etc/shadowsocks.json

EXPOSE 8388

CMD ["/usr/local/bin/ssserver", "-c" , "/etc/shadowsocks.json", "-d", "start"]
