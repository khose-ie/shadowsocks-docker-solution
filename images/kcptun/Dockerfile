FROM xtaci/kcptun:latest

LABEL author="khose-ie" 
LABEL copyright="Copyright (c) 2022 hyklose@outlook.com"

ENV KCP_REMOTE=
ENV KCP_LISTEN="0.0.0.0:4000"
ENV KCP_MODE="fast3"
ENV KCP_SOCKBUF="16777217"
ENV KCP_DSCP="46"

COPY bin/kcpclient.sh /root/kcpclient.sh
COPY bin/kcpserver.sh /root/kcpserver.sh

RUN chmod +x /root/kcpclient.sh && \
    ln -s /root/kcpclient.sh /usr/sbin/kcpclient && \
    chmod +x /root/kcpserver.sh && \
    ln -s /root/kcpserver.sh /usr/sbin/kcpserver

EXPOSE 4000
ENTRYPOINT ["kcpserver"]
