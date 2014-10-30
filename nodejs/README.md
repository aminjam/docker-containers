## Node.js Dockerfile


This repository contains **Dockerfile** of [Node.js](http://nodejs.org/) for [Docker](https://www.docker.com/)'s [automated build](https://github.com/aminjam/docker-containers/tree/nodejs/nodejs) published to the public [Docker Hub Registry](https://registry.hub.docker.com/u/aminjam/nodejs). This container image has the size of `346 MB`. This container is using [supervisord](http://supervisord.org/) for auto-restarting the app in the case of failure.

### Base Docker Image

* [ubuntu:latest](https://registry.hub.docker.com/_/ubuntu/)

### Usage `docker run`
    -v <source-files-dir>:/home/app -d aminjam/nodejs

This command executes `start-app.sh` script:

```
cd /home/app/
npm install --production
bower install --config.interactive=false --allow-root
PORT=3001 npm start
```
#### w/ custom NODE_ENV

    -v <source-files-dir>:/home/app -e NODE_ENV=production -d aminjam/nodejs


#### w/ custom `run.sh`
You can add/overwrite `start-app.sh` and/or `run.sh` if needed.

    -v <source-files-dir>:/home/app -v <path-to-custom-run.sh>:/my-run.sh -d aminjam/nodejs /my-run.sh