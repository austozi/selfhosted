# WebSSH

[WebSSH](https://github.com/huashengdun/webssh) is a web-based SSH client. These files are used to dockerise the application and serve it behind an NGINX reverse proxy, provided by the [SWAG image](https://github.com/linuxserver/docker-swag).

## Build

The latest build of this image is available on [Docker Hub](https://hub.docker.com/r/austozi/webssh) for the armhf architecture. 

To build the image, execute:

```
docker build -t austozi/webssh:latest .
```

## Install

To install the application in Docker, execute:

```
docker-compose up -d
```
