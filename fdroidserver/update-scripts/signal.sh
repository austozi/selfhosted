#!/bin/bash -e

# Install dependencies first.
apk add --update --no-cache curl jq &> /dev/null

APPNAME=Signal
echo "Checking updates for $APPNAME..."

version="`curl -sSL 'https://updates.signal.org/android/latest.json' | jq -r .versionName`" &> /dev/null
APKNAME="org.thoughtcrime.securesms_$version.apk"

# Download only if the file doesn't already exist, i.e. a new version is available.
FILE="/config/fdroid/repo/$APKNAME"
if [ ! -f "$FILE" ]; then
	echo "New version available: $version"
	url="`curl -sSL 'https://updates.signal.org/android/latest.json' | jq -r .url`" &> /dev/null
	echo "Downloading from $url..."	
	curl -sSL -o "$FILE" "$url" &> /dev/null
else
	echo "$APPNAME already up to date."
fi
