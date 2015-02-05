## Couchbase Dockerfile


This repository contains **Dockerfile** of [Couchbase](http://www.couchbase.com/) for [Docker](https://www.docker.com/)'s [automated build](https://github.com/aminjam/docker-containers/tree/couchbase) published to the public [Docker Hub Registry](https://registry.hub.docker.com/u/aminjam/couchbase/).
Couchbase requires a lot of (over 100) ports to be open due to the baked-in master-master replication, so running the container with `--net="host"` is recommended. It is also required to know the IP address of the first machine in the cluster via the `COUCHBASE_SERVER` env variable.

### Base Docker Image & Size

* `community` tag ~`657MB` from [debian:wheezy](https://registry.hub.docker.com/_/debian/) `v3.0.1`

### Usage `docker run`
  - First server in the cluster

        --net="host" -e COUCHBASE_USER=admin -e COUCHBASE_PASS=password -d aminjam/couchbase cluster-init

  - Other servers in the cluster (assuming the first server has the IP of `172.20.21.10`)

        --net="host" -e COUCHBASE_USER=admin -e COUCHBASE_PASS=password -e COUCHBASE_SERVER=172.20.21.10 -d aminjam/couchbase rebalance

#### w/ persistent/shared directory
    -v <data-dir>:/home/app --net="host" -e COUCHBASE_USER=admin -e COUCHBASE_PASS=password -e COUCHBASE_DATA=/home/app -d aminjam/couchbase cluster-init

#### Running [any cli command](http://docs.couchbase.com/admin/admin/cli-intro.html)
  - `couchbase-cli` example

        docker run --rm aminjam/couchbase couchbase-cli server-info -c 172.20.21.10:8091 -u admin -p password

  - `cbdocloader` example for loading `beer-sample.zip` into couchbase

        docker run --rm aminjam/couchbase cbdocloader -n 172.20.21.10:8091 -u admin -p password -b beer-sample /opt/couchbase/samples/beer-sample.zip
