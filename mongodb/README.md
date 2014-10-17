## MongoDB Dockerfile


This repository contains **Dockerfile** of [MongoDB](http://www.mongodb.org/) for [Docker](https://www.docker.com/)'s [automated build](https://github.com/aminjam/docker-containers/tree/mongodb) published to the public [Docker Hub Registry](https://registry.hub.docker.com/u/aminjam/mongodb/). This container image has the size of `354 MB`. This container is using [supervisord](http://supervisord.org/) for auto-restarting the app in the case of failure.

### Base Docker Image

* [debian:wheezy](https://registry.hub.docker.com/_/debian/)

### Usage `docker run`

#### default
    -d aminjam/mongodb

#### w/ persistent/shared directory
    -v <db-dir>:/home/app -d aminjam/mongodb

#### w/ mongo options e.g. smallfiles, rest
    -e MONGO_OPTIONS="--smallfiles --rest" -d aminjam/mongodb

#### w/ custom `run.sh`
    -v <path-to-custom-run.sh>:/my-run.sh -d aminjam/mongodb my-run.sh
