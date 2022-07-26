# F-Droid Server

[F-Droid](https://f-droid.org) is an open-source app repository for Android. Think of it as a libre alternative of Google Play Store.

## Build

This image makes use of the `fdroidserver` package maintained by the [Debian project](https://www.debian.org). It includes the Apache web server which listens on port 80.

To build the image, download Dockerfile and execute from the same directory on the host:

```
docker build -t austozi/fdroidserver:latest .
```

Or, edit the file build_push.sh according and execute it. This will build the image, tag it and push it to [Docker Hub](https://hub.docker.com).

## Install

1. Download the docker-compose.yml file to the Docker host.
2. Edit the docker-compose.yml file as necessary.
3. Execute docker-compose up -d from the same directory as the docker-compose.yml file.

## Configure

To configure the instance,  edit ./config/www/fdroid/config.yml. 

For details and an example, see [here](https://gitlab.com/fdroid/fdroidserver/blob/2.0.3/examples/config.yml).

To serve the repo behind [SWAG](https://github.com/linuxserver/docker-swag) as the reverse proxy, copy fdroid.subdomain.conf to /path/to/swag/config/nginx/proxy-conf/ and restart the SWAG container.

The first time you run the container, deloy the repo by executing on the host:

```
docker exec -it fdroid fdroid init
```

Every time you add new APK files to ./config/www/fdroid/repo, execute the following to update the index:

```
docker exec -it fdroid fdroid update -c
```

This command will generate template metadata files in ./config/www/fdroid/metadata for new APK files. Please edit these manually, then execute the update command above again to update the index.

To schedule unatteded index updates, add the following line to ./config/crontabs/root:

```
0 * * * * fdroid update -c
```
This will execute the update every hour. Refer to cron syntax for other update intervals.
