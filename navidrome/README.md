# Navidrome

[Navidrome](https://github.com/navidrome/navidrome) is a music streaming server. It is compatible with various AirSonic-compatible clients, e.g. [Subtracks](https://github.com/austinried/subtracks) on Android.

## Install

Run `docker-compose up -d`.

### Security

To set up fail2ban for this Navidrome container with a [SWAG](https://github.com/linuxserver/docker-swag) container as the reverse proxy:

1. Copy navidrome.local to the /path/to/swag/config/fail2ban/filter.d/ directory.
2. Append the following lines to the file /path/to/swag/config/fail2ban/jail.local:
    ```
    [navidrome]
    enabled  = true
    port     = http,https
    filter   = navidrome
    logpath  = /config/log/navidrome/navidrome.log
    ```
3. Mount the log file from the Navidrome container into the SWAG container by adding the following lines to the latter's docker-compose.yml file:
    ```
    volumes:
      - "/path/to/navidrome/config/navidrome.log:/config/log/navidrome/navidrome.log:ro"
    ```
4. Recreate the SWAG container to take affect.
