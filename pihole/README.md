# Pi-hole

[Pi-hole](https://pi-hole.net/) is a network-level ad-blocker and DNS server.

## Install

Execute `docker-compose.yml`.

This application uses the [official Docker image](https://hub.docker.com/r/pihole/pihole). It is configured to join the Docker network for the NGINX reverse proxy, provided by the [SWAG image](https://github.com/linuxserver/docker-swag), with additional layers of authentication, so that its admin interface can be accessed remotely. Never expose this admin interface directly to the internet or without additional layers of authentication.
