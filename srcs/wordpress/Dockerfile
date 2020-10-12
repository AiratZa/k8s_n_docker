FROM alpine:latest

MAINTAINER gdrake <gdrake@student.42.fr>

EXPOSE 5050

# Copying configs and scripts
COPY srcs /srcs

# Installing nginx and utils
RUN apk update && apk upgrade
RUN apk add openrc openssl nginx vim bash supervisor curl

RUN mkdir -p /run/nginx && mkdir -p /run/php

# Installing php and its utils, libraries
RUN apk add php7 php7-fpm php7-mysqli php7-json

# Runlevel of php-fpm -> when the system is launching
RUN rc-update add php-fpm7 default

# WordPress downloading and installation
RUN /srcs/wp_installation.sh

# Nginx cofiguring
RUN /srcs/configure_server.sh

# Run services
ENTRYPOINT ["bash", "/srcs/run_supervisor.sh"]
