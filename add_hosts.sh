#!/bin/bash

echo '192.168.57.151 ceph-node01
192.168.57.150 ceph-node02
192.168.57.158 ceph-node03
192.168.57.159 ceph-mon
192.168.57.161 ceph-adm' >> /etc/hosts

cat /etc/hosts