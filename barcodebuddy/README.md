# BarcodeBuddy

[BarcodeBuddy](https://github.com/Forceu/barcodebuddy) is a companion application to [Grocy](https://github.com/grocy/grocy) designed to retrieve product information quickly based on the barcode. The source for the dockerised version is available [here](https://github.com/Forceu/barcodebuddy-docker). There is also an [Android app](https://github.com/Forceu/barcodebuddy-android).

## Install

This application needs to be able to reach the Grocy instance, either via the public internet or via an internal network.

1. Download the docker-compose.yml file to the Docker host.
2. Execute `docker-compose up -d` from the same directory as the docker-compose.yml file.

:information_source: The docker-compose.yml file specifies the ARM image by default. Adjust the image tag accordingly for other architectures.

## Configuration

This application needs to be configured manually on first use. To configure the instance, navigate to the application in the web browser (e.g. https://barcodebuddy.example.com) and follow the on-screen instructions. This only needs to be done once.

:information_source: **Notes**:

1. The Grocy instance URL needs to include /api/ at the end (e.g. https://grocy.example.com/api/).
2. Get the API token from the Grocy instance, under the 'Manage API keys' menu.

### fail2ban

These steps will set up [fail2ban](https://github.com/austozi/selfhosted/wiki/fail2ban) using the [SWAG](https://github.com/austozi/selfhosted/tree/main/swag) container as the reverse proxy.

1. Copy [the relevant filter definition](https://github.com/austozi/selfhosted/tree/main/swag/config/fail2ban/filter.d) to the /path/to/swag/config/fail2ban/filter.d/ on the Docker host.
2. Append the relevant jail to /path/to/swag/config/fail2ban/jail.local.
3. Mount the relevant log directory into the SWAG container in the docker-compose.yml file for SWAG.
    ```
    volumes:
      - "../barcodebuddy/config/log/nginx:/config/log/barcodebuddy:ro"
    ```
5. Recreate the SWAG container by running `docker-compose up -d` in the same directory as the docker-compose.yml file for SWAG.
