FROM alpine:latest

LABEL author="hyklose" 
LABEL copyright="Copyright (c) 2022 hyklose@outlook.com"

ENV PRIVOXY_REMOTE="shadowsocks:8388"
ENV PRIVOXY_LISTEN="0.0.0.0:1080"

COPY config/privoxy.conf /etc/privoxy/privoxy.conf
COPY bin/entrypoint.sh /root/entrypoint.sh

RUN apk update && apk add --no-cache --no-progress privoxy
RUN chmod +x /root/entrypoint.sh

EXPOSE 1080
ENTRYPOINT ["/root/entrypoint.sh"]
