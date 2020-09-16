#!/bin/bash
echo "--------------inicio-----server20------configurado----------"
echo "snap install lxd --channel=4.0/stable"
sudo snap install lxd --channel=4.0/stable
sleep 5
echo "newgrp lxd"
newgrp lxd 
sleep 5
echo "lxd init --auto"
lxd init --auto
sleep 5
echo "lxc launch ubuntu:20.04 web2"
lxc launch ubuntu:20.04 web2
sleep 5
echo "lxc exec web2 -- apt-get update -y"
lxc exec web2 -- apt-get update -y 
sleep 5
echo "lxc exec web2 -- apt-get upgrade -y"
lxc exec web2 -- apt-get upgrade -y
sleep 5
echo "lxc exec web2 -- apt install apache2 -y"
lxc exec web2 -- apt install apache2 -y
sleep 5
echo "lxc exec web2 -- systemctl enable apache2"
lxc exec web2 -- systemctl enable apache2
sleep 5
echo "lxc file push /vagrant/index1.html web2/var/www/html/index.html"
lxc file push /vagrant/index1.html web2/var/www/html/index.html
sleep 5
echo "lxc exec web2 -- systemctl restart apache2"
lxc exec web2 -- systemctl restart apache2
sleep 5
echo " lxc config device add web2 myport80 proxy listen=tcp:192.162.100.10:80 connect=tcp:127.0.0.1:80"
lxc config device add web2 myport80 proxy listen=tcp:192.162.100.21:80 connect=tcp:127.0.0.1:80
echo "--------------fin-----server20------configurado----------"

echo "--------------inicio-----backupserver20------configurado----------"
echo "lxc init ubuntu:20.04 backweb2 --target server20"
lxc launch ubuntu:20.04 backweb2 
sleep 5
echo "lxc exec backweb2 -- apt-get update -y"
lxc exec backweb2 -- apt-get update -y 
sleep 5
echo "lxc exec backweb2 -- apt-get upgrade -y"
lxc exec backweb2 -- apt-get upgrade -y
sleep 5
echo "lxc exec backweb2 -- apt install apache2 -y"
lxc exec backweb2 -- apt install apache2 -y
sleep 5
echo "lxc exec backweb2 -- systemctl enable apache2"
lxc exec backweb2 -- systemctl enable apache2
sleep 5
echo "lxc file push /vagrant/indexback1.html backweb2/var/www/html/index.html"
lxc file push /vagrant/indexback1.html backweb2/var/www/html/index.html
sleep 5
echo "lxc exec backweb2 -- systemctl restart apache2"
lxc exec backweb2 -- systemctl restart apache2
sleep 5
echo " lxc config device add backweb2 myport5086 proxy listen=tcp:192.162.100.10:5086 connect=tcp:127.0.0.1:80"
lxc config device add backweb2 myport5086 proxy listen=tcp:192.162.100.21:5086 connect=tcp:127.0.0.1:80
echo "--------------fin-----backupserver20------configurado----------"