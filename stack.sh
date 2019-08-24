#!/bin/bash

if [[ $1 = 'symfony' ]]
then
    echo '#### ====>  starting basic stack containers: php-fpm <==== ####' && \
    docker-compose -f docker-compose.php.yml up -d --remove-orphans php-fpm

elif [[ $1 = 'flask' ]]
then
    echo '#### ====>  starting basic stack containers: python <==== ####' && \
    docker-compose -f docker-compose.python.yml up -d --remove-orphans python

elif [[ $1 = 'pull' ]]
then
    echo '#### ====>  pulling container images <==== ####' && \
    docker-compose -f docker-compose.php.yml pull && \
    docker-compose -f docker-compose.python.yml pull

elif [[ $1 = 'build' && $2 = 'symfony' ]]
then
    echo '#### ====>  building container images <==== ####' && \
    docker-compose -f docker-compose.php.yml build

elif [[ $1 = 'build' && $2 = 'flask' ]]
then
    echo '#### ====>  building container images <==== ####' && \
    docker-compose -f docker-compose.python.yml build

elif [[ $1 = 'rm' ]]
then
    echo '#### ====>  removing containers <==== ####' && \
    docker-compose -f docker-compose.php.yml rm -sfv && \
    docker-compose -f docker-compose.python.yml rm -sfv && \
    docker network prune -f && \
    docker volume prune -f

elif [[ $1 = 'stop' ]]
then
    echo '#### ====>  stopping containers <==== ####' && \
    docker-compose -f docker-compose.php.yml stop && \
    docker-compose -f docker-compose.python.yml stop

else
    echo "How to use ?
    ./stack.sh symfony
    ./stack.sh flask
    ./stack.sh pull
    ./stack.sh build symfony|flask
    ./stack.sh stop
    ./stack.sh rm"
fi
