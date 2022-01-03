# μlogger

[μlogger](https://github.com/bfabiszewski/ulogger-server) is a real-time geolocation tracking application. An [Android client](https://f-droid.org/en/packages/net.fabiszewski.ulogger/) is available.

## Build

The build.sh script is used to dockerise the application, since an official Docker image for the armhf architecture is unavailable. The script will download the specified release of the source code from upstream and build the image for use with an SQLite database. It will then delete the source files after the build, and push the newly built image to [Docker Hub](https://hub.docker.com/r/austozi/ulogger-server).

1. Download the build.sh script.
2. Make build.sh executable by executing `chmod +x ./build.sh` in the directory where it is located. 
3. Execute the script in the same directory: `./build.sh`.

## Install

1. Download the docker-compose.yml file to the Docker host.
2. If reinstalling over an existing instance, change `ULOGGER_ENABLE_SETUP=1` to `ULOGGER_ENABLE_SETUP=0` in the docker-compose.yml file to reuse the existing configurations.
3. Execute `docker-compose up -d` in the directory where the docker-compose.yml file is located.

## Configure

### Create admin account

The application will need to be configured manually, as the initialisation script in the current Docker build has [a bug](https://github.com/bfabiszewski/ulogger-server/pull/137) that prevents the SQLite database from being configured programmatically. Manual configuration circumvents that bug. This only needs to be done once.

1. Navigate to the application in the browser (e.g. https://ulogger.example.com) and follow the instructions to set up the admin account.
2. Disable manual configuration in the docker-compose.yml file, by changing `ULOGGER_ENABLE_SETUP=1` to `ULOGGER_ENABLE_SETUP=0`.
3. Recreate the container by executing, in the same directory where the docker-compose.yml file is located, `docker-compose up -d`.

### Set up fail2ban

This application does not offer built-in two-factor authentication (2FA), and the mobile app will not work with HTTP basic authentication. It is advisable to configure fail2ban to mitigate the risk of unauthorised access.

The following steps will configure fail2ban in a SWAG container as the reverse proxy.

1. Create a fail2ban filter at /path/to/swag/config/fail2ban/filter.d/ulogger.local:
    ```
    # /path/to/swag/config/fail2ban/filter.d/ulogger.local
    
    [INCLUDES]
    before      = common.conf
    
    [Definition]
    failregex   = auth_error.+\"<ADDR>\"$
    ignoreregex =
    ```
3. Append the following lines to /path/to/swag/config/fail2ban/jail.local:
    ```
    [ulogger]
    enabled  = true
    port     = http,https
    filter   = ulogger
    logpath  = /config/log/ulogger/access.log
    ```
4. Mount this application's NGINX access log into the SWAG container, by adding the following to the docker-compose.yml file of the latter:
   ```
   volumes:
     - "/path/to/ulogger/config/log/nginx:/config/log/ulogger:ro"
   ```
5. Recreate the SWAG container by executing `docker-compose up -d` in the directory where the docker-compose.yml for SWAG is located.
6. [Verify](https://github.com/austozi/selfhosted/wiki/Verify-fail2ban-is-working) that fail2ban is working for this application. 
