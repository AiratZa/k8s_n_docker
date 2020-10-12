#!/bin/bash

# Creating and changing rights for ssh user
adduser -D admin && echo 'admin:admin' | chpasswd
addgroup admin wheel
echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel
/usr/bin/ssh-keygen -A

# Generaing new certificate and new key
openssl req -x509 -nodes -days 365 -newkey\
        rsa:2048 -keyout nginx_main.key \
        -out nginx_main.crt \
        -subj "/C=RF/ST=RT/L=Kazan/O=21_SCHOOL/OU=Erehwon/CN=gdrake"

mkdir /etc/nginx/ssl && mv nginx_main.key nginx_main.crt /etc/nginx/ssl


# Nginx conf setting (default: autoindex on)
rm -rf /etc/nginx/conf.d/default.conf
cp /srcs/nginx.conf /etc/nginx/conf.d/default.conf
cp /srcs/index.html /var/www/

cp /srcs/supervisord.conf /etc/supervisord.conf

# Setting rights to www/ dir
chown -R root:root /var/www/*

find /var/www/ -type d -exec chmod 755 {} \;
find /var/www/ -type f -exec chmod 644 {} \;

# Deleting and config files
mkdir /run/nginx /var/run/sshd
