#!/bin/sh

PRIVOXY_CONF=/etc/privoxy/privoxy.conf

sed -i "s/\${PRIVOXY_LISTEN}/${PRIVOXY_LISTEN}/g" ${PRIVOXY_CONF}
sed -i "s/\${PRIVOXY_REMOTE}/${PRIVOXY_REMOTE}/g" ${PRIVOXY_CONF}

exec privoxy --no-daemon ${PRIVOXY_CONF}
