#!/bin/bash

#echo "[{rabbit, []}]." > /etc/rabbitmq/rabbitmq.config

rabbitmq-plugins enable rabbitmq_management

update-rc.d rabbitmq-server defaults
/etc/init.d/rabbitmq-server start


rabbitmqctl add_vhost /sensu
rabbitmqctl add_user sensu secret
rabbitmqctl set_permissions -p /sensu sensu ".*" ".*" ".*"

rabbitmqctl set_user_tags sensu administrator
rabbitmqctl set_permissions -p / sensu ".*" ".*" ".*"


while true; do sleep 1000; done
