FROM ubuntu
#rabbitmq
MAINTAINER Michael Alexandrov michael.alexandrov@gmail.com

RUN echo "deb http://www.rabbitmq.com/debian testing main" >> /etc/apt/sources.list && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y wget && \
    wget https://www.rabbitmq.com/rabbitmq-signing-key-public.asc && \
    apt-key add rabbitmq-signing-key-public.asc && \
    apt-get update && apt-get install -y rabbitmq-server


COPY conf/rabbitmq.config /etc/rabbitmq/rabbitmq.config
COPY run.sh /tmp/run.sh

RUN chmod +x /tmp/run.sh

CMD /tmp/run.sh

EXPOSE "5672"
EXPOSE "15672:15672"
