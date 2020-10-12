FROM alpine:latest
RUN apk add vim openrc mysql mysql-client

COPY /my.cnf ./etc/mysql/
COPY /start.sh /wordpress.sql ./

VOLUME	/var/lib/mysql

EXPOSE 3306

ENTRYPOINT ./start.sh