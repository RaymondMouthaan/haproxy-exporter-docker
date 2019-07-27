# haproxy-exporter-docker

[![Build Status](https://travis-ci.org/RaymondMouthaan/haproxy-exporter-docker.svg?branch=master)](https://travis-ci.org/RaymondMouthaan/haproxy-exporter-docker)
[![This image on DockerHub](https://img.shields.io/docker/pulls/raymondmm/haproxy-exporter.svg)](https://hub.docker.com/r/raymondmm/haproxy-exporter/)

This project builds a docker image and adds qemu-arm-static and uses manifest-tool to push manifest list to docker hub.

## Architectures
Currently supported architectures:
- **linux-arm32v6**
- **linux-arm64v8**
- **linux-amd64**

## Usage
### Docker Service
```
docker \
  service create \
  -p 9101:9101 \
  --name haproxy-exporter \
  raymondmm/haproxy-exporter:latest \
  --haproxy.scrape-uri="http://<username>:<password>@haproxy.example.com/haproxy?stats;csv"
```  
### Docker Stack
```
  haproxy-exporter:
    image: raymondmm/haproxy-exporter
    command:
      - '--haproxy.scrape-uri=http://haproxy.indonesia/admin?stats;csv'
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /etc/timezone:/etc/TZ:ro
    ports:
      - 9101:9101
    networks:
      - indonesia-net
    deploy:
      restart_policy:
        condition: on-failure
```

For more details check the official documentation at [Prometheus HAProxy-Exporter](https://github.com/prometheus/haproxy_exporter).
