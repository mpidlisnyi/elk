# ELK Demo

It is simple demo of ELK stack with additional applications

## Required commands
```
sudo sysctl -w vm.max_map_count=262144
docker-compose up -d
./init_dockerbeat_template.sh
./init_grafana.sh
./init_elasticsearch.sh
```

## UI
* [Kibana](http://localhost:5601/)
* [Grafana](http://localhost:3000/)
