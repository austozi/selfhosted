# WebSSH

[WebSSH](https://github.com/huashengdun/webssh) is a web-based SSH client. These files are used to dockerise the application and serve it behind an NGINX reverse proxy, provided by the [SWAG image](https://github.com/linuxserver/docker-swag).

## Build

The latest build of this image is available on [Docker Hub](https://hub.docker.com/r/austozi/webssh) for the armhf architecture. 

Execute `docker build -t austozi/webssh:latest .` (note: the trailing period is important).

## Install

Run `docker-compose up -d`.

## Security

This application should be deployed behind a reverse proxy with HTTP basic authentication, monitored by fail2ban.
