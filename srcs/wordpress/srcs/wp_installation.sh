#!/bin/sh

# Getting the last version of WP, unzip, moving and setting config
curl -O https://wordpress.org/latest.tar.gz 
tar -xzf latest.tar.gz && rm -rf latest.tar.gz
mv /srcs/wp-config.php /wordpress
mv wordpress/ /var/www/


