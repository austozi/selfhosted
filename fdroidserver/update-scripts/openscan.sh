#!/bin/bash -e
apk add --update --no-cache curl &> /dev/null
python3 -m pip install -U lastversion &> /dev/null
version=`lastversion Ethereal-Developers-Inc/OpenScan`
url=https://github.com/Ethereal-Developers-Inc/OpenScan/releases/download/v$version/app-release.apk
echo "Downloading $url..."
curl -sSL -o "/config/fdroid/repo/com.ethereal.openscan_$version.apk" "$url" &> /dev/null
