# Navidrome

[Navidrome](https://www.navidrome.org) is a streaming music server.

## Install

1. Download `docker-compose.yml` and execute `docker compose up -d`.

# fail2ban

1. Create the file `filter.d/navidrome.local` with the following content:

   ```
   [INCLUDES]
   before = common.conf

   [Definition]
   failregex = msg="Unsuccessful login".*X-Real-Ip:\[<ADDR>\]
   ignoreregex =
   ```
   
2. Add the following to `jail.local`:

   ```
   [navidrome]
   enabled = true
   port = http,https
   filter = navidrome
   logpath = /config/log/navidrome/navidrome.log   
   ```
   
3. Map the log file so fail2ban can read it.
