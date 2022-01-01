# Calibre-Web

[Calibre-Web](https://github.com/janeczku/calibre-web) is an e-book management application.

## Install

Run `docker-compose up -d -f`. 

## Security

To set up fail2ban with the [SWAG container](https://github.com/linuxserver/docker-swag) was the reverse proxy, copy calibre-web.local to /path/to/swag/config/fail2ban/filter.d/ and add the following line to /path/to/swag/config/fail2ban/jail.local:

```
[calibre-web]
enabled  = true
port     = http,https
filter   = calibre-web
logpath  = /config/log/calibre-web/calibre-web.log
```
Then mount Calibre-Web's log file into the SWAG container in the latter's docker-compose.yml file:

```
volumes:
  - "/path/to/calibre-web/config/calibre-web.log:/config/log/calibre-web/calibre-web.log:ro"
```
Recreate the SWAG container to take effect.
