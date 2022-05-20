# Kcptun Docker

A docker solution for [xtaci/kcptun](https://github.com/xtaci/kcptun).

## Quick Start

As simply as posible to describe:

For server:

```bash
docker run -e REMOTE_ADDR=127.0.0.1:4001 -e LISTEN_ADDR=0.0.0.0:4000 -p 4001:4001 --entrypoint kcpserver hyklose/kcptun:latest
```

or for client:

```bash
docker run -e REMOTE_ADDR=127.0.0.1:4000 -e LISTEN_ADDR=0.0.0.0:4001 -p 4001:4001 --entrypoint kcpclient hyklose/kcptun:latest
```

> Remember to use your own remote and local IP address to replase upper 0.0.0.0:4000(4001) and 127.0.0.1:4000(4001).

## Use with Docker Compose

A simple docker compose file should be like the following:

```yml
version: "3"
services:
    kcptun-server:
        image: hyklose/kcptun:latest
        entrypoint: kcpserver
        container_name: kcptun-server
        restart: unless-stopped
        environment:
            - KCP_REMOTE=127.0.0.1:4001
            - KCP_LISTEN=0.0.0.0:4000
        networks:
            - kcptun
        ports:
            - 4000:4000

networks:
    kcptun:
        name: kcptun
```

## Configurations

You can use the entrypoint argument to set start the kcp server or client.

| Entrypoint | Description |
|---------|---------|
| kcpserver | Start the kcptun server. |
| kcpclient | Start the kcptun client. |

## Environments

| Environment | Description |
|---------|---------|
| KCP_REMOTE | The remote server address, for kcp client, it is the server address; for kcp server, it is the proxy address. |
| KCP_LISTEN | The local address to listen, default is `0.0.0.0:4000`. |
| KCP_MODE | The value of kcptun parameter `-mode`, default is `fast3`. |
| KCP_SOCKBUF | The value of kcptun parameter `-sockbuf`, default is `16777217`. |
| KCP_DSCP | The value of kcptun parameter `-dscp`, default is `46`. |

> `REMOTE_ADDR` and `LISTEN_ADDR` should be a IPv4 value with a port number attached by colon mark `:`.
