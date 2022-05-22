# Mealie

[Mealie](https://www.github.com/hay-kot/mealie) is a recipe manager. 

## Install

This installation uses [official images from Docker Hub](https://hub.docker.com/r/hkotel/mealie). Since official images are only available for amd64 and arm64 architectures, this installation will only work on compatible Docker hosts. My attempts to build an arm image failed with some error about Poetry, which I was never able to covercome.

1. Download the docker-compose.yml file to the Docker host.
2. Execute `docker-compose up -d` in the directory where the docker-compose.yml file is located.

## Configure

This image uses the SQLite database. To use Postgres, use the docker-compose.yml provided by the developer.
