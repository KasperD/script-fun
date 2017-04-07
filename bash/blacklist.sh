#!/bin/bash

# FileName: blacklist.sh
# File By: Donald R. Kasper <donald.kasper@gmail.com>
# Purpose: Add known problem regions to a blacklist drop
#          role.

IPT="/sbin/iptables"    # location of iptables
BL=$(<blacklist.lst)    # location of blacklist list file

# Check if script is being run as root
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi


echo "Adding Blacklisted IPs..."
$IPT -N blacklist
$IPT -I INPUT -j blacklist
$IPT -I OUTPUT -j blacklist
$IPT -I FORWARD -j blacklist

for IP in $BL
do 
    echo "Adding", $IP, "to blacklist"
    $IPT -A blacklist -s $IP -j DROP
    $IPT -A blacklist -d $IP -j DROP
done

echo "Blacklist complete.."
