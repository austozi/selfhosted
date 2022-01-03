# FreshRSS

[FreshRSS](https://github.com/FreshRSS/FreshRSS) is a news feed aggregator. This is the server component. Various clients are also available.

## Install

1. Download the docker-compose.yml to a directory on the Docker host.
2. Execute `docker-compose up -d` in the same directory.

## Configure

### Create admin account

1. Navigate to the application in the browser (e.g. https://freshrss.example.com). 
2. If installing a new instance, follow the instructions to set up the admin account.
3. If installing over an existing instance, the container will reuse the existing configurations.

### Set up fail2ban

The following steps will configure fail2ban in a SWAG container as the reverse proxy.

1. [Configure](https://github.com/austozi/selfhosted/wiki/Make-container-log-remote-IP) the container to log the IP address of the remote client rather than the reverse proxy.
2. Create a fail2ban filter for FreshRSS at /path/to/swag/config/fail2ban/filter.d/freshrss.local:
    ```
    # /path/to/swag/config/fail2ban/filter.d/freshrss.local
    
    [INCLUDES]
    before      = common.conf
    
    [Definition]
    failregex   = ^<ADDR>.+ 403 [0-9]+
    ignoreregex =
    ```
3. Append the following lines to /path/to/swag/config/fail2ban/jail.local:
    ```
    [freshrss]
    enabled  = true
    port     = http,https
    filter   = freshrss
    logpath  = /config/log/freshrss/access.log
    ```
4. Mount this application's NGINX access log into the SWAG container, by adding the following to the docker-compose.yml file of the latter:
   ```
   volumes:
     - "/path/to/freshrss/config/log/nginx:/config/log/freshrss:ro"
   ```
5. Recreate the SWAG container by executing `docker-compose up -d` in the directory where the docker-compose.yml for SWAG is located.
6. [Verify](https://github.com/austozi/selfhosted/wiki/Verify-fail2ban-is-working) that fail2ban is working for this application.
