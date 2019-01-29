#!/bin/bash

export uid=$(id -u)
export gid=$(id -g)
export port_main=4480
export port_mysql=4406
export ip=$(ip addr show docker0 | grep inet | awk '{print $2}' | head -n 1 | awk -F "/" '{print $1}')

docker-compose run console bash