#!/bin/bash -e

# Install dependencies first.
apk add --update --no-cache curl &> /dev/null
python3 -m pip install -U lastversion &> /dev/null

APPNAME=OpenScan
echo "Checking updates for $APPNAME..."

version="`lastversion Ethereal-Developers-Inc/OpenScan`"
APKNAME="com.ethereal.openscan_$version.apk"

# Download only if the file doesn't already exist, i.e. a new version is available.
FILE="/config/fdroid/repo/$APKNAME"
if [ ! -f "$FILE" ]; then
	echo "New version available: $version"
	url="https://github.com/Ethereal-Developers-Inc/OpenScan/releases/download/v$version/app-release.apk"
	echo "Downloading from $url..."	
	curl -sSL -o "$FILE" "$url" &> /dev/null
else
	echo "$APPNAME already up to date."
fi
