#!/bin/bash -e
apk add --update --no-cache curl jq &> /dev/null
version=`curl -sSL 'https://updates.signal.org/android/latest.json' | jq -r .versionName` &> /dev/null
url=`curl -sSL 'https://updates.signal.org/android/latest.json' | jq -r .url` &> /dev/null
echo "Downloading $url..."
curl -sSL -o "/config/fdroid/repo/org.thoughtcrime.securesms_$version.apk" "$url" &> /dev/null
