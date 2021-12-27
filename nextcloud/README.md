# Nextcloud

[Nextcloud](https://www.nextcloud.com) is a personal cloud and productivity platform. Its core functionality is for file storage, syncing and sharing. Various add-ons (apps) are available to extend its functionalities.

## Install

Execute `docker-compose up -d`.

This will install the [Nextcloud server](https://hub.docker.com/r/linuxserver/nextcloud), a dedicated [MariaDB database server](https://hub.docker.com/r/yobasystems/alpine-mariadb) and [Redis](https://hub.docker.com/_/redis). It uses off-the-shelf images from Docker Hub. The Nextcloud server itself is intended to be run behind an NGINX reverse proxy, provided by the [SWAG image](https://github.com/linuxserver/docker-swag). 

It also joins the Docker network for the mail server, because Nextcloud uses e-mail notifications.
