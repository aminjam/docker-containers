## Node.js Dockerfile


This repository contains **Dockerfile** of [Node.js](http://nodejs.org/) for [Docker](https://www.docker.com/)'s [automated build](https://github.com/aminjam/docker-containers/tree/nodejs/nodejs) published to the public [Docker Hub Registry](https://registry.hub.docker.com/u/aminjam/nodejs). This container image has the size of `346 MB`.

### Base Docker Image

* [ubuntu:latest](https://registry.hub.docker.com/_/ubuntu/)

### Usage `docker run`
```
-v /PATH/TO/SOURCE_FILES:/home/app -d aminjam/nodejs
```
This command executes`run.sh` which is starting the [supervisord](http://supervisord.org/) for auto-restarting the node app through the following script:
```
cd /home/app/
npm install --production
bower install --config.interactive=false --allow-root
PORT=3001 npm start
```

### Customization `docker run`
You can add/overwrite `start-app.sh` and/or `run.sh` if needed.
```
-v /PATH/TO/SOURCE_FILE:/home/app -v /PATH/TO/MY_CUSTOM_Run.sh:/myRun.sh -d aminjam/nodejs /myRun.sh
```
