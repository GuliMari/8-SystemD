#!/bin/bash

cp /home/vagrant/files/httpd@.service /etc/systemd/system/
echo "OPTIONS=-f conf/first.conf" > /etc/sysconfig/httpd-first
echo "OPTIONS=-f conf/second.conf" > /etc/sysconfig/httpd-second
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/first.conf 
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/second.conf
sed -i 's@Listen 80@Listen 8080\nPidFile /var/run/httpd-second.pid@' /etc/httpd/conf/second.conf 
systemctl enable --now httpd@first
systemctl enable --now httpd@second
