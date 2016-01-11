#!/bin/bash

docker rm -f sensu-redis

docker build --no-cache=true -t sensu-redis .

docker run -d --name sensu-redis sensu-redis
