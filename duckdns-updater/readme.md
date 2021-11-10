# duckdns-updater

1. Save the shell script 'duckdns-update.sh' as /usr/local/bin/duckdns-updater.sh.
2. Edit the script to insert the token and domains.
3. Make the script executable: `chmod +x /usr/local/bin/duckdns-updater.sh`.
4. Create a cron job to execute the script every minute: `* * * * * /usr/local/bin/duckdns-updater.sh`.
