### Create admin account

The application will need to be configured manually, as the initialisation script in the current Docker build has [a bug](https://github.com/bfabiszewski/jellyfin-server/pull/137) that prevents the SQLite database from being configured programmatically. Manual configuration circumvents that bug. This only needs to be done once.

1. Navigate to the application in the browser (e.g. https://jellyfin.example.com) and follow the instructions to set up the admin account.
2. Disable manual configuration in the docker-compose.yml file, by changing `jellyfin_ENABLE_SETUP=1` to `jellyfin_ENABLE_SETUP=0`.
3. Recreate the container by executing, in the same directory where the docker-compose.yml file is located, `docker-compose up -d`.

### Set up fail2ban

This application does not offer built-in two-factor authentication (2FA), and the mobile app will not work with HTTP basic authentication. It is advisable to configure fail2ban to mitigate the risk of unauthorised access.

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
    enabled  = true
    port     = http,https
    filter   = jellyfin
    logpath  = /config/log/jellyfin/*.log
    ```
4. Mount this application's NGINX access log into the SWAG container, by adding the following to the docker-compose.yml file of the latter:
   ```
   volumes:
     - "/path/to/jellyfin/config/log/nginx:/config/log/jellyfin:ro"
   ```
5. Recreate the SWAG container by executing `docker-compose up -d` in the directory where the docker-compose.yml for SWAG is located.
6. [Verify](https://github.com/austozi/selfhosted/wiki/Verify-fail2ban-is-working) that fail2ban is working for this application. 
