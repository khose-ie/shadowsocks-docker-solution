# Shadowsocks-libev Docker

A docker solution for [shadowsocks-libev](https://github.com/shadowsocks/shadowsocks-libev).

## Quick Start

As simply as posible to describe:

For server:

```bash
docker run -e LISTEN_ADDR=0.0.0.0:4000 -e ENCRYPT_PASSWD=12345678 -p 4000:4000 --entrypoint ssserver hyklose/shadowsocks-libev:latest
```

or for client:

```bash
docker run -e REMOTE_ADDR=127.0.0.1:4000 -e LISTEN_ADDR=0.0.0.0:4001 -e ENCRYPT_PASSWD=12345678 -p 4001:4001 --entrypoint ssclient hyklose/shadowsocks-libev:latest
```

> Remember to use your own remote and local IP address to replase upper 0.0.0.0:4000(4001) and 127.0.0.1:4000(4001).

## Use with Docker Compose

A simple docker compose file should be like the following:

```yml
version: "3"

services:
    shadowsocks-libev:
        image: hyklose/shadowsocks-libev:latest
        container_name: shadowsocks-client
        restart: unless-stopped
        entrypoint: ssserver
        environment:
            - SHADOWSOCKS_ENCRYPT_PASSWD=
        networks:
            - shadowsocks-server
        ports:
            - "8388:8388"

networks:
    shadowsocks-server:
        name: shadowsocks-server
```

> At least, you need to input your remote IP address and you encrypt password to then environment variable to start your shadowsocks-libev container.

## Configurations

You can use the entrypoint argument to set start the kcp server or client.

| Entrypoint | Description |
|---------|---------|
| ssserver | Start the shadowsocks-libev server. |
| ssclient | Start the shadowsocks-libev client. |

## Environments

| Environment | Description |
|---------|---------|
| SHADOWSOCKS_REMOTE | The remote server address, for shadowsocks-libev client, it is the server address; for shadowsocks-libev server, it is not needed. |
| SHADOWSOCKS_LISTEN | The local address to listen, default is `0.0.0.0:8388`. |
| SHADOWSOCKS_ENCRYPT_METHOD | The encrypt method, default is `aes-256-gcm`. |
| SHADOWSOCKS_ENCRYPT_PASSWD | The encrypt password. |
| SHADOWSOCKS_TIMEOUT | The timeout value, default is `300`. |
| SHADOWSOCKS_SERVER_DNS | The server DNS value, default is `8.8.8.8,8.8.4.4`. |

> `REMOTE_ADDR` and `LISTEN_ADDR` should be a IPv4 value with a port number attached by colon mark `:`.
