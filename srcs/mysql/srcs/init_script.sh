#!/bin/sh

# Set mysql config and rights for it
cp /srcs/my.cnf /etc/mysql/
chmod 600 /etc/mysql/my.cnf

openrc default
/etc/init.d/mariadb setup
rc-service mariadb start

mysql < /srcs/db_init.sql
mysql wordpress < /srcs/wordpress.sql

rc-service mariadb stop

# Adds some safety features such as restarting the server when an error occurs and logging runtime information to an error log
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'