#!/bin/bash -e

################################################################################
# docker-update-images.sh
# =======================
# Copyright 2022 austozi.
# Shell script to build Docker images and push them to Docker Hub.
# This script requires lastversion on the Docker host. 
# To install, execute on the Docker host: `pip install lastversion`.
################################################################################

# Username on Docker Hub.
# User profile at https://hub.docker.com/u/$DOCKERHUB_USER

DOCKERHUB_USER=austozi

# Function to build a specified image and push it to Docker Hub.
# Do not modify unless you know what you're doing.

build_push() {

	# Fetch/Define parameters.

	local appname=$1 # Name of the application
	local repo_name=$2 # Name of upstream project repo
	local base_dir=$3 # Base folder within the tarball
	local build_context=$4 # Docker build context (commonly ".")
	local build_args=$5 # Docker build arguments (optional)
	local version=`lastversion "$repo_name"` # Latest upstream release version

	# Create the temporary build folder.
	# If one already exists, delete and recreate it 
	# to get rid of outdated files.
	# Also create the source subfolder to extract files into.
	
	local build_dir=./"build-$appname"
	rm -rf "$build_dir"
	mkdir -p "$build_dir"/source

	# Download the source tarball and extract the contents
	# into the source subfolder in the build folder.
	
	lastversion --download "$build_dir"/source.tar.gz "$repo_name"
	tar -C "$build_dir"/source -xzf "$build_dir"/source.tar.gz

	cd "$build_dir"/source/"$base_dir"
	
	# Build and tag the image

	DOCKER_BUILDKIT=1 docker build \
		-t "$DOCKERHUB_USER/$appname:latest" \
		-t "$DOCKERHUB_USER/$appname:$version" \
		$build_args \
		$build_context

	# Push the image to Docker Hub
	
	docker login
	docker push --all-tags "$DOCKERHUB_USER/$appname"
	
	# Remove temporary build folder
	
	cd ../../..
	rm -rf "$build_dir"
}

# Call build_push() below for each Docker image to build.
# Usage:
#   build_push \
#     appname \
#     repo_name \
#     base_dir \
#     build_context \
#     [build_args]

# WebSSH
build_push \
	webssh \
	huashengdun/webssh \
	webssh-`lastversion huashengdun/webssh` \
	.

# Roundcube
build_push \
	roundcubemail \
  roundcube/roundcubemail-docker \
  roundcubemail-docker-`lastversion roundcube/roundcubemail` \
  apache 

# μLogger
build_push \
	ulogger-server \
	bfabiszewski/ulogger-server \
	ulogger-server-`lastversion bfabiszewski/ulogger-server` \
	. \
	"--build-arg DB_DRIVER=sqlite"
	
# Wallabag
build_push \
	wallabag \
	wallabag/docker \
	docker-`lastversion wallabag/docker` \
	.
