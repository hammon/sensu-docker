FROM ubuntu
MAINTAINER Michael Alexandrov michael.alexandrov@gmail.com

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y wget && \
    apt-get install -y --fix-missing ruby ruby-dev build-essential && \
    apt-get install -y apache2 && \
    wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | apt-key add - && \
    echo "deb http://repos.sensuapp.org/apt sensu main" > /etc/apt/sources.list.d/sensu.list && \
    apt-get update && \
    apt-get install -y sensu && \
    gem install sensu-plugin && \
    wget -O /etc/sensu/plugins/check-procs.rb https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-process-checks/master/bin/check-process.rb && \
    chmod 755 /etc/sensu/plugins/check-procs.rb && \
    mkdir -p /etc/sensu/conf.d

COPY conf/config.json /etc/sensu/config.json
COPY conf/client.json /etc/sensu/conf.d/client.json

COPY make-big-file.sh /tmp/make-big-file.sh
COPY check_sanity /etc/sensu/plugins/check_sanity

RUN chmod +x /etc/sensu/plugins/check_sanity && \
    chown -R sensu:sensu /etc/sensu


CMD /etc/init.d/sensu-client start && \
    /etc/init.d/apache2 start && \
    echo "sensu-client started!" && \
    while true; do sleep 1000; done

EXPOSE  5671 5672
