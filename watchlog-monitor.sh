#!/bin/bash

cp /home/vagrant/files/watchlog /etc/sysconfig/watchlog
cp /home/vagrant/files/watchlog.sh /opt/watchlog.sh
cp /home/vagrant/files/watchlog.service /etc/systemd/system/watchlog.service
cp /home/vagrant/files/watchlog.timer /etc/systemd/system/watchlog.timer
echo "ALERT" > /var/log/watchlog.log
systemctl daemon-reload
systemctl enable --now watchlog.service
systemctl enable --now watchlog.timer
