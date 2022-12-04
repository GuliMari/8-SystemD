#!/bin/bash

yum install epel-release -y && yum install spawn-fcgi php php-cli mod_fcgid httpd -y
cp /vagrant/files/spawn-fcgi /etc/sysconfig/
cp /vagrant/files/spawn-fcgi.service /etc/systemd/system/
systemctl enable --now spawn-fcgi
