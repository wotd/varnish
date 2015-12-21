# Varnish Lab

Vagrant machines with basic Varnish 4.0 installation.

## Servers list

webservers:
  - web1
  - web2

varnish:
  - varnish

## How to use:

> vagrant up

to bring up all three machines (Varnish and two webservers)

> vagrant ssh varnish

This is simple varnish 4.0 installation. After servers deployment, open web broweser and go to http://127.0.0.1:8080
