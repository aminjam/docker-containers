## hipops-ansible Dockerfile


This repository contains **Dockerfile** of [hipops](https://github.com/aminjam/hipops) with [ansible plugin](http://www.ansible.com/home)  for [Docker](https://www.docker.com/)'s [automated build](https://github.com/aminjam/docker-containers/tree/hipops-ansible) published to the public [Docker Hub Registry](https://registry.hub.docker.com/u/aminjam/hipops-ansible/).

### Base Docker Image & Size

* `latest` tag ~`390MB` from [debian:stable](https://registry.hub.docker.com/_/debian/)

####`hipops` convention
```
./config.json
./hosts/local
```
More example are [available here](https://github.com/aminjam/hipops-examples/tree/master/scenarios).

### Usage `docker run`
```
-v <data-dir>:/home/app -v <git-key-file>:/home/git.key -v <ssh-private-key-file>:/home/vagrant.key -e GIT_KEY=/home/git.key -e PRIVATE_KEY=/home/vagrant.key -d aminjam/hipops-ansible
```

#### w/ custom configuration and inventory
```
-v <data-dir>:/home/app -v <git-key-file>:/home/git.key -v <ssh-private-key-file>:/home/vagrant.key -e GIT_KEY=/home/git.key -e PRIVATE_KEY=/home/vagrant.key -d aminjam/hipops-ansible -config /home/app/custom.json -inventory /home/app/inventory_file
```
#### w/ debug flag
```
-v <data-dir>:/home/app -v <git-key-file>:/home/git.key -v <ssh-private-key-file>:/home/vagrant.key -e GIT_KEY=/home/git.key -e PRIVATE_KEY=/home/vagrant.key -d aminjam/hipops-ansible -debug 3
```

#### w/ AWS inventory using [Boto](http://docs.pythonboto.org/en/latest)
```
-v <data-dir>:/home/app -v <git-key-file>:/home/git.key -v <aws-pem-file>:/home/aws.pem -e GIT_KEY=/home/git.key -e PRIVATE_KEY=/home/aws.pem -e AWS_ACCESS_KEY_ID='MY-ACCESS-KEY' -e AWS_SECRET_ACCESS_KEY='MY-SECRET' -rm aminjam/hipops-ansible
```
