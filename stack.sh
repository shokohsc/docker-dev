#!/bin/bash

if [[ -z $1 ]]
then
    echo '#### ====>  starting basic stack containers: php-fpm nginx varnish elasticsearch logstash kibana <==== ####' && \
    docker-compose up -d --remove-orphans php-fpm nginx varnish elasticsearch logstash kibana

elif [[ $1 = 'pull' ]]
then
    echo '#### ====>  pulling container images <==== ####' && \
    docker-compose pull

elif [[ $1 = 'build' ]]
then
    echo '#### ====>  building container images <==== ####' && \
    docker-compose build

elif [[ $1 = 'rm' ]]
then
    echo '#### ====>  removing containers <==== ####' && \
    docker-compose rm -sfv && \
    docker network prune -f

elif [[ $1 = 'stop' ]]
then
    echo '#### ====>  stopping containers <==== ####' && \
    docker-compose stop

else
    echo "How to use ?
    ./stack.sh
    ./stack.sh pull
    ./stack.sh build
    ./stack.sh stop
    ./stack.sh rm"
fi
