# FreshRSS

[FreshRSS](https://github.com/FreshRSS/FreshRSS) is a news feed aggregator.

## Install

Download the docker-compose.yml to a directory on the Docker host and execute `docker-compose up -d` in the same directory.

### Security

Failed login attempted are logged in the NGINX access log at ./config/log/nginx/access.log, in the following format:

```
1.2.3.4 - - [03/Jan/2022:14:01:52 +0000] "POST /i/?c=auth&a=login HTTP/1.1" 403 2313 "-" "Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101 Firefox/91.0"
```

At the time of writing, the NGINX instance included in the Docker image logs the IP address of the reverse proxy instead of the remote client. To log the latter, add the following to the default NGINX site configuration file at ./config/nginx/site-confs/default:

```
# capture IP address of remote client
set_real_ip_from 172.0.0.0/8;
real_ip_header X-Forwarded-For;
```
This addition is necessary for fail2ban to correctly identify the remote IP and ban it in case of repeated failed login attempts.

#### Setting up fail2ban

The following steps are designed to be used with a SWAG container as the reverse proxy. Fail2ban is implemented by default in the SWAG image, but needs to be configured for FreshRSS.

1. Create a fail2ban filter for FreshRSS at /path/to/swag/config/fail2ban/filter.d/freshrss.local:
    ```
    # /path/to/swag/config/fail2ban/filter.d/freshrss.local
    
    [INCLUDES]
    before      = common.conf
    
    [Definition]
    failregex   = ^<ADDR>.+ 403 [0-9]+
    ignoreregex =
    ```
2. Append the following lines to /path/to/swag/config/fail2ban/jail.local:
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
5. Recreate the SWAG container to take effect by executing `docker-compose up -d` in the directory where the docker-compose.yml for SWAG is located.
