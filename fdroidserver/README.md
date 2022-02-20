# F-Droid Server

[F-Droid](https://f-droid.org) is an open-source app repository for Android. Think of it as a libre alternative of Google Play Store.

## Build

This image makes use of the `fdroidserver` package maintained by the [Debian project](https://www.debian.org), mainly because I have been unsuccessful at building the package from [source](https://gitlab.com/fdroid/docker-executable-fdroidserver) or installing it [using the Python installer](https://pypi.org/project/fdroidserver/).

To build the image, execute the following in the same directory as Dockerfile:

```
docker build -t austozi/fdroidserver:latest .
```

## Install

Execute the following in the same directory as docker-compose.yml:

```
docker-compose up -d
```
