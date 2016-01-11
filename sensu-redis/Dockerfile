FROM ubuntu
MAINTAINER Michael Alexandrov michael.alexandrov@gmail.com

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && apt-get install -y redis-server


EXPOSE      6379

ENTRYPOINT  ["/usr/bin/redis-server"]
