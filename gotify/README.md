# Gotify

[Gotify](https://github.com/gotify/server) is a notification push service. This is the server component. An [Android client](https://github.com/gotify/android) is also available.

## Install

To receive notifications in the Android client whilst out and about, the server should be reachable on the public internet unless the client is connected to the server via a VPN. If making the server reachable on the public internet, it should be deployed behind a reverse proxy enforcing HTTPS, as the docker-compose.yml file has not enabled encryption. It is possible to enable encryption within the gotify server configuration itself. For details, see the upstream project documentation.

To deploy this application, do `docker-compose up -d -f docker-compose.yml` 

The docker-compose.yml file specifies the armhf image because I run this on a Raspberry Pi.
