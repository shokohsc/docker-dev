#!/bin/bash

if [[ $1 = 'symfony' ]]
then
    echo '#### ====>  starting php stack containers <==== ####' && \
    docker-compose -f docker-compose.php.yml up -d --remove-orphans

elif [[ $1 = 'node' ]]
then
    echo '#### ====>  starting js stack containers <==== ####' && \
    docker-compose -f docker-compose.js.yml up -d --remove-orphans

elif [[ $1 = 'flask' ]]
then
    echo '#### ====>  starting python stack containers <==== ####' && \
    docker-compose -f docker-compose.python.yml up -d --remove-orphans

elif [[ $1 = 'pull' ]]
then
    echo '#### ====>  pulling container images <==== ####' && \
    docker-compose -f docker-compose.php.yml pull && \
    docker-compose -f docker-compose.js.yml pull && \
    docker-compose -f docker-compose.python.yml pull

elif [[ $1 = 'build' && $2 = 'symfony' ]]
then
    echo '#### ====>  building container images <==== ####' && \
    docker-compose -f docker-compose.php.yml build

elif [[ $1 = 'build' && $2 = 'node' ]]
then
    echo '#### ====>  building container images <==== ####' && \
    docker-compose -f docker-compose.js.yml build

elif [[ $1 = 'build' && $2 = 'flask' ]]
then
    echo '#### ====>  building container images <==== ####' && \
    docker-compose -f docker-compose.python.yml build

elif [[ $1 = 'rm' ]]
then
    echo '#### ====>  removing containers <==== ####' && \
    docker-compose -f docker-compose.php.yml rm -sfv && \
    docker-compose -f docker-compose.js.yml rm -sfv && \
    docker-compose -f docker-compose.python.yml rm -sfv && \
    docker network prune -f && \
    docker volume prune -f

elif [[ $1 = 'stop' ]]
then
    echo '#### ====>  stopping containers <==== ####' && \
    docker-compose -f docker-compose.php.yml stop && \
    docker-compose -f docker-compose.js.yml stop && \
    docker-compose -f docker-compose.python.yml stop

else
    echo "How to use ?
    ./stack.sh symfony
    ./stack.sh node
    ./stack.sh flask
    ./stack.sh pull
    ./stack.sh build symfony|node|flask
    ./stack.sh stop
    ./stack.sh rm"
fi
