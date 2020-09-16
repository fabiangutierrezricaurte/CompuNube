#!/bin/bash
echo "--------------inicio-----haproxyy------configurado----------"
echo "lxc init ubuntu:20.04 balancerhaproxyyy --target haproxyy"
sudo snap install lxd --channel=4.0/stable
sleep 5
echo "newgrp lxd"
newgrp lxd 
sleep 5
echo "lxd init --auto"
lxd init --auto
sleep 5
echo "lxc launch ubuntu:20.04 web1"
lxc launch ubuntu:20.04 balancerhaproxyyy
sleep 5
echo "lxc exec balancerhaproxyyy -- apt-get update -y"
lxc exec balancerhaproxyyy -- apt-get update -y 
sleep 5
echo "lxc exec balancerhaproxyyy -- apt-get upgrade -y"
lxc exec balancerhaproxyyy -- apt-get upgrade -y
sleep 5
echo "lxc exec balancerhaproxyyy -- apt install haproxy -y"
lxc exec balancerhaproxyyy -- apt install haproxy -y
sleep 5
echo "lxc exec balancerhaproxyyy -- systemctl enable haproxy"
lxc exec balancerhaproxyyy -- systemctl enable haproxy
sleep 5
echo "lxc file push /vagrant/haproxy.cfg balancerhaproxyyy/etc/haproxy/haproxy.cfg"
lxc file push /vagrant/haproxy.cfg balancerhaproxyyy/etc/haproxy/haproxy.cfg
sleep 5
echo "lxc file push /vagrant/index1.html balancerhaproxyyy/etc/haproxy/errors/503.http"
lxc file push /vagrant/indexh.http balancerhaproxyyy/etc/haproxy/errors/503.http
sleep 5
echo "lxc exec balancerhaproxyyy -- systemctl restart haproxy"
lxc exec balancerhaproxyyy -- systemctl restart haproxy
sleep 5
echo " lxc config device add balancerhaproxyyy http proxy listen=tcp:0.0.0.0:80 connect=tcp:127.0.0.1:80"
lxc config device add balancerhaproxyyy http proxy listen=tcp:192.162.100.22:80 connect=tcp:127.0.0.1:80
echo "--------------fin-----haproxyy------configurado----------"