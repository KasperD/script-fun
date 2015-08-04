#!/bin/bash

apt-get update
apt-get install -y apach2
apt-get install -y mysql-server libapache2-mod-auth-mysql php5-mysql
mysql_install_db
/usr/bin/mysql_secure_installation
apt-get install -y php5 libapache2-mod-php5 php5-mcrypt php5-curl
service apache2 restart
apt-get clean
apt-get autoremove -y
