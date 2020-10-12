FROM alpine:latest

MAINTAINER gdrake <gdrake@student.42.fr>

EXPOSE 22 80 443

# Copying configs and scripts
COPY srcs /srcs

# Installing nginx and utils
RUN apk update && apk upgrade
RUN apk add openrc openssl openssh nginx vim bash sudo supervisor

# Set configuration files
RUN /srcs/init_script.sh

# Run services
ENTRYPOINT ["bash", "/srcs/run_supervisor.sh"]