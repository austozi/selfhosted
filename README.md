# Selfhosted
Resources relating to selfhosted services.

## Security

The following table summarises the application features that may help determine whether to expose the applications publicly, and measures to harden them if necessary. I usually implement HTTP basic authentication as an additional security layer for public-facing applications that do not offer built-in two-factor authentication (2FA). However, doing so breaks the mobile apps.

| Application        | Primary authentication | 2FA  | Mobile app | fail2ban |
|--------------------|------------------------|------|------------|----------|
| Barcode Buddy      | Username & Password    | -    | Yes        |          |
| BookStack          | Username & Password    | TOTP | -          | Yes      |
| Calibre-Web        | Username & Password    | -    | Yes        | Yes      |
| changedetection.io | Password only          | -    | -          |          |
| File Browser       | Username & Password    | -    | -          |          |
| Firefly III        | Username & Password    | TOTP | -          |          |
| FreshRSS           | Username & Password    | -    | Yes        | Yes      |
| Gotify             | Username & Password    | -    | Yes        |          |
| Grocy              | Username & Password    | -    | Yes        | Yes      |
| Hammond            | Username & Password    | -    | -          |          |
| Heimdall           | Password only          | -    | -          |          |
| Home Assistant     | Username & Password    | TOTP | Yes        |          |
| Homer              | -                      | -    | -          |          |
| Jellyfin           | Username & Password    | -    | Yes        |          |
| Navidrome          | Username & Password    | -    | Yes        | Yes      |
| Nextcloud          | Username & Password    | TOTP | Yes        | Yes      |
| Papermerge         | Username & Password    | -    | -          |          |
| Pi-hole Dashboard  | Password only          | -    | -          |          |
| PiGallery 2        | Username & Password    | -    | -          |          |
| Planka             | Username & Password    | -    | -          |          |
| Portainer          | Username & Password    | -    | -          |          |
| pyLoad             | Username & Password    | -    | -          |          |
| Roundcube          | Username & Password    | TOTP | -          |          |
| Scrutiny           | -                      | -    | -          |          |
| SheetAble          | Username & Password    | -    | -          |          |
| Snapdrop           | -                      | -    | Yes        |          |
| Snipe-IT           | Username & Password    | TOTP | -          |          |
| Syncthing          | Username & Password    | -    | -          |          |
| Tandoor            | Username & Password    | -    | -          |          |
| Uptime Kuma        | Username & Password    | TOTP | -          |          |
| Vaultwarden        | Username & Password    | TOTP | Yes        | Yes      |
| Wallabag           | Username & Password    | TOTP | Yes        |          |
| WebSSH             | Username & Password    | TOTP | -          |          |
| Wiki.js            | Username & Password    | TOTP | -          |          |
| μlogger            | Username & Password    | -    | Yes        | Yes      |
