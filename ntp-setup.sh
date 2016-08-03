#!/bin/bash

yum install ntp ntpdate
ntpdate ntp2.stratum2.ru
systemctl enable ntpd.service
systemctl start ntpd.service

cat > /etc/ntp.conf < "EOF"
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