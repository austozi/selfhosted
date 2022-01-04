# FreshRSS

[FreshRSS](https://github.com/FreshRSS/FreshRSS) is a news feed aggregator. This is the server component. Various clients are also available.

## Install

1. Download the docker-compose.yml file to the Docker host.
2. Execute `docker-compose up -d` from the same directory as the docker-compose.yml file.

## Configure

### User accounts

This application needs to be configured manually on first use. To do so, navigate to the instance in the web browser (e.g. https://freshrss.example.com) and follow the on-screen instructions to set up a user account. This only needs to be done once.

### fail2ban

These steps will set up [fail2ban](https://github.com/austozi/selfhosted/wiki/fail2ban) using the [SWAG](https://github.com/austozi/selfhosted/tree/main/swag) container as the reverse proxy.

1. Copy [the relevant filter definition](https://github.com/austozi/selfhosted/tree/main/swag/config/fail2ban/filter.d) to the /path/to/swag/config/fail2ban/filter.d/ on the Docker host.
2. Append the [relevant jail](https://github.com/austozi/selfhosted/tree/main/swag/config/fail2ban/jail.local) to /path/to/swag/config/fail2ban/jail.local on the Docker host.
3. Mount the relevant log directory into the SWAG container in the docker-compose.yml file for SWAG:
    ```
    volumes:
      - "../freshrss/config/log/nginx:/config/log/freshrss:ro"
    ```
5. Recreate the SWAG container by running `docker-compose up -d` in the same directory as the [docker-compose.yml](https://github.com/austozi/selfhosted/blob/main/swag/docker-compose.yml) file for SWAG.
6. [Verify](https://github.com/austozi/selfhosted/wiki/fail2ban) that fail2ban is working for this application.
