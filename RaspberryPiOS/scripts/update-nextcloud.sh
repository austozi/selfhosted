#!/bin/bash -e

################################################################################
# update-nextcloud.sh
# ===================
# Copyright 2022 austozi.
# Shell script to update the linuxserver/nextcloud container.
# Unlike the official container image, this requires that the application be 
# updated from within the running container itself.
# This script will update the nextcloud application, database indices and any
# apps (add-ons) installed.
# Execute this script on the docker host to run the update.
# Or, schedule a cronjob to automate it.
# ##############################################################################

# Set the name of the Nextcloud container here.
CONTAINER_NAME=nextcloud # Default container name

# This script takes a single argument, i.e. $CONTAINER_NAME.
# If one is passed, then make it $CONTAINER_NAME, overriding the default.
if [ -n "$1" ]; then
	CONTAINER_NAME="$1"
fi

# Update the Nextcloud core application.
docker exec -u abc -it "$CONTAINER_NAME" php /config/www/nextcloud/updater/updater.phar --no-interaction

# Update database indices.
docker exec -u abc -it "$CONTAINER_NAME" /config/www/nextcloud/occ db:add-missing-indices --no-interaction

# Update apps (add-ons).
docker exec -u abc -it "$CONTAINER_NAME" /config/www/nextcloud/occ app:update --all --no-interaction
