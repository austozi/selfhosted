# Calibre-Web

[Calibre-Web](https://github.com/janeczku/calibre-web) is an e-book management application.

## Install

Run `docker-compose up -d -f`. 

## Security

Calibre-Web offers the Open Publication Distribution System (OPDS), which some ebook readers (e.g. mobile apps) use to access the e-book catalogue. Putting Calibre-Web behind a reverse proxy like NGINX with HTTP basic authentication will break this functionality, unless an exception is made to allow public connection to the /opds directory on the Calibre-Web instance. In that case, fail2ban can be used mitigate the risk of unauthorised access.

To set up fail2ban with the [SWAG container](https://github.com/linuxserver/docker-swag) as the reverse proxy, copy calibre-web.local to /path/to/swag/config/fail2ban/filter.d/ and add the following line to /path/to/swag/config/fail2ban/jail.local:

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
