#!/bin/sh

# Nginx conf setting
rm -rf /etc/nginx/conf.d/default.conf
cp /srcs/nginx.conf /etc/nginx/conf.d/default.conf

cp /srcs/supervisord.conf /etc/supervisord.conf

# Setting rights to www/ dir
chown -R root:root /var/www/*

find /var/www/ -type d -exec chmod 755 {} \;
find /var/www/ -type f -exec chmod 644 {} \;
