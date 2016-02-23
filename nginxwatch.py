#!/usr/bin/python

import time

def CheckLine(line):
#    if "wp-admin" in line:
#        print "(Bad) : ", line.split(" ")[0]
#    else:
#        print "(Good) : ", line.split(" ")[0]
#    return
    if "Failed password for:" in line:
        print line
    return

file = "/var/log/auth.log"


with open(file) as f:
    while True:
        line = f.readline()
        if line:
            CheckLine(line)

