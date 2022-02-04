#!/bin/bash -e
# Run as root.

curl -sSL https://get.docker.com | bash
apt-get update
apt-get -y dist-upgrade
apt-get -y install docker-ce docker-compose
