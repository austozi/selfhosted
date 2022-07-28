# Selfhosted

**This repo is intended for my personal use and is work in progress. The documentation may be incomplete or inaccurate. Use at your own risk.**

Resources relating to selfhosted services.

## Security

The following table summarises the application features that may help determine whether to expose the applications publicly, and measures to harden them if necessary (i.e. whether fail2ban configurations are available). 

Some guiding principles:

1. Minimise the number of applications exposed to the public internet. Only expose an application if absolutely necessary.
3. Enforce two-factor authentication (2FA) for any application that offers it. 
4. For any application that does not offer 2FA, implement Auethelia (with 2FA) or HTTP basic authentication at the reverse proxy as an additional security layer if it needs to be made available on the public internet. However, be aware that HTTP basic authentication may break any clients (e.g. mobile apps) that need access to its public API.
5. Enable fail2ban for all applications, wherever possible.

| Application | Auth | 2FA | Mobile app | fail2ban | Authelia | Subnet |
|--------------------|------------------------|------|------------|----------|----------|----------------|
| Barcode Buddy | user:pass | | Yes | Yes | | |
| BookStack | user:pass | TOTP | | Yes | |
| Calibre-Web | user:pass | | Yes | Yes | | |
| changedetection.io | pass | | | | Yes | |
| [F-Droid](https://github.com/austozi/selfhosted/tree/main/fdroidserver) | | | | | | 172.16.9.0/29 |
| [File Browser](https://github.com/austozi/selfhosted/tree/main/filebrowser) | user:pass | | | Yes | Yes | 172.16.10.0/29 |
| Firefly III | user:pass | TOTP | | | | |
| [FreshRSS](https://github.com/austozi/selfhosted/tree/main/freshrss) | user:pass | | Yes | Yes | | 172.16.14.0/29 |
| Gotify | user:pass | | Yes | | | |
| [Grocy](https://github.com/austozi/selfhosted/tree/main/grocy) | user:pass | | Yes | Yes | | 172.16.19.0/29 |
| Hammond | user:pass | | | | Yes | |
| Heimdall | pass | | | | Yes | |
| Home Assistant | user:pass | TOTP | Yes | | | |
| Homer | | | | | Yes | |
| [Jellyfin](https://github.com/austozi/selfhosted/tree/main/jellyfin) | user:pass | | Yes | Yes | | 172.16.22.0/29 |
| Linkding | user:pass | | | | Yes | 172.16.16.0/29 |
| Navidrome | user:pass | | Yes | Yes | | |
| Nextcloud | user:pass | TOTP | Yes | Yes | | |
| Papermerge | user:pass | | | | Yes | |
| OpenBooks | | | | | Yes | 172.16.43.0/29 |
| [Pi-hole](https://github.com/austozi/selfhosted/tree/main/pihole) | pass | | | | Yes | 172.16.28.0/29 |
| PiGallery 2 | user:pass | | | | Yes | |
| Planka | user:pass | | | | Yes | |
| Podcast Server | | | | | | |
| Portainer | user:pass | | | | Yes | |
| pyLoad | user:pass | | | | | |
| Roundcube | user:pass | TOTP | | | | |
| Scrutiny | | | | | Yes | 172.16.33.0/29 |
| SheetAble | user:pass | | | | Yes | |
| Snapdrop | | | Yes | | | |
| Snipe-IT | user:pass | TOTP | | | | |
| Syncthing | user:pass | | | | Yes | |
| Tandoor | user:pass | | | | Yes | |
| Uptime Kuma | user:pass | TOTP | | | | |
| Vaultwarden | user:pass | TOTP | Yes | Yes | | |
| Wallabag | user:pass | TOTP | Yes | | | |
| WebSSH | user:pass | TOTP | | | Yes | 172.16.42.0/29 |
| Wiki.js | user:pass | TOTP | | | | |
| μlogger | user:pass | | Yes | Yes | | |
