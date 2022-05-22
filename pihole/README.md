![Pi-hole](https://github.com/austozi/selfhosted/raw/main/pihole/pihole.svg)

# Pi-hole

[Pi-hole](https://pi-hole.net/) is a network-level ad-blocker, domain name server (DNS) and dynamic host configuration protocol (DHC)P server.

## Install

1. Download the docker-compose.yml file to the Docker host.
2. Edit docker-compose.yml as necessary.
3. Execute `docker-compose up -d` in the directory where the docker-compose.yml file is located.

## Configure

This setup uses a MacVLAN network. In this setup, each container is assigned its own unique IP address on the same physical network as the Docker host. This allows multiple containers using the same port to co-exist on the same Docker host. For example, an AdGuard Home or a second Pi-hole instance can be set up on the same Docker host, all using port 53 for DNS queries, for redundancy.
