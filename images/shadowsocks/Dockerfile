FROM shadowsocks/shadowsocks-libev:latest

LABEL author="khose-ie" 
LABEL copyright="Copyright (c) 2022 hyklose@outlook.com"

ENV SHADOWSOCKS_REMOTE="kcptun:4000"
ENV SHADOWSOCKS_LISTEN="0.0.0.0:8388"
ENV SHADOWSOCKS_ENCRYPT_METHOD="aes-256-gcm"
ENV SHADOWSOCKS_ENCRYPT_PASSWD=
ENV SHADOWSOCKS_TIMEOUT="300"
ENV SHADOWSOCKS_SERVER_DNS="8.8.8.8,8.8.4.4"

USER root

COPY bin/ssclient.sh /root/ssclient.sh
COPY bin/ssserver.sh /root/ssserver.sh

RUN chmod +x /root/ssclient.sh && \
    ln -s /root/ssclient.sh /usr/bin/ssclient && \
    chmod +x /root/ssserver.sh && \
    ln -s /root/ssserver.sh /usr/bin/ssserver

EXPOSE 8388
ENTRYPOINT ["ssserver"]
