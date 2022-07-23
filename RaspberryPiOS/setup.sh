#!/bin/bash -e
# Execute this script as superuser
read -p "Hostname: " hostname
hostnamectl set-hostname "$hostname" --static
apt-get update
apt-get -yy dist-upgrade
apt-get -yy install ansible-pull git
apt-get -yy autoremove --purge
apt-get -yy autoclean
docker &> /dev/null || curl -sSL https://get.docker.com | bash
