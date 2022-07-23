# Headless Setup

The following procedure will enable the Raspberry Pi as a headless device.

1. Download the Raspberry Pi OS suitable for the hardware from https://www.raspberrypi.com/software and write it to the SD card (e.g. using the Restore Disk Image command in GNOME Disks).
2. Mount the boot partition of the SD card and and navigate to it on the command line. 
3. Execute the following script as superuser, which enables the SSH server and create a new user account in the Raspberry Pi OS:

    ```
    #!/bin/bash -e
    touch ssh
    read -p "Username: " username
    read -s -p "Password: " password
    password=`echo "$password" | openssl passwd -6 -stdin`
    echo "$username:$password" > ./userconf
    ```
4. Insert the SD card into the Raspberry Pi computer and boot from it.
5. Wait a few seconds, then connect to it from an SSH client.
