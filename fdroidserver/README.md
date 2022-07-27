![F-Droid icon](https://raw.githubusercontent.com/austozi/selfhosted/main/fdroidserver/fdroid.svg)

# F-Droid Server

[F-Droid](https://f-droid.org) is an open-source app repository for Android. Think of it as a libre alternative of Google Play Store. This is a custom image. See [here](https://github.com/austozi/docker-fdroidserver) for the source and build instructions.

## Install

1. Download the docker-compose.yml file to the Docker host.
2. Edit the docker-compose.yml file as necessary.
3. Execute docker-compose up -d from the same directory as the docker-compose.yml file.

To serve the repo behind [SWAG](https://github.com/linuxserver/docker-swag) as the reverse proxy, copy fdroid.subdomain.conf to /path/to/swag/config/nginx/proxy-conf/ and restart the SWAG container.

## Usage

Once the container has been deployed via the usual route (e.g. with `docker run` or `docker-compose up`), the web frontend can be accessed at http://localhost (default port: 80).

Environmental variables can be specified via Docker run parameters or in the docker-compose.yml file.

The repo will auto-update on a customisable time interval. This auto-update can include downloading third-party APKs to the repo. Save the download scripts as .sh files in a folder and mount the folder to /config/fdroid/update-scripts in the container. The download scripts will be executed one by one during the audo-update. Some example download scripts are included in the update-scripts folder here.

To manually trigger an update, execute on the Docker host:

```
docker exec -it fdroid refresh
```

Template metadata files for new applications will be auto-generated in ./config/www/fdroid/metadata. These should be edited manually, and then either trigger the update manually, or wait for the next auto-update.
