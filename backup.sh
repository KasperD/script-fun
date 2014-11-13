#/bin/bash

# FileName: backup.sh
# Author: Donald R. Kasper
# Purpose: Script for archiving & restoring personal servers

UGIDLIMIT=500
SETTEMP="/tmp/duckie"

if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

if [ ! -d $SETTEMP ]; then
    mkdir -p $SETTEMP
fi

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

            echo "...backing up current files"
            mkdir $SETTEMP/backup_files
            cp /etc/passwd /etc/shadow /etc/group /etc/gshadow $SETTEMP/backup_files
            
            echo "...Updating password & groups"
            cat $SETTEMP/passwd.migrate >> /etc/passwd
            cat $SETTEMP/group.migrate >> /etc/group
            cat $SETTEMP/shadow.migrate >> /etc/shadow
            cp $SETTEMP/gshadow.migrate /etc/gshadow
            
            echo "...restoring directories"
            cd /
            tar -zxvf $SETTEMP/home.tar.gz
            cd /
            tar -zxvf $SETTEMP/mail.tar.gz
            cd /
            tar -zxvf $SETTEMP/apache.tar.gz
            ;;
        *)
            echo "Unknown command"
            exit 1
            ;;
    esac
fi
