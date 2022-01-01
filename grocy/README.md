# Grocy

[Grocy](https://grocy.info) is a grocery and household management system. This is the server component. An [Android client](https://github.com/patzly/grocy-android) is also available.

## Install

Run `docker-compose up -d`. 

This setup uses the docker.io/linuxserver/grocy image with SQLite.

The Android client lags behind the server in version upgrades, so there can be incompatibilities as new server versions are released. To ensure compatibility of the Android client with the server, this setup pins the Docker image to a specific version and therefore requires manual upgrades.

## Security

Putting Grocy behind HTTP basic authentication will break the functionality of the Android client. If exposing the instance to the public internet, enable fail2ban as follows (using a [SWAG container](https://github.com/linuxserver/docker-swag) for the reverse proxy):

1. Copy the grocy.local file to the /path/to/swag/config/fail2ban/filter.d/ directory.
2. Append the following lines to /path/to/swag/config/fail2ban/jail.local:
    ```
    [grocy]
    enabled  = true
    port     = http,https
    filter   = grocy
    logpath  = /config/log/grocy/access.log
    ```
3. Mount the Grocy container's log directory into the SWAG container by adding the following lines to the latter's docker-compose.yml file:
    ```
    volumes:
      - "/path/to/grocy/config/log/nginx:/config/log/grocy:ro"
    ```
4. Recreate the SWAG container to take effect.
