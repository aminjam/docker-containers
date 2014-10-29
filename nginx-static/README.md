## Nginx-Static Dockerfile


This repository contains **Dockerfile** of [Nginx](http://nginx.org/) for [Docker](https://www.docker.com/)'s [automated build](https://github.com/aminjam/docker-containers/tree/nginx-static) published to the public [Docker Hub Registry](https://registry.hub.docker.com/u/aminjam/nginx-static/).
This container only display static html content.

### Base Docker Image & Size
* `latest` tag ~`100MB` from [debian:wheezy](https://registry.hub.docker.com/_/debian/)
* `tiny` tag ~ `7MB` (smallest nginx container) from [progrium/rootbuilder](https://registry.hub.docker.com/u/progrium/rootbuilder/)

### Usage `docker run`
You can optionally pass `ro` (read-only) flag for added security.

    -v <static-files-dir>:/home/app:ro -d aminjam/nginx-proxy
