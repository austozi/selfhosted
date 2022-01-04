#!/bin/bash -e
# This script has been written specifically to work with my specific LAN setup.
# It may not work with yours without some tweaking
TOKEN=
DOMAIN=
IP=$(ip addr | grep -Eo "[0-9.]+/18" | cut -d "/" -f 1 | sed -E "s/inet\s+//")
curl "https://www.duckdns.org/update/$DOMAIN/$TOKEN/$IP"
