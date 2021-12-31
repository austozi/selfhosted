# Vaultwarden

[Vaultwarden](https://github.com/dani-garcia/vaultwarden) is a [Bitwarden](https://www.bitwarden.com)-compatible password management server. It works with the [official Bitwarden clients](https://bitwarden.com/download/).

## Install

To deploy the application, do `docker-compose up -d -f docker-compose.yml`.

The mailer network is used to send email notifications using a private email server. If a public email server is used, the mailer network can be safely removed from the docker-compose.yml file.

## Security

Read the [Vaultwarden Wiki](https://github.com/dani-garcia/vaultwarden/wiki) for the hardening guide. The following are adaptations for use with the [SWAG image](https://github.com/linuxserver/docker-swag).

Jails are defined in ./config/fail2ban/jail.local, **NOT** in ./config/fail2ban/jail.d/vaultwarden(-admin).local as suggested by the Vaultwarden Wiki.

Be sure to mount the log directory for the Vaultwarden container to the SWAG container:

```
volumes:
  - "/path/to/vaultwarden/config/log:/config/log/vaultwarden:ro"
```
