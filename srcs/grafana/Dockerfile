FROM alpine:latest

MAINTAINER gdrake <gdrake@student.42.fr>

RUN apk update && apk upgrade
RUN	apk	add supervisor wget

# Install  GNU C Library as a Alpine Linux package to run binaries linked against glibc
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub &&\
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk &&\
    apk add glibc-2.32-r0.apk

RUN wget https://dl.grafana.com/oss/release/grafana-7.2.1.linux-amd64.tar.gz &&\
    tar -zxvf grafana-7.2.1.linux-amd64.tar.gz &&\
    rm -f grafana-7.2.1.linux-amd64.tar.gz

RUN mv grafana-* /grafana &&\
    cp /grafana/conf/defaults.ini /etc/grafana.ini

COPY srcs/grafana.db		/grafana/data/

COPY srcs/supervisor.d /etc/supervisord.conf

COPY srcs/run_supervisor.d			/srcs/

RUN chmod +x /srcs/run_supervisor.d

EXPOSE 3000

ENTRYPOINT ["sh", "/srcs/run_supervisor.sh"]
