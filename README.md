# Selfhosted

This repository contains configurations for my selfhosted services. It is intended for my personal use only.

## Configuring the Docker Host

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
