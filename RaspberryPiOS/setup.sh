#!/bin/bash -e
# Execute this script as superuser

##########################
# Customise the hostname #
##########################
read -p "Hostname: " hostname
hostnamectl set-hostname "$hostname" --static

#########################################
# Update system and enable ansible-pull #
#########################################
apt-get update
apt-get -yy dist-upgrade
apt-get -yy install ansible git
apt-get -yy autoremove --purge
apt-get -yy autoclean

################################################
# Install docker and grant default user access #
################################################
docker --version &> /dev/null || curl -sSL https://get.docker.com | bash
adduser `awk -v uid=1000 -F":" '{ if($3==uid){print $1} }' /etc/passwd` docker

##########################
# Install docker-compose #
##########################
apt-get -yy install docker-compose
