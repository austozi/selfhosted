# Raspberry Pi OS

This document outlines the procedure for setting up a Raspberry Pi as a headless server for self-hosting.

## Headless setup

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
6. Set the hostname using `raspi-config`.
7. Run the setup script:

    ```
    curl -sSL https://raw.githubusercontent.com/austozi/selfhosted/main/RaspberryPiOS/setup.sh | sudo bash
    ```
## Setting up swap

By default, the SD card image creates a 100 MB swap file. If Raspberry Pi OS is installed on an SD card, it is best to disable swap, as repeated writing to the swap file may reduce the lifespan of the SD card.

To disable swap, execute on the command line:

```
swapoff --all
```

Alternatively, a swap file may be created on an external hard disk. For example, if the hard disk is mounted at /media/external, the following script can be executed (as superuser) to enable a 8 GB swap file on that hard disk:

```
#!/bin/bash -e
swapoff --all
swapfile=/media/external/swap
fallocate -l 8G $swapfile
mkswap $swapfile
chmod 0600 $swapfile
swapon $swapfile
```
This setting may be lost after a reboot. To persist the swap setting, automount the swap file at boot time by adding the following line to /etc/fstab:

```
/media/external/swap    none    swap    sw  0   0
```

Make sure that /media/external is automounted at boot time first.
