FROM shokohsc/alpine-s6:3.9

ENV WORKDIR "/var/www/app"

# install packages
RUN \
 echo "**** install build packages ****" && \
 apk update && \
 apk add --no-cache \
	git \
	libressl2.7-libssl \
	logrotate \
	openssl \
    python3 \
    inotify-tools \
    nodejs \
    yarn && \
 echo "**** fix logrotate ****" && \
 sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf

# update python package manager
RUN \
  pip3 install --upgrade pip

# add local files
ADD root/ /

# ports and volumes
VOLUME /var/www/app

WORKDIR ${WORKDIR}
