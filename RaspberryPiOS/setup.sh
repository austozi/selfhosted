#!/bin/bash -e
# Execute this script as superuser
apt-get update
apt-get dist-upgrade
apt-get -y install ansible-pull
