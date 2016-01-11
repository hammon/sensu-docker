#!/bin/bash

docker rm -f sensu-server

docker build --no-cache=true -t sensu-server .

docker run -d -p 3000:3000 --hostname sensu-server --name sensu-server --link sensu-redis:sensu-redis --link sensu-rabbitmq:sensu-rabbitmq sensu-server

docker ps

docker logs sensu-server
