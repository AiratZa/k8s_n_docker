#!/bin/sh

# Getting phpMyAdmin, unzip, moving and setting config
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.zip 
unzip phpMyAdmin-5.0.2-all-languages.zip && rm -rf phpMyAdmin-5.0.2-all-languages.zip
mv phpMyAdmin-5.0.2-all-languages phpmyadmin && rm -rf phpmyadmin/config.sample.inc.php
mv /srcs/config.inc.php phpmyadmin/ && mv phpmyadmin /var/www/ && rm -rf /var/www/html