# Privoxy Docker

A docker image solution for Privoxy.

Until now, only supports to forward remote sock5 protocol to HTTP protocol if use the default configurations.

## Quick Start

As simply as posible to describe:

```bash
docker run -e REMOTE_ADDR=127.0.0.1:8388 -e LISTEN_ADDR=0.0.0.0:1080 -p 1080:1080 hyklose/privoxy:latest
```

> Remember to use your own remote and local IP address to replase upper `127.0.0.1:8388` and `0.0.0.0:1080`.

## Use with Docker Compose

A simple docker compose file should be like the following.

```yml
version: "3"

services:
    privoxy:
        image: hyklose/privoxy:latest
        container_name: privoxy
        restart: unless-stopped
        environment:
            - PRIVOXY_REMOTE=127.0.0.1:8388
            - PRIVOXY_LISTEN=0.0.0.0:1080
        networks:
            - privoxy
        ports:
            - "1080:1080"

networks:
    privoxy:
        name: privoxy
```

Beside this, your work is to change the environment value.

## Privoxy Configration File Modification

Required not, but whether your really want to modify Privoxy configration file, you can see the following.

First, create your own Privoxy configration file and do your custom configurations.

Second, mount your file in host to the docker continer with following scripts.

```bash
docker run  -v privoxy.conf:/etc/privoxy/privoxy.conf hyklose/privoxy:latest
```

> Pay attention that the content `${LISTEN_ADDR}` and `${REMOTE_ADDR}` in Privoxy configration file will be replaced by the environemnt variable value when container startup.

## Environment Configurations

| Environment | Description |
|---------|---------|
| PRIVOXY_REMOTE | The remote sock5 server address, should be a IPv4 value with a port number attached by colon mark `:`. |
| PRIVOXY_LISTEN | The local HTTP address to listen, should be a IPv4 value with a port number attached by colon mark `:`. |
