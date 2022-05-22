# AdGuard Home

[AdGuard Home] is a network ad-blocker and domain name server (DNS).

## Install

1. Download the docker-compose.yml file to the Docker host.
2. Execute `docker-compose up -d` from the same directory as the docker-compose.yml file.

## Configure

Upon creation of the Docker container, set up the administrator account at http://docker.host.ip:3000 (substitute docker.host.ip with the IP address of the Docker host).

This setup uses a MacVLAN network. In this setup, each container is assigned its own unique IP address on the same physical network as the Docker host. This allows multiple containers using the same port to co-exist on the same Docker host. For example, a Pi-hole or a second AdGuard Home instance can be set up on the same Docker host, all using port 53 for DNS queries.
