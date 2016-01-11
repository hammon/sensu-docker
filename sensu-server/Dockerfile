FROM ubuntu
MAINTAINER Michael Alexandrov michael.alexandrov@gmail.com

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y wget && \
    wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | apt-key add - && \
    echo "deb http://repos.sensuapp.org/apt sensu main" > /etc/apt/sources.list.d/sensu.list && \
    apt-get update && \
    apt-get install -y sensu && \
    apt-get install -y uchiwa && \
    mkdir -p /etc/sensu/conf.d

COPY conf/config.json /etc/sensu/config.json
COPY conf/uchiwa.json /etc/sensu/uchiwa.json
COPY conf/client.json /etc/sensu/conf.d/client.json
COPY conf/checks.json /etc/sensu/conf.d/checks.json
COPY conf/default_handler.json /etc/sensu/conf.d/default_handler.json

COPY check_sanity /etc/sensu/plugins/check_sanity


RUN chmod +x /etc/sensu/plugins/check_sanity && \
    update-rc.d sensu-server defaults && \
    update-rc.d sensu-client defaults && \
    update-rc.d sensu-api defaults && \
    update-rc.d uchiwa defaults

CMD /etc/init.d/sensu-server start && \
    /etc/init.d/sensu-client start && \
    /etc/init.d/sensu-api start && \
    /etc/init.d/uchiwa start && \
    echo "sensu-server started!" && \
    while true; do sleep 1000; done

EXPOSE 3000 4567 5671 15672
