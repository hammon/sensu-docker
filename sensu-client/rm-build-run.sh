#!/bin/bash

docker rm -f sensu-client

time docker build --no-cache=true -t sensu-client .

docker run -d --hostname sensu-client --name sensu-client --link sensu-server:sensu-server --link sensu-redis:sensu-redis --link sensu-rabbitmq:sensu-rabbitmq sensu-client

docker ps

docker logs sensu-client
