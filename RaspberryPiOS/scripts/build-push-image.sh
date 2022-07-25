#!/bin/bash -e

################################################################################
# build-push-image.sh
# ===================
# Copyright 2022 austozi.
# Shell script to build Docker images and push them to Docker Hub.
# This script requires lastversion on the Docker host. 
# To install, execute on the Docker host: `pip install lastversion`.
################################################################################

# Define/fetch parameters.

DOCKER_BUILD_PATH=~/docker/build

user_repo=$1 # Own Docker Hub repo
upstream_repo=$2 # Name of upstream project repo
base_dir=$3 # Base folder within the tarball
build_context=$4 # Docker build context (commonly ".")
build_args=$5 # Docker build arguments (optional)
version=`lastversion "$upstream_repo"` # Latest upstream version

# Create the temporary build folder.
# If one already exists, delete and recreate it to get rid of outdated files.
# Also create the source subfolder to extract files into.

echo "Building $user_repo..."

rm -rf "$DOCKER_BUILD_PATH"
mkdir -p "$DOCKER_BUILD_PATH"/source

# Download the source tarball and extract the contents into the source subfolder.

lastversion --download "$DOCKER_BUILD_PATH"/source.tar.gz "$upstream_repo"
tar -C "$DOCKER_BUILD_PATH"/source -xzf "$DOCKER_BUILD_PATH"/source.tar.gz

cd "$DOCKER_BUILD_PATH"/source/"$base_dir"

# Build and tag the image.

DOCKER_BUILDKIT=1 docker build \
	-t "$user_repo:latest" \
	-t "$user_repo:$version" \
	$build_args \
	$build_context

# Push the image to Docker Hub.

echo "Pushing $user_repo..."

docker login
docker push --all-tags "$user_repo"

# Remove the temporary build folder.

echo "Cleaning up..."

cd ../../..
rm -rf "$DOCKER_BUILD_PATH"
