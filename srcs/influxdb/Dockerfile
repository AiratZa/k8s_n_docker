FROM alpine:latest

MAINTAINER gdrake <gdrake@student.42.fr>

RUN apk update && apk upgrade
RUN	apk	add supervisor wget

# Install  GNU C Library as a Alpine Linux package to run binaries linked against glibc
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub &&\
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk &&\
    apk add glibc-2.32-r0.apk

# Download latest stable release of influxdb and unzip tar
RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.3-static_linux_amd64.tar.gz &&\
    tar xvfz influxdb-1.8.3-static_linux_amd64.tar.gz &&\
    rm -rf influxdb-1.8.3-static_linux_amd64.tar.gz

RUN mkdir -p /var/lib/influxdb

RUN mv /influxdb-* /etc/influxdb

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_linux_amd64.tar.gz &&\
    tar xf telegraf-1.15.3_linux_amd64.tar.gz

RUN	cp -r /telegraf-1.15.3/* /  &&\
	rm -rf /telegraf-1.15.3/ telegraf-1.15.3_linux_amd64.tar.gz \

# Generating config file https://medium.com/@dganais/configuring-the-docker-telegraf-input-plugin-1bfd0d9f11a6
RUN ./usr/bin/telegraf -sample-config --input-filter docker \
						--output-filter influxdb > /etc/telegraf/telegraf.conf 

COPY srcs/supervisor.d /etc/supervisord.conf

COPY srcs/run_supervisor.d			/srcs/

RUN chmod +x /srcs/run_supervisor.d

VOLUME /var/lib/influxdb

ENTRYPOINT ["sh", "/srcs/run_supervisor.sh"]