#!/bin/bash

MYIP=`ip address list | grep "inet" | grep -v "inet6" | awk '{print $2}' | grep -v "127.0.0.1"`
MYROUTE=`ip route list | grep "default" | awk '{print $3}'`
MYUSER=$USER #This is set in bash already
MYUID=$UID #This is set in bash already

echo "My user name is:" $MYUSER
echo "My user id is:" $MYUID
echo "My IP address(s) is:" $MYIP
echo "My default route is:" $MYROUTE
