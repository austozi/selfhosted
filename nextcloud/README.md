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
2. Still as the admin user, under Settings > Administration > Basic settings, tick the box 'Enforce two-factor authentication' and save the change.
