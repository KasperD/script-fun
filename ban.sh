#!/bin/bash

echo -n "IP Address: "
read ipaddr
/sbin/iptables -A assholes -s $ipaddr -j DROP
/sbin/iptables -A assholes -d $ipaddr -j DROP
echo "added ip address"
