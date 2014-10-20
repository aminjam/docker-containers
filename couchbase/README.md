## Couchbase Dockerfile


This repository contains **Dockerfile** of [Couchbase](http://www.couchbase.com/) for [Docker](https://www.docker.com/)'s [automated build](https://github.com/aminjam/docker-containers/tree/couchbase) published to the public [Docker Hub Registry](https://registry.hub.docker.com/u/aminjam/couchbase/). This container image has the size of `677 MB`.
Couchbase requires a lot of (over 100) ports to be open due the baked-in master-master replication, so running the container with `--net="host"` is recommended. It is also required to know the IP address of the first machine in the cluster via the `COUCHBASE_SERVER` env variable.
### Base Docker Image

* [debian:wheezy](https://registry.hub.docker.com/_/debian/)

### Usage `docker run`
  - First server in the cluster
```
--net="host" -e COUCHBASE_USER=admin -e COUCHBASE_PASS=password -d aminjam/couchbase cluster-init
```

  - Other servers in the cluster (assuming the first server has the IP of 172.20.21.10)
```
--net="host" -e COUCHBASE_USER=admin -e COUCHBASE_PASS=password -e COUCHBASE_SERVER=172.20.21.10 -d aminjam/couchbase rebalance
```

#### Running any couchbase-cli command
    --rm aminjam/couchbase server-info -c 172.20.21.10:8091 -u admin -p password

### TODO
- currently data persistency `-v <path-to-data>:/opt/couchbase/var/lib/couchbase/` in the host is not working.
