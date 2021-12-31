# BarcodeBuddy

[BarcodeBuddy](https://github.com/Forceu/barcodebuddy) is a companion application to [Grocy](https://github.com/grocy/grocy). The dockerised version repo is [here](https://github.com/Forceu/barcodebuddy-docker). There is also an [Android app](https://f-droid.org/en/packages/de.bulling.barcodebuddyscanner/).

## Install

This application needs to be able to reach the Grocy instance.

To deploy this application, do `docker-compose up -d -f docker-compose.yml`.

The docker-compose.yml file specifies the armhf image because I run this on a Raspberry Pi.
