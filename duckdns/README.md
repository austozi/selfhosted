# DuckDNS

[DuckDNS](https://duckdns.org) is a free dynamic DNS provider. This docker container will periodically update dynamic IP the address associated with the specified DuckDNS domain, so that the domain name always points to the latest IP address.

## Install

1. Download the docker-compose.yml file to the Docker host.
1. Execute docker-compose up -d from the same directory as the docker-compose.yml file.

## Alternative updater script

The duckdns-updater.sh shell script performs the same function as the DuckDNS container. Use one or the other.

To use the updater script:

1. Save it as /usr/local/bin/duckdns-updater.sh.
2. Edit the script to insert the token and domains. Leave the IP address empty to allow DuckDNS to autodetect the IP address the script is run from.
3. Make the script executable: `sudo chmod +x /usr/local/bin/duckdns-updater.sh`.
4. Create a cron job to execute the script every minute. Execute `sudo crontab -e` to launch the cron editor and append `* * * * * /usr/local/bin/duckdns-updater.sh` to the file. Save the file.
