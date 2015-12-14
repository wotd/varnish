#!/bin/bash
apt-get update
locale-gen pl_PL pl_PL.UTF-8
dpkg-reconfigure locales

echo "192.168.50.40 web_1" >> /etc/hosts
echo "192.168.50.41 web_2" >> /etc/hosts
echo "192.168.50.2 varnish" >> /etc/hosts
