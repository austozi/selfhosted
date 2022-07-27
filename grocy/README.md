![Grocy](https://raw.githubusercontent.com/austozi/selfhosted/main/grocy/grocy.svg)

# Grocy

[Grocy](https://grocy.info) is a grocery and household management system. This is the server component. An [Android client](https://github.com/patzly/grocy-android) is also available.

## Install

1. Download the docker-compose.yml file to the Docker host.
1. Execute `docker-compose up -d` from the same directory as the docker-compose.yml file.

:information_source: The mobile client upgrades may lag behind the server, so there can be incompatibilities as new server versions are released. To ensure compatibility of the Android client with the server, this setup pins the Docker image to a specific version and therefore requires manual upgrades.

## Configure

### User accounts

This application needs to be configured manually on first use. To do so, navigate to the instance in the web browser (e.g. https://grocy.example.com) and follow the on-screen instructions to set up a user account. This only needs to be done once.

The username and password for the default administrator's account are both **admin**. Be sure to change these upon first successful login.

### fail2ban

These steps will set up [fail2ban](https://github.com/austozi/selfhosted/wiki/fail2ban) using the [SWAG](https://github.com/austozi/selfhosted/tree/main/swag) container as the reverse proxy.

1. Configure the Grocy container to [log the real IP address of the remote client](https://github.com/austozi/selfhosted/wiki/fail2ban#log-remote-ip-address), rather than that of the reverse proxy.
1. Copy [the relevant filter definition](https://github.com/austozi/selfhosted/tree/main/swag/config/fail2ban/filter.d) to the /path/to/swag/config/fail2ban/filter.d/ on the Docker host.
1. Append the [relevant jail](https://github.com/austozi/selfhosted/tree/main/swag/config/fail2ban/jail.local) to /path/to/swag/config/fail2ban/jail.local on the Docker host.
1. Mount the relevant log directory into the SWAG container in the docker-compose.yml file for SWAG:
    ```
    volumes:
      - "../grocy/config/log/nginx:/config/log/grocy:ro"
    ```
1. Recreate the SWAG container by running `docker-compose up -d` in the same directory as the [docker-compose.yml](https://github.com/austozi/selfhosted/blob/main/swag/docker-compose.yml) file for SWAG.
1. [Verify](https://github.com/austozi/selfhosted/wiki/fail2ban) that fail2ban is working for this application.
