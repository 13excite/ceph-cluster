#!/bin/bash

#####install and config ntpd
yum install ntp ntpdate

cat > /etc/ntp.conf << "EOF"
server ntp2.stratum2.ru
server ntp3.stratum2.ru
server ntp4.stratum2.ru
server ntp5.stratum2.ru

disable monitor
restrict default kod nomodify notrap nopeer noquery
restrict -6 default kod nomodify notrap nopeer noquery
restrict 127.0.0.1
restrict -6 ::1
EOF

ntpdate ntp2.stratum2.ru
systemctl enable ntpd.service
systemctl start ntpd.service

########## add ceph user
useradd -d /home/ceph -m ceph
passwd ceph

echo "PS1='\[\e[0;31m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\]'" >> /home/ceph/.bashrc

#ensure sudo privileges
echo "ceph ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ceph
chmod 0440 /etc/sudoers.d/ceph
