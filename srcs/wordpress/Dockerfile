FROM alpine:latest

MAINTAINER gdrake <gdrake@student.42.fr>

EXPOSE 5050

# Copying configs for services
COPY srcs/nginx.conf /
COPY srcs/supervisord.conf /
COPY srcs/wp-config.php /

# Installing nginx and utils
RUN apk update && apk upgrade
RUN apk add openrc nginx vim supervisor curl

RUN mkdir -p /run/nginx && mkdir -p /run/php

# Installing php and its utils, libraries
RUN apk add php7 php7-fpm php7-mysqli php7-json php7-session php7-fpm php7-phar php7-iconv php7-mbstring

# Runlevel of php-fpm -> when the system is launching
RUN rc-update add php-fpm7 default

# Getting the last version of WordPress, unzip, moving and setting config
RUN curl -O https://wordpress.org/latest.tar.gz &&\
    tar -xzf latest.tar.gz && rm -rf latest.tar.gz &&\
    mv /wp-config.php /wordpress &&\
    mv /wordpress /var/www/


# Nginx conf setting
RUN rm -rf /etc/nginx/conf.d/default.conf &&\
    mv /nginx.conf /etc/nginx/conf.d/default.conf
    
# Setting rights to www/ dir
RUN chmod -R 777 /var/www/

RUN mv /supervisord.conf /etc/supervisord.conf &&\
    sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php7/php-fpm.conf

# Run services
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
