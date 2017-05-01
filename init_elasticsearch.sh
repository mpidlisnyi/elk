#!/bin/sh
# not for cluster setup
curl -XPUT 'http://localhost:9200/_all/_settings?preserve_existing=true' -d '{
  "index.number_of_replicas" : "0"
}'
