# Vaultwarden

[Vaultwarden](https://github.com/dani-garcia/vaultwarden) is a [Bitwarden](https://www.bitwarden.com)-compatible password management server. It works with the [official Bitwarden clients](https://bitwarden.com/download/).

## Install

To deploy the application, do `docker-compose up -d -f docker-compose.yml`.

The mailer network is used to send email notifications using a private email server. If a public email server is used, the mailer network can be safely removed from the docker-compose.yml file.

## Security

Read the [Vaultwarden Wiki](https://github.com/dani-garcia/vaultwarden/wiki) for the hardening guide. The following are adaptations for use with the [SWAG image](https://github.com/linuxserver/docker-swag).

Copy the *.local files to /path/to/swag/config/fail2ban/filter.d/.

Jails are defined in /path/to/swag/config/fail2ban/jail.local, **NOT** in /path/to/swag/config/fail2ban/jail.d/*.local, as suggested by the Vaultwarden Wiki. Add the following lines to ./config/fail2ban/jail.local:

```
[vaultwarden]
enabled = true
port = 80,443,8081
filter = vaultwarden
logpath = /config/log/vaultwarden/vaultwarden.log

[vaultwarden-admin]
enabled = true
port = 80,443,8081
filter = vaultwarden-admin
logpath = /config/log/vaultwarden/vaultwarden.log
```

Mount the log directory for the Vaultwarden container to the SWAG container, by adding the following to the docker-compose.yml file for the SWAG container:

```
volumes:
  # vaultwarden_log_path:swag_log_path
  - "/path/to/vaultwarden/config/log:/config/log/vaultwarden:ro"
```

Recreate the SWAG container to take effect.
