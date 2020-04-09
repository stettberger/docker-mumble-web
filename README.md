# docker-mumble-web Dockerfile

This repository contains **Dockerfile** of [Mumble](http://wiki.mumble.info/wiki/Main_Page) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/stettberger/docker-mumble-web/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

## Base Docker Image

- [nginx](https://registry.hub.docker.com/_/gninx/)

## Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/stettberger/docker-web-mumble/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull stettberger/docker-web-mumble`

## Usage

To launch it, just type:

```
docker run -d -p 64738:64738 -p 64738:64738/udp -p 80:80 stettberger/docker-web-mumble
```

For more information look at the docker-compose file.
