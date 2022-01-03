# Nextcloud

[Nextcloud](https://www.nextcloud.com) is a personal cloud and productivity platform. Its core functionality is for file storage, syncing and sharing. Various add-ons (apps) are available to extend its functionalities.

## Install

1. Download the docker-compose.yml file to the Docker host.
3. Execute `docker-compose up -d` in the directory where the docker-compose.yml file is located.

## Configure

This application needs to be configured manually. This only needs to be done once.

1. Navigate to the application in the browser (e.g. https://nextcloud.example.com) and follow the instructions to set up the admin account.
2. Be sure to use MySQL as the database rather than SQLite. Use the same values for the nextcloud_db container, as specified in the docker-compose.yml file.
3. It may be necessary to configure the application further by editing /path/to/nextcloud/config/www/nextcloud/config/config.php.

## Enforce two-factor authentication (2FA)

1. Different 2FA methods are available as add-ons (apps), which can be enabled by the admin user under the Apps menu. Use the time-based one-time password (TOTP) app if unsure. This uses a mobile app to generate a validation code that changes from time to time.
2. Still as the admin user, under Settings > Administration > Basic settings, tick the box 'Enforce two-factor authentication' and save the change. All users will now need to enable 2FA for their accounts.

## Enable brute-force settings

As the admin user, enable the Brute force settings app under the Apps menu. This will slow down repeated login attempts from a given IP address.

## Set up fail2ban

The following steps will configure fail2ban in a SWAG container as the reverse proxy.

1. Create a fail2ban filter at /path/to/swag/config/fail2ban/filter.d/nextcloud.local:
    ```
    # ./config/fail2ban/filter.d/nextcloud.local
    
    [INCLUDES]
    before      = common.conf
    
    [Definition]
    failregex   =^.+Login failed: .+ \(Remote IP: <ADDR>\).+$
    ignoreregex =
    ```
3. Append the following lines to /path/to/swag/config/fail2ban/jail.local:
    ```
    [nextcloud]
    enabled  = true
    port     = http,https
    filter   = nextcloud
    logpath  = /config/log/nextcloud/access.log
    ```
4. Mount this application's NGINX access log into the SWAG container, by adding the following to the docker-compose.yml file of the latter:
   ```
   volumes:
     - "/path/to/nextcloud/config/log/nginx:/config/log/nextcloud:ro"
   ```
5. Recreate the SWAG container by executing `docker-compose up -d` in the directory where the docker-compose.yml for SWAG is located.
6. [Verify](https://github.com/austozi/selfhosted/wiki/Verify-fail2ban-is-working) that fail2ban is working for this application. 
