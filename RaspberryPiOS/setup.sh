#!/bin/bash -e
# Execute this script as superuser

######################
# Update base system #
######################
apt-get update
apt-get -yy dist-upgrade
apt-get -yy autoremove --purge
apt-get -yy autoclean

################################################
# Install docker and grant default user access #
################################################
docker --version &> /dev/null || curl -sSL https://get.docker.com | bash
adduser `awk -v uid=1000 -F":" '{ if($3==uid){print $1} }' /etc/passwd` docker

########################
# Hand over to Ansible #
########################
ansible-pull -U https://github.com/austozi/selfhosted RaspberryPiOS/$(hostname).yml
