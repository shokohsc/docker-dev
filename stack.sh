#!/bin/bash

if [[ -z $1 ]]
then
    echo '#### ====>  starting basic stack containers: php-fpm nginx varnish elasticsearch logstash kibana sqlite <==== ####' && \
    docker-compose up -d --remove-orphans php-fpm nginx varnish elasticsearch logstash kibana sqlite

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

elif [[ $1 = 'sf' ]]
then
    echo '#### ====>  symfony project rights <==== ####' && \
    docker exec php-fpm chown -R www-data:www-data /var/www/symfony

elif [[ $1 = 'php' ]]
then
    echo '#### ====>  enter php-fpm container as root using bash <==== ####' && \
    docker exec -ti php-fpm bash

elif [[ $1 = 'nginx' ]]
then
    echo '#### ====>  enter nginx container as root using bash <==== ####' && \
    docker exec -ti nginx bash

else
    echo "How to use ?
    ./stack.sh
    ./stack.sh pull
    ./stack.sh build
    ./stack.sh stop
    ./stack.sh rm
    ./stack.sh sf
    ./stack.sh nginx
    ./stack.sh php"
fi
