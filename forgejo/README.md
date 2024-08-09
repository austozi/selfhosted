# Forgejo

[Forgejo](https://forgejo.org) is a self-hosted lightweight software forge.

## Fail2ban setup

1. Copy filter.d/forgejo.local to /path/to/swag/config/fail2ban/filter.d/forgejo.local
1. Append the following to /path/to/swag/config/fail2ban/jail.local:
   ```
   [forgejo]
   enabled = true
   port = http,https
   filter = forgejo
   logpath = /config/log/forgejo/*.log
   ```
1. Mount the log file to the SWAG container by adding the following to /path/to/swag/docker-compose.yml:
   ```
   volumes:
     - /path/to/forgejo/config/gitea/log:/config/log/forgejo:ro
   ```
1. Recreate the SWAG container from /path/to/swag:
   ```
   docker compose up -d --force-recreate
   ```
