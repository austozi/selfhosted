#!/bin/bash -e
# Docker image build script for ulogger-server
# Upstream project: https://github.com/bfabiszewski/ulogger-server
# This script by austozi

VERSION=1.0
IMAGE=austozi/ulogger-server

URL="https://github.com/bfabiszewski/ulogger-server/archive/refs/tags/v${VERSION}.zip"

echo "Preparing build directory..."
mkdir -p ./build
rm -rf ./build/*

echo "Downloading source..."
wget -O "./build/release-${VERSION}.zip" "$URL"

echo "Extracting source..."
unzip "./build/release-${VERSION}.zip" -d ./build
mv -v "./build/ulogger-server-${VERSION}" "./build/${VERSION}"

echo "Disabling Docker volume creation..."
sed -i s/VOLUME/#VOLUME/ "./build/${VERSION}/Dockerfile"

echo "Building Docker image for SQLite..."
docker build -t $IMAGE:latest -t $IMAGE:$VERSION --build-arg DB_DRIVER=sqlite ./build/${VERSION}

echo "Publishing Docker image..."
docker push --all-tags $IMAGE

echo "Removing build directory..."
rm -rf ./build
