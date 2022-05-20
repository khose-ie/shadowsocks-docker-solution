# Shadowsocks Docker Solution

A Shadowsocks client &amp; server integrated solution with docker.

## Quick Start

Download package from GitHub release and unpack.

```bash
tar -zxvf shadowsocks.tar.gz
```

Add you own configuration options in `config.env`, and then:

```bash
docker compose -f shadowsocks-server-compose.yaml up -d
```

or:

```bash
docker compose -f shadowsocks-client-compose.yaml up -d
```

> At least add your own remote address and encrypt password in `config.env`.
