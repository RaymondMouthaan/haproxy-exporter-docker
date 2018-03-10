# haproxy-exporter-docker

## Docker Service
```
docker \
  service create \
  -p 9101:9101 \
  --name haproxy-exporter \
  raymondmm/haproxy-exporter:latest \
  --haproxy.scrape-uri="http://<username>:<password>@haproxy.example.com/haproxy?stats;csv"
```  
## Docker Stack
```
...
haproxy-exporter:
    image: raymondmm/haproxy-exporter
    command:
      - '--haproxy.scrape-uri=http://<username>:<password>@haproxy.example.com/haproxy?stats;csv'
    ports:
      - 9101:9101
    networks:
      - monitor-net

    deploy:
      restart_policy:
        condition: on-failure
...
```
