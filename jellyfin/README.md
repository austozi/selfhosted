# Jellyfin

[Jellyfin](https://github.com/jellyfin/jellyfin) is a streaming media application. This is the server component. Official mobile clients are available.

## Install

1. Download the docker-compose.yml file to the Docker host.
2. Execute `docker-compose up -d` in the directory where the docker-compose.yml file is located.

## Configure


### Create admin account

The application will need to be configured manually. This only needs to be done once.

1. Navigate to the application in the browser (e.g. https://jellyfin.example.com) and follow the instructions to set up the admin account.
2. Recreate the container by executing, in the same directory where the docker-compose.yml file is located, `docker-compose up -d`.

### Set up fail2ban

This application does not offer built-in two-factor authentication (2FA), and the mobile app will not work with HTTP basic authentication. It is advisable to configure fail2ban to mitigate the risk of unauthorised access. Jellyfin also allows a maximum number of login attempts to be specified for any user. If this limit is exceeded, the user will be locked out until the counter is reset by an administrator.

The following steps will configure fail2ban in a SWAG container as the reverse proxy.

1. Create a fail2ban filter at /path/to/swag/config/fail2ban/filter.d/jellyfin.local:
    ```
    # /path/to/swag/config/fail2ban/filter.d/jellyfin.local
    
    [INCLUDES]
    before      = common.conf
    
    [Definition]
    failregex   = ^.+ Authentication request .+ has been denied \(IP\: \"<ADDR>\"\)\.
    ignoreregex =
    ```
3. Append the following lines to /path/to/swag/config/fail2ban/jail.local:
    ```
    [jellyfin]
    enabled = true
    port    = http,https
    filter  = jellyfin
    logpath = /config/log/jellyfin/*.log
    ```
4. Mount this application's log into the SWAG container, by adding the following to the docker-compose.yml file of the latter:
   ```
   volumes:
     - "/path/to/jellyfin/config/log:/config/log/jellyfin:ro"
   ```
5. Recreate the SWAG container by executing `docker-compose up -d` in the directory where the docker-compose.yml for SWAG is located.
6. [Verify](https://github.com/austozi/selfhosted/wiki/Verify-fail2ban-is-working) that fail2ban is working for this application.
