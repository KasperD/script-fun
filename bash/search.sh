#!/bin/bash
txtlocation='~/masterpass/pwned-passwords-2.0.txt'

echo "Search Password usage against know pwnlist"
read -sp "Enter Password: " pwninput
echo
search=`echo $pwninput | sha1sum | awk '{print $1}'`
echo "Starting Search..."
start=`date +%s`

while read -ru 3 LINE; do
    LINESTRIP=`echo $LINE | awk -F: '{print $1}'`
    if [ $LINESTRIP ==  $search ]; then
        echo "Password has been found"
        break;
    fi
done 3< $txtlocation

end=`date +%s`
runtime=$((end-start))

echo "Job took $runtime seconds"
