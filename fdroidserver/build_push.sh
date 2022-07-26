#!/bin/bash -e

################################################################################
# build_push.sh
# =============
# Copyright 2022 austozi.
# Shell script to build a Docker image of F-Droid server and push it to Docker
# Hub. Depends on the Dockerfile in the same directory.
################################################################################

# Gather facts.
VERSION=2.0.3-1
REPO=austozi/fdroidserver

# Build the image.
docker build -t $REPO:latest -t $REPO:$VERSION .

# Push the image to Docker Hub.
docker login
docker push --all-tags $REPO
