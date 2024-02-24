# Docker Host

1. Prepare the docker host by installing Docker: `curl -fsSL https://get.docker.com | sudo bash`.
2. Add current user to the `docker` group: `sudo adduser $(whoami) docker`.
3. Log out and log back in.
4. Copy `etc/docker/daemon.json` to `/etc/docker/daemon.json`.
5. Restart the Docker service: `sudo systemctl restart docker`.
