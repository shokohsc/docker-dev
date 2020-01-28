ARG FROM_TAG='latest'
FROM shokohsc/alpine-s6:${FROM_TAG:-latest}

ENV WORKDIR "/var/www/symfony"

# install packages
RUN \
  echo "**** install build packages ****" && \
  apk update && \
  apk add --no-cache \
	git \
	logrotate \
	php7 \
    php7-bz2 \
	php7-ctype \
	php7-curl \
	php7-dom \
	php7-exif \
	php7-gd \
	php7-iconv \
	php7-mcrypt \
	php7-memcached \
	php7-mysqli \
	php7-mysqlnd \
	php7-pdo_mysql \
	php7-pdo_sqlite \
	php7-phar \
	php7-soap \
	php7-sockets \
	php7-sqlite3 \
	php7-tokenizer \
	php7-zip \
	php7-fileinfo \
	php7-fpm \
	php7-json \
	php7-mbstring \
	php7-openssl \
	php7-session \
    php7-opcache \
    php7-apcu \
    php7-intl \
    php7-simplexml \
	php7-zlib \
    yarn \
    nodejs && \
  echo "**** fix logrotate ****" && \
  sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf

 # Rar Extension
RUN apk add --no-cache \
    php7-pear \
    php7-dev \
    gcc \
    g++ \
    musl-dev \
    make \
    unrar && \
    pecl install rar && \
    touch /etc/php7/conf.d/rar.ini && \
    echo 'extension=rar.so' >> /etc/php7/conf.d/rar.ini && \
    chown app:app /etc/php7/conf.d/rar.ini && \
    chmod 664 /etc/php7/conf.d/rar.ini

# dev
RUN \
  echo "**** install dev build packages ****" && \
  apk add --no-cache \
    php7-xdebug \
    php-pcntl \
    php-posix && \
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
   composer --version && \
   composer global require hirak/prestissimo

# add local files
ADD root/ /

# ports and volumes
EXPOSE 9000
VOLUME /var/www/symfony

WORKDIR ${WORKDIR}
