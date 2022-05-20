#!/bin/sh

exec /bin/client -r "${KCP_REMOTE}" \
                 -l "${KCP_LISTEN}" \
                 -mode "${KCP_MODE}" \
                 -sockbuf "${KCP_SOCKBUF}" \
                 -dscp "${KCP_DSCP}";
