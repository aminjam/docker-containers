## Couchbase Sync Gateway Dockerfile


This repository contains **Dockerfile** of [sync_gateway](https://github.com/couchbase/sync_gateway) for [Docker](https://www.docker.com/)'s [automated build](https://github.com/aminjam/docker-containers/tree/couchbase-sync-gateway) published to the public [Docker Hub Registry](https://registry.hub.docker.com/u/aminjam/couchbase-sync-gateway/).

### Base Docker Image & Size

* `latest` tag ~`190MB` from [debian:latest](https://registry.hub.docker.com/_/debian/)

### Usage `docker run`
    -v <path-for-config.json>:/config.json -d aminjam/couchbase-sync-gateway /config.json

[Documentation for config option](http://developer.couchbase.com/mobile/develop/guides/sync-gateway/index.html) and Sample`config.json`:

```
{
  "interface": ":4984",
  "adminInterface": ":4985",
  "log": ["CRUD+", "REST+", "Changes+", "Attach+"],
  "databases": {
    "myinfo": {
      "server": "http://172.20.21.11:8091",
      "bucket": "sync_gateway",
      "users": {
        "GUEST": {
          "disabled": false,
          "admin_channels": ["*"]
        }
      }
    }
  }
}
```
