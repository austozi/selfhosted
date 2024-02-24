# File Browser

[File Browser](https://github.com/filebrowser/filebrowser) is a web interface for file management.

## Install

1. Download `docker-compose.yml` and execute `docker compose up -d`.

## Fail2ban configuration

1. Create `filter.d/filebrowser.local` with the following content:

   ```
   [INCLUDES]
   before = common.conf

   [Definition]
   failregex = ^.+ 403 <ADDR> .+$
   ignoreregex =
   ```

2. Add the following to `jail.local`:

   ```
   [filebrowser]
   enabled = true
   port = http,https,8080
   filter = filebrowser
   logpath = /config/log/filebrowser/filebrowser.log
   ```
   
3. Map the log file from the filebrowser container so fail2ban can read it.  
