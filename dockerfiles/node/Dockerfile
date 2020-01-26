FROM shokohsc/alpine-s6

ENV WORKDIR "/app"

# install packages
RUN \
 echo "**** install build packages ****" && \
 apk update && \
 apk add --no-cache \
	git \
	libressl \
	logrotate \
	openssl \
    npm \
    nodejs \
    yarn && \
 echo "**** fix logrotate ****" && \
 sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf

# add local files
ADD root/ /

# ports and volumes
EXPOSE 3000
VOLUME /app

WORKDIR ${WORKDIR}
