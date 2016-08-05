#!/bin/bash

echo '192.168.57.151 node00
192.168.57.150 node01
192.168.57.158 node02
192.168.57.159 node-mon
192.168.57.161 node-adm' >> /etc/hosts

cat /etc/hosts