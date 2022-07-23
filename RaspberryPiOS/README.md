# Installation

1. Download the Raspberry Pi OS suitable for the hardware from https://www.raspberrypi.org and write it to the SD card using the Restore Disk Image command in GNOME Disks.
2. Nagivate to the boot partition of the SD card on the command line, and execute the following script as superuser:

```
#!/bin/bash -e
touch ssh
read -p "Username: " username
read -s -p "Password: " password
password=`echo "$password" | openssl passwd -6 -stdin`
echo "$username:$password" > ./userconf
```
