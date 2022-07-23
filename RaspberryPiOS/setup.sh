#!/bin/bash -e
# Execute this script as superuser
apt-get update
apt-get -y dist-upgrade
apt-get -y install ansible-pull
apt-get -y autoremove --purge
apt-get -y autoclean
