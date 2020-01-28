ARG FROM_TAG='latest'
FROM shokohsc/alpine-s6:${FROM_TAG:-latest}

ENV WORKDIR "/var/www/app"

# install packages
RUN \
 echo "**** install build packages ****" && \
 apk update && \
 apk add --no-cache \
	git \
	logrotate \
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
