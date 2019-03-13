#!/bin/bash

# System Update
apt-get update; apt-get upgrade -y; apt-get autoremove -y; apt-get clean

# Add Apt Keys
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Remove Old docker  
apt-get remove docker docker-engine docker.io containerd runc

# Standard Install packages
apt-get install vim vim-scripts git curl wget tmux python-pip python-virtualenv tightvncserver sigil sigil-data wordgrinder openssh-server docker-ce docker-ce-cli containerd.io apt-transport-https ca-certificates gpg gnupg-agent software-properties-common -y

# PIP Software Install
pip install awscli aws-sam-cli youtube-dl

# GIT Clone Stuff
git clone https://github.com/apreche/vim ~/vim
pip install -r ~/.vim/requirements.txt
