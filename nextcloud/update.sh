#!/bin/bash -e
# Save this script as /path/to/nextcloud/cron/update.sh.
# /path/to/nextcloud/ is where docker-compose.yml is.
# Make it executable: chmod +x /path/to/nextcloud/cron/update.sh.
# Invoke this script as a nightly cron job to auto-update Nextcloud.

projectPath="/path/to/nextcloud/"
logFile="$projectPath/cron/update.log"

# Update Nextcloud core application
docker exec -u abc -it nextcloud php /config/www/nextcloud/updater/updater.phar --no-interaction >> $logFile

# Update database
docker exec -u abc -it nextcloud /config/www/nextcloud/occ db:add-missing-indices --no-interaction >> $logFile

# Update Nextcloud apps
docker exec -u abc -it nextcloud /config/www/nextcloud/occ app:update --all --no-interaction >> $logFile
