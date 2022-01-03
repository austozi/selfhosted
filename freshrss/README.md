# FreshRSS

[FreshRSS](https://github.com/FreshRSS/FreshRSS) is a news feed aggregator.

## Install

Run `docker-compose up -d`.

### Security

Failed login attempted are logged in the NGINX access log at ./config/log/nginx/access.log, in the following format:

```
1.2.3.4 - - [03/Jan/2022:14:01:52 +0000] "POST /i/?c=auth&a=login HTTP/1.1" 403 2313 "-" "Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101 Firefox/91.0"
```

At the time of writing, NGINX logs the IP address of the reverse proxy instead of the remote client. To log the latter, add the following to the default NGINX site configuration file at ./config/nginx/site-confs/default:

```
# display real ip in nginx logs when connected through reverse proxy via docker network
set_real_ip_from 172.0.0.0/8;
real_ip_header X-Forwarded-For;
```
This step is necessary for fail2ban to correctly identify the remote IP and ban it.
