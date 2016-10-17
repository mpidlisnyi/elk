#!/bin/sh
docker exec -it elk_dockerbeat_1 curl -XPUT 'http://elasticsearch:9200/_template/dockerbeat' -d@/etc/dockerbeat/dockerbeat.template.json
