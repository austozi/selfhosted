# μlogger

[μlogger](https://github.com/bfabiszewski/ulogger-server) is a real-time geolocation tracking application. These files are used to dockerise the server component. The [Android client](https://f-droid.org/en/packages/net.fabiszewski.ulogger/) is available on [F-Droid](https://f-droid.org).

## Build

1. Download the build.sh script.
2. Make build.sh executable by executing `chmod +x ./build.sh` in the directory where it is located. 
3. Execute build.sh: `./build.sh`

The script will download the specified release of the source code from upstream and build the image for use with an SQLite database. It will then delete the source files after the build, and push the newly built image to [Docker Hub](https://hub.docker.com/r/austozi/ulogger-server).

## Install

Run `docker-compose up -d`. The default username and password are both 'admin'.

## Known issues

There is an upstream bug in release 1.0 where the SQLite database is read-only by default, thus the application cannot save any data to the database. A [fix has been merged in the master branch](https://github.com/bfabiszewski/ulogger-server/pull/137) but at the time of writing, the latest release (1.0) does not yet incorporate this fix. I have attempted a hack in the docker-compose.yml file to change the file permissions after the init.sh script. This makes the database writable in the meantime while we await the next release from upstream.
