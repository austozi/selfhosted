![Pi-hole](https://github.com/austozi/selfhosted/raw/main/pihole/pihole.svg)

# Pi-hole

[Pi-hole](https://pi-hole.net/) is a network-level ad-blocker, DNS server and DHCP server.

## Install

1. Download the docker-compose.yml file to the Docker host.
2. Edit docker-compose.yml as necessary.
3. Execute `docker-compose up -d` in the directory where the docker-compose.yml file is located.

## Configure

This application uses the [official Docker image](https://hub.docker.com/r/pihole/pihole). It is configured to join the Docker network for the NGINX reverse proxy, provided by the [SWAG image](https://github.com/linuxserver/docker-swag), with additional layers of authentication, so that its admin interface can be accessed remotely. Never expose this admin interface directly to the internet or without additional layers of authentication.
