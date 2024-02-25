# Navidrome

[Navidrome](https://www.navidrome.org) is a streaming music server.

## Install

1. Download `docker-compose.yml` and execute `docker compose up -d`.

# fail2ban

Filter:

```
[INCLUDES]
before = common.conf

[Definition]
failregex = msg="Unsuccessful login".*X-Real-Ip:\[<ADDR>\]
```
   
Jail:
```
[navidrome]
enabled = true
port = http,https
filter = navidrome
logpath = /config/log/navidrome/navidrome.log   
```
   
