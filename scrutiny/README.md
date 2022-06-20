# Scrutiny

[Scrutiny](https://github.com/AnalogJ/scrutiny) is a hard disk monitoring tool. It provides a web-based user interface for S.M.A.R.T. monitoring.

## Install

This installation uses the Docker container images released by upstream. It requires [Docker](https://docs.docker.com/) and [Docker Compose](https://docs.docker.com/compose/).

1. Download docker-compose.yml to server and edit to suit the deployment environment.
2. Navigate to the directory where docker-compose.yml is and run `docker-compose up -d` in the terminal.

A configuration folder will be created in the same directory as docker-compose.yml to persist the application data.

## Security

The application does not provide user authentication. Expose the application via a reverse proxy and implement HTTP basic authentication at the reverse proxy and enable fail2ban rules.
