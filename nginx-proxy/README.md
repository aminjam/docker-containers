## Nginx-Proxy Dockerfile


This repository contains **Dockerfile** of [Nginx](http://nginx.org/) for [Docker](https://www.docker.com/)'s [automated build](https://github.com/aminjam/docker-containers/tree/nginx-proxy) published to the public [Docker Hub Registry](https://registry.hub.docker.com/u/aminjam/nginx-proxy/). This container image has the size of `142 MB`.
This container is using [forego](https://github.com/ddollar/forego) and [docker-gen](https://github.com/jwilder/docker-gen) for auto-generating reverse proxy configs for `nginx` and reloads `nginx` when containers are started and stopped.
This is a copy of [jwilder](https://registry.hub.docker.com/u/jwilder/nginx-proxy/) image with a `debian:wheezy` base for smaller footprint.

### Base Docker Image

* [debian:wheezy](https://registry.hub.docker.com/_/debian/)

### Usage `docker run`

#### nginx-proxy container
    -v /var/run/docker.sock:/tmp/docker.sock -p 80:80 -d aminjam/nginx-proxy

#### any other container with a single exposed PORT
    -e VIRTUAL_HOST=my.awesome.site.com -d my-image

#### any other container with multiple exposed PORTs
    -e VIRTUAL_HOST=my.awesome.site.com -e VIRTUAL_PORT=3001 -d my-image
