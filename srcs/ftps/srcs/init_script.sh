#!/bin/bash

# Changing pwd for root
echo 'root:root' | chpasswd

# Generaing new certificate and new key
openssl req -x509 -nodes -days 365 -newkey\
        rsa:2048 -keyout vsftpd.pem \
        -out vsftpd.pem \
        -subj "/C=RF/ST=RT/L=Kazan/O=21_SCHOOL/OU=Erehwon/CN=gdrake"

mkdir /etc/vsftpd/ssl/ && mv vsftpd.pem /etc/vsftpd/ssl

cp /srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
