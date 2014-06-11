#!/bin/bash

export UGIDLIMIT=500
awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534)' /etc/passwd > /root/move/passwd.mig
awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534)' /etc/group > /root/move/group.mig
awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534) {print $1}' /etc/passwd | tee - |egrep -f - /etc/shadow > /root/move/shadow.mig
cp /etc/gshadow /root/move/gshadow.mig
tar -zcvpf /root/move/home.tar.gz /home
tar -zcvpf /root/move/mail.tar.gz /var/spool/mail
tar -zcvpf /root/move/apache.tar.gz /etc/apache2/
tar -zcvpf /root/move/prod.tar.gz /prod/
# scp -r /root/move/* user@new.linuxserver.com:/path/to/location

# -- new system

# mkdir /root/newsusers.bak
# cp /etc/passwd /etc/shadow /etc/group /etc/gshadow /root/newsusers.bak
# cd /path/to/location
# cat passwd.mig >> /etc/passwd
# cat group.mig >> /etc/group
# cat shadow.mig >> /etc/shadow
# /bin/cp gshadow.mig /etc/gshadow

# cd /
# tar -zxvf /path/to/location/home.tar.gz

# cd /
# tar -zxvf /path/to/location/mail.tar.gz

# reboot

