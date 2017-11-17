#!/bin/bash

# Check for root access
if [ $UID -ne 0 ]; then
    echo "Must be root"
    exit 1
fi

PIPFILE="./requirements.txt"
APTFILE="./aptreq.txt"

OracleInstall() {
    add-apt-repository ppa:webupd8team/java
    apt-get install oracle-java9-installer
}

AptUpgrade() {
    echo "apt-get update & upgrade"
    apt-get update
    apt-get upgrade -y
    apt-get autoremove -y
    apt-get clean
}

PipUpgrade() {
    pip install -r $PIPFILE
}

AptUpgrade
PipUpgrade