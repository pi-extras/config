#!/bin/bash
docker rm -f caddy
docker run --name caddy -d -p 80:80 \
    -v /root/caddy:/etc/caddy \
    -v /root/pi-extras:/root/pi-extras \
    caddy:alpine
