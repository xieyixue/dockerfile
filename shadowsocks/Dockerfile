# Docker with shadowsocks in pure c

FROM alpine
MAINTAINER YIXUE XIE

ENV SS_VER 2.4.5
ENV SS_URL https://github.com/shadowsocks/shadowsocks-libev/archive/v$SS_VER.tar.gz
ENV SS_DIR shadowsocks-libev-$SS_VER
ENV SS_DEP autoconf build-base curl libtool linux-headers openssl-dev

RUN set -ex \
    && apk add --update $SS_DEP \
    && curl -sSL $SS_URL | tar xz \
    && cd $SS_DIR \
        && ./configure \
        && make install \
        && cd .. \
        && rm -rf $SS_DIR \
    && apk del --purge $SS_DEP \
    && rm -rf /var/cache/apk/*
ADD conf.json /etc/shadowsocks.json
ADD run.sh run.sh

EXPOSE 8888

CMD ["run.sh"]
