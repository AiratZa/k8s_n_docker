FROM alpine:latest

MAINTAINER gdrake <gdrake@student.42.fr>

EXPOSE 21 2121

# Copying configs and scripts
COPY srcs /srcs

#installing nginx and utils
RUN apk add openssl vsftpd bash

# Set configuration files
RUN /srcs/init_script.sh

# Run services
ENTRYPOINT ["vsftpd", "/etc/vsftpd/vsftpd.conf"]