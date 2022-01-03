# FreshRSS

[FreshRSS](https://github.com/FreshRSS/FreshRSS) is a news feed aggregator.

## Install

Download the docker-compose.yml to a directory on the Docker host and execute `docker-compose up -d` in the same directory.

## Configuration

### Security

Failed login attempted are logged in the NGINX access log at /path/to/freshrss/config/log/nginx/access.log, in the following format:

```
1.2.3.4 - - [03/Jan/2022:14:01:52 +0000] "POST /i/?c=auth&a=login HTTP/1.1" 403 2313 "-" "Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101 Firefox/91.0"
```
#### Setting up fail2ban

The following steps will configure fail2ban in a SWAG container as the reverse proxy.

1. [Configure](https://github.com/austozi/selfhosted/wiki/Make-container-log-remote-IP) the container to log the IP address of the remote client rather than the reverse proxy.
2. Create a fail2ban filter for FreshRSS at /path/to/swag/config/fail2ban/filter.d/freshrss.local:
    ```
    # /path/to/swag/config/fail2ban/filter.d/freshrss.local
    
    [INCLUDES]
    before      = common.conf
    
    [Definition]
    failregex   = ^<ADDR>.+ 403 [0-9]+
    ignoreregex =
    ```
3. Append the following lines to /path/to/swag/config/fail2ban/jail.local:
    ```
    [freshrss]
    enabled  = true
    port     = http,https
    filter   = freshrss
    logpath  = /config/log/freshrss/access.log
    ```
4. Mount FreshRSS's NGINX access log into the SWAG container, by adding the following to the docker-compose.yml file of the latter:
   ```
   volumes:
     - "/path/to/freshrss/config/log/nginx:/config/log/freshrss:ro"
   ```
5. Recreate the SWAG container by executing `docker-compose up -d` in the directory where the docker-compose.yml for SWAG is located.
6. Verify that fail2ban is working for FreshRSS by executing on the Docker host: `docker exec -it swag fail2ban-client status freshrss`. Simulate a few failed login attempts in the [Tor Browser](https://www.torproject.org/download/) and check that they are captured by fail2ban and the remote IP is banned as expected. 
