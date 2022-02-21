# F-Droid Server

[F-Droid](https://f-droid.org) is an open-source app repository for Android. Think of it as a libre alternative of Google Play Store.

## Build

This image makes use of the `fdroidserver` package maintained by the [Debian project](https://www.debian.org). It includes the Apache web server which listens on port 80.

To build the image, download Dockerfile and execute from the same directory on the host:

```
docker build -t austozi/fdroidserver:latest .
```

## Install

Execute the following in the same directory as docker-compose.yml:

```
docker-compose up -d
```

## Configure

To configure the instance,  edit ./config/www/fdroid/config.yml. 

For details and an example, see [here](https://gitlab.com/fdroid/fdroidserver/blob/2.0.3/examples/config.yml).

To serve the repo behind [SWAG](https://github.com/linuxserver/docker-swag) as the reverse proxy, copy fdroid.subdomain.conf to /path/to/swag/config/nginx/proxy-conf/ and restart the SWAG container.

The first time you run the container, deloy fdroid repo by executing the following on the host:

```
docker exec -it fdroid fdroid deploy -v
```

Then, add your APK files to ./config/www/fdroid/repo and execute the following to update the index:

```
docker exec -it fdroid fdroid update -c
```

This command will generate template metadata files in ./config/www/fdroid/metadata for new APK files. Please edit these manually, then execute the update command above again to update the index.
