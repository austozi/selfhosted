# BookStack

[BookStack](https://github.com/BookStackApp/BookStack) is a knowledge base application.

## Install

1. Download the docker-compose.yml file to the Docker host.
2. Execute `docker-compose up -d` from the same directory as the docker-compose.yml file.

:information_source: Additional configurations may need to be specified in /path/to/bookstack/config/www/.env. 

## Configuration

### User accounts

This application needs to be configured manually on first use. To do so, navigate to the instance in the web browser (e.g. https://bookstack.example.com) and follow the on-screen instructions to set up a user account. This only needs to be done once.

The username for the default administrator's account is **admin<span></span>@admin.com**. The default password is **password**. Be sure to change these upon first successful login.

### fail2ban

These steps will set up [fail2ban](https://github.com/austozi/selfhosted/wiki/fail2ban) using the [SWAG](https://github.com/austozi/selfhosted/tree/main/swag) container as the reverse proxy.

1. Add the following line to the /path/to/bookstack/config/www/.env file:
    ```
    LOG_FAILED_LOGIN_MESSAGE="Failed login for %u"
    ```
1. Configure the BookStack container to [log the real IP address of the remote client](https://github.com/austozi/selfhosted/wiki/fail2ban#log-remote-ip-address), rather than that of the reverse proxy.
1. Copy [the relevant filter definition](https://github.com/austozi/selfhosted/tree/main/swag/config/fail2ban/filter.d) to the /path/to/swag/config/fail2ban/filter.d/ on the Docker host.
1. Append the [relevant jail](https://github.com/austozi/selfhosted/tree/main/swag/config/fail2ban/jail.local) to /path/to/swag/config/fail2ban/jail.local on the Docker host.
1. Mount the relevant log directory into the SWAG container in the docker-compose.yml file for SWAG:
    ```
    volumes:
      - "../bookstack/config/log/nginx:/config/log/bookstack:ro"
    ```
1. Recreate the SWAG container by running `docker-compose up -d` in the same directory as the [docker-compose.yml](https://github.com/austozi/selfhosted/blob/main/swag/docker-compose.yml) file for SWAG.
1. [Verify](https://github.com/austozi/selfhosted/wiki/fail2ban) that fail2ban is working for this application.
