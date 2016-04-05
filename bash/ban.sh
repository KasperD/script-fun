#!/bin/bash

if [ $UID -ne 0 ]; then
    echo "Must be root"
    exit 1
fi

echo -n "IP Address: "
read ipaddr
/sbin/iptables -A assholes -s $ipaddr -j DROP
/sbin/iptables -A assholes -d $ipaddr -j DROP
echo "added ip address"
   
