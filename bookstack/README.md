# BookStack

[BookStack](https://github.com/BookStackApp/BookStack) is a knowledge base application.

## Install

To deploy the application, do `docker-compose up -d -f docker-compose.yml`.

Additional configurations can be specified in ./config/www/.env. 

## Security

First, read the upstream project's [security guide](https://www.bookstackapp.com/docs/admin/security/). The following notes describe the adaptations using the [SWAG container](https://github.com/linuxserver/docker-swag) as the reverse proxy.

1. To set up fail2ban to block brute-force login attempts, add the following line to the .env file:

  ```
  LOG_FAILED_LOGIN_MESSAGE="Failed login for %u"
  ```
  
2. Copy the bookstack.local file to the /path/to/swag/config/fail2ban/filter.d/ directory.
3. Add the following lines to /path/to/swag/config/fail2ban/jail.local:

  ```
  [bookstack]
  enabled  = true
  port     = http,https
  filter   = bookstack
  logpath  = /config/log/bookstack/error.log
  ```
4. Add the following volume mapping to the docker-compose.yml file for the SWAG container:

  ```
  volumes:
    - "/path/to/bookstack/config/log/nginx:/config/log/bookstack:ro"
  ```
5. Recreate the SWAG container: `docker-compose up -d -f /path/to/swag/docker-compose.yml`.
