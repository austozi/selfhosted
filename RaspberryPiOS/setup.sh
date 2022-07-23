#!/bin/bash -e
# Execute this script as superuser
apt-get update
apt-get -yy dist-upgrade
apt-get -yy install ansible-pull
apt-get -yy autoremove --purge
apt-get -yy autoclean
