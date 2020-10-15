FROM alpine:latest

MAINTAINER gdrake <gdrake@student.42.fr>

EXPOSE 3306

VOLUME /var/lib/mysql

# Copying configs and scripts
COPY srcs /srcs

# Installing mysql and utils
RUN apk update && apk upgrade
RUN apk add openrc mysql mysql-client vim

# Set configs and run services
ENTRYPOINT ["sh", "/srcs/init_script.sh"]
