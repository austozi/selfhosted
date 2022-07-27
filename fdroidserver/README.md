![F-Droid icon](https://raw.githubusercontent.com/austozi/selfhosted/main/fdroidserver/fdroid.svg)

# F-Droid Server

[F-Droid](https://f-droid.org) is an open-source app repository for Android. Think of it as a libre alternative of Google Play Store. This is a custom image. See [here](https://github.com/austozi/docker-fdroidserver) for the source and build instructions.

## Install

1. Download the docker-compose.yml file to the Docker host.
2. Edit the docker-compose.yml file as necessary.
3. Execute docker-compose up -d from the same directory as the docker-compose.yml file.

## Configure

To serve the repo behind [SWAG](https://github.com/linuxserver/docker-swag) as the reverse proxy, copy fdroid.subdomain.conf to /path/to/swag/config/nginx/proxy-conf/ and restart the SWAG container.

Template metadata files for new applications will be auto-generated in ./config/www/fdroid/metadata. These should be edited manually.
