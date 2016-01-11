#!/bin/bash

docker rm -f sensu-rabbitmq

docker build --no-cache=true -t sensu-rabbitmq .

docker run -d -p 15672:15672 --hostname  sensu-rabbitmq --name  sensu-rabbitmq  sensu-rabbitmq

docker ps

docker logs sensu-rabbitmq
