#!/bin/sh

SERVER_ADDR=${SHADOWSOCKS_LISTEN%:*}
SERVER_PORT=${SHADOWSOCKS_LISTEN#*:}

ENCRYPT_METHOD=${SHADOWSOCKS_ENCRYPT_METHOD}
ENCRYPT_PASSWD=${SHADOWSOCKS_ENCRYPT_PASSWD}

TIMEOUT=${SHADOWSOCKS_TIMEOUT}
SERVER_DNS=${SHADOWSOCKS_SERVER_DNS}

exec ss-server -s ${SERVER_ADDR} \
               -p ${SERVER_PORT} \
               -k ${ENCRYPT_PASSWD} \
               -m ${ENCRYPT_METHOD} \
               -t ${TIMEOUT} \
               -d ${SERVER_DNS} \
               -u