# Selfhosted

**This repo is intended for my personal use and is work in progress. The documentation may be incomplete or inaccurate. Use at your own risk.**

Resources relating to selfhosted services.

## Security

The following table summarises the application features that may help determine whether to expose the applications publicly, and measures to harden them if necessary (i.e. whether fail2ban configurations are available). 

Some guiding principles:

1. Minimise the number of applications exposed to the public internet. Only expose an application if absolutely necessary.
3. Enforce two-factor authentication (2FA) for any application that offers it. 
4. For any application that does not offer 2FA, implement HTTP basic authentication at the reverse proxy as an additional security layer if it needs to be made available on the public internet. However, be aware that HTTP basic authentication may break any clients (e.g. mobile apps) that need access to its public API.
5. Enable fail2ban for all applications, wherever possible.

| Application        | Primary authentication | 2FA  | Mobile app | fail2ban | Authelia | Subnet         |
|--------------------|------------------------|------|------------|----------|----------|----------------|
| Barcode Buddy      | Username & Password    |      | Yes        | Yes      |          |                |
| BookStack          | Username & Password    | TOTP |            | Yes      |          |
| Calibre-Web        | Username & Password    |      | Yes        | Yes      |          |                |
| changedetection.io | Password only          |      |            |          | Yes      |                |
| File Browser       | Username & Password    |      |            | Yes      | Yes      | 172.16.10.0/29 |
| Firefly III        | Username & Password    | TOTP |            |          |          |                |
| FreshRSS           | Username & Password    |      | Yes        | Yes      |          | 172.16.14.0/29 |
| Gotify             | Username & Password    |      | Yes        |          |          |                |
| Grocy              | Username & Password    |      | Yes        | Yes      |          | 172.16.19.0/29 |
| Hammond            | Username & Password    |      |            |          | Yes      |                |
| Heimdall           | Password only          |      |            |          | Yes      |                |
| Home Assistant     | Username & Password    | TOTP | Yes        |          |          |                |
| Homer              |                        |      |            |          | Yes      |                |
| Jellyfin           | Username & Password    |      | Yes        | Yes      |          | 172.16.22.0/29 |
| Linkding           | Username & Password    |      |            |          | Yes      | 172.16.16.0/29 |
| Navidrome          | Username & Password    |      | Yes        | Yes      |          |                |
| Nextcloud          | Username & Password    | TOTP | Yes        | Yes      |          |                |
| Papermerge         | Username & Password    |      |            |          | Yes      |                |
| OpenBooks          |                        |      |            |          | Yes      | 172.16.43.0/29 |
| Pi-hole Dashboard  | Password only          |      |            |          | Yes      |                |
| PiGallery 2        | Username & Password    |      |            |          | Yes      |                |
| Planka             | Username & Password    |      |            |          | Yes      |                |
| Podcast Server     |                        |      |            |          |          |                |
| Portainer          | Username & Password    |      |            |          | Yes      |                |
| pyLoad             | Username & Password    |      |            |          |          |                |
| Roundcube          | Username & Password    | TOTP |            |          |          |                |
| Scrutiny           |                        |      |            |          | Yes      | 172.16.33.0/29 |
| SheetAble          | Username & Password    |      |            |          | Yes      |                |
| Snapdrop           |                        |      | Yes        |          |          |                |
| Snipe-IT           | Username & Password    | TOTP |            |          |          |                |
| Syncthing          | Username & Password    |      |            |          | Yes      |                |
| Tandoor            | Username & Password    |      |            |          | Yes      |                |
| Uptime Kuma        | Username & Password    | TOTP |            |          |          |                |
| Vaultwarden        | Username & Password    | TOTP | Yes        | Yes      |          |                |
| Wallabag           | Username & Password    | TOTP | Yes        |          |          |                |
| WebSSH             | Username & Password    | TOTP |            |          |          |                |
| Wiki.js            | Username & Password    | TOTP |            |          |          |                |
| μlogger            | Username & Password    |      | Yes        | Yes      |          |                |
