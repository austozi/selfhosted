#!/bin/bash -e
# Docker image build script for roundcubemail
# Upstream project: https://github.com/roundcube/roundcubemail-docker
# This script by austozi
# Build the image (with apache) for the latest release

IMAGE=austozi/roundcubemail

URL="https://github.com/roundcube/roundcubemail-docker/archive/refs/heads/master.zip"

VERSION=$(curl -v "https://github.com/roundcube/roundcubemail/releases/latest" | cut -d '"' -f 2 | cut -d '/' -f 8)

echo "Preparing build directory..."
mkdir -p ./build
rm -rf ./build/*

echo "Downloading source..."
wget -O "./build/release-${VERSION}.zip" "$URL"

echo "Extracting source..."
unzip "./build/release-${VERSION}.zip" -d ./build
mv -v "./build/roundcubemail-docker-master" "./build/${VERSION}"

echo "Building Docker image for SQLite..."
docker build -t $IMAGE:latest -t $IMAGE:$VERSION ./build/${VERSION}/apache

echo "Publishing Docker image..."
docker push --all-tags $IMAGE

echo "Removing build directory..."
rm -rf ./build
