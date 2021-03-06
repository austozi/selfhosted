# Homer

[Homer](https://github.com/bastienwirtz/homer) is a static homepage for the server. Use it to organise self-hosted apps and services.

## Install

1. Download the docker-compose.yml file to the Docker host.
1. Execute `docker-compose up -d` from the same directory as the docker-compose.yml file.

## Configure

Configurations are done through YAML files. The default is /path/to/homer/config/config.yml. Additional pages can be created by creating additional YAML files, e.g. /path/to/homer/config/work.yml for work-related apps.

See details [here](https://github.com/bastienwirtz/homer/blob/main/docs/configuration.md).
