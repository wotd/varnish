#!/bin/bash
apt-get update
locale-gen pl_PL pl_PL.UTF-8
dpkg-reconfigure locales
apt-get -y upgrade
echo "192.168.50.40 web1" >> /etc/hosts
echo "192.168.50.41 web2" >> /etc/hosts
echo "192.168.50.2 varnish" >> /etc/hosts

#Varnish 3.0
#apt-get install -y varnish

#Varnish 4.0
curl https://repo.varnish-cache.org/ubuntu/GPG-key.txt | apt-key add -
echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list
apt-get update
apt-get install -y varnish httpie

rm -f /etc/default/varnish
rm -f /etc/varnish/default.vcl
ln -s /vagrant/default/varnish /etc/default/varnish
ln -s /vagrant/varnish/default.vcl /etc/varnish/default.vcl

service varnish restart
