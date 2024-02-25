# Selfhosted

This repository contains configurations for my selfhosted services. It is intended for my personal use only.

## Docker host configuration

1. Install Docker: `curl -fsSL https://get.docker.com | sudo bash`.
2. Add current user to the docker group: `sudo adduser $(whoami) docker`.
3. Log out and log back in.
4. Create `/etc/docker/daemon.json` with the following content:
   
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

1. Download docker-compose.yml for the application, customise accordingly and execute `docker compose up -d`.
2. Make the application available on the Internet via [SWAG](https://github.com/linuxserver/docker-swag), if necessary.
3. Enforce multi-factor authentication, if available.
4. Protect the application with [Authelia](https://github.com/authelia/authelia) or basic HTTP authentication, if possible.
5. Enable [Fail2ban](https://github.com/fail2ban/fail2ban) protection, if available. Applications with a fail2ban directory can be protected by fail2ban.
