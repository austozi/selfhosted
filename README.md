# Selfhosted

This repository contains configurations for my selfhosted services. It is intended for my personal use only.

## Docker host configuration

1. Install [Docker](https://docs.docker.com/get-docker): `curl -fsSL https://get.docker.com | sudo bash`.
2. Add current user to the docker group: `sudo adduser $(whoami) docker`.
3. Log out and log back in.
4. Create `/etc/docker/daemon.json` with the following content to reduce the IP address pool size:
   
   ```
   {
     "default-address-pools" : [
          {
            "base" : "172.17.0.0/12",
            "size" : 20
          },
          {
            "base" : "192.168.0.0/16",
            "size" : 24
          }
       ]
     }
   ```
   
6. Restart the Docker service: `sudo systemctl restart docker`.

## Deploying a containerised application

1. Download docker-compose.yml for the application and customise as appropriate.
1. Download .env.example (if any) into the same directory as docker-compose.yml, edit appropriately and rename it to .env.
1. Execute `docker compose up -d`.
1. Make the application available on the Internet via [SWAG](https://github.com/linuxserver/docker-swag), if necessary.
1. Enforce multi-factor authentication, if available.
1. Protect the application with [Authelia](https://github.com/authelia/authelia) or basic HTTP authentication, if possible.
1. Enable [Fail2ban](https://github.com/fail2ban/fail2ban) protection, if available (see below).

## Enabling Fail2ban protection

Applications with a fail2ban sub-directory can be protected against bruteforce login attempts using Fail2ban. To enable Fail2ban, perform the following steps, replacing `appname` with the name of the application directory.

1. Copy filter.d/`appname`.local to /path/to/swag/config/fail2ban/filter.d/`appname`.local
1. Append the content of jail.d/`appname`.local to /path/to/swag/config/fail2ban/jail.local.
1. Mount the log file to the SWAG container by adding its path to /path/to/swag/docker-compose.yml. The log file path may vary per application. The following is just an example:
   ```
   volumes:
     - /path/to/appname/config/log:/config/log/appname:ro
   ```
1. Recreate the SWAG container from /path/to/swag:
   ```
   docker compose up -d --force-recreate
   ```
