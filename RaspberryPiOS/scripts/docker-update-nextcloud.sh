#!/bin/bash -e

################################################################################
# docker-update-nextcloud.sh
# ==========================
# Copyright 2022 austozi.
# Shell script to update the linuxserver/nextcloud container.
# Unlike the official container image, this requires that the application be 
# updated from within the running container itself.
# This script will update the nextcloud application, update database indices,
# and update any Nextcloud apps (add-ons) installed.
# Execute this script on the docker host to run the update.
# Or, schedule a cronjob to automate it.
# ##############################################################################

CONTAINER_NAME=nextcloud

docker exec -u abc -it "$CONTAINER_NAME" php /config/www/nextcloud/updater/updater.phar --no-interaction
docker exec -u abc -it "$CONTAINER_NAME" /config/www/nextcloud/occ db:add-missing-indices --no-interaction
docker exec -u abc -it "$CONTAINER_NAME" /config/www/nextcloud/occ app:update --all --no-interaction
