# μlogger

[μLogger](https://github.com/bfabiszewski/ulogger-server) is a real-time geolocation tracking application. These files are used to dockerise the server component. The [Android client](https://f-droid.org/en/packages/net.fabiszewski.ulogger/) is available on [F-Droid](https://f-droid.org).

This application is intended to be run behind an NGINX reverse proxy, provided by the [SWAG image](https://github.com/linuxserver/docker-swag).

## Build

Make the build.sh script executable `chmod +x build.sh`, then execute it. 

The script will download the specified release of the source code from upstream, tweak the Dockerfile to disable Docker volume creation in the image, and then build the image for use with an SQLite database. The script will delete the source files after the build, and push the image to [Docker Hub](https://hub.docker.com/r/austozi/ulogger-server).

## Install

Run `docker-compose up -d`. The default username and password are both 'admin'.

## Known issues

There is an upstream bug in release 1.0 where the SQLite database is read-only by default, thus the application cannot save any data to the database. A [fix has been merged in the master branch](https://github.com/bfabiszewski/ulogger-server/pull/137) but at the time of writing, the latest release (1.0) does not yet incorporate this fix. I have attempted a hack in the docker-compose.yml file to change the file permissions after the init.sh script. This makes the database writable in the meantime while we await the next release from upstream.
