#!/bin/bash

yum update
yum install sudo -y
yum install git -y
yum install curl -y
yum install httpd
service httpd start
yum install mysql-server -y
service mysqld start
/usr/bin/mysql_secure_installation
yum install php php-mysql -y
service httpd restart
