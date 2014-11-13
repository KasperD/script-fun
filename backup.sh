#!/bin/bash

# FileName: backup.sh
# Author: Donald R. Kasper
# Purpose: Script for archiving & restoring personal servers

UGIDLIMIT=500
SETTEMP="/tmp"

echo "Do not run"
exit

if [ ! $1 ]; then
    echo "Please provide either a 'backup' or 'restore' argument "
fi

if [ $1 ]; then
    case "$1" in
        'backup')
            echo "Attempting to backup the system..."
            export UGIDLIMIT=$UGIDLIMIT
            echo "...Collecting User Information"
            awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT && ($3!=65534)' /etc/passwd > $SETTEMP/passwd.migrate
            awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT && ($3!=65534)' /etc/group > $SETTEMP/group.migrate
            awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534) {print $1}' /etc/passwd | tee - | egrep -f - /etc/shadow > $SETTEMP/shadow.migrate
            cp /etc/gshadow $SETTEMP/gshadow.migrate
            echo "... Compressing directories"
            tar -zcvpf $SETTEMP/home.tar.gz /home
            tar -zcvpf $SETTEMP/mail.tar.gz /var/spool/mail
            tar -zcvpf $SETTEMP/apache.tar.gz /etc/apache2
            ;;
        'restore')
            echo "Attempting to restore the system..."
            ;;
        *)
            echo "Unknown command"
            ;;
    esac
    echo "Out of case statment"
fi

# tar -zcvpf /root/move/prod.tar.gz /prod/
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

