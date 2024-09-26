# Invidious

[Invidious](https://github.com/iv-org/invidious) is a YouTube frontend. It allows you to stream YouTube videos without visiting the official YouTube website.

## Install

1. Download docker-compose.yml to a directory on the server, e.g., /docker/invidious/docker-compose.yml.
2. If setting up a fresh instance of Invidious, clone the Invidious source code into ./config/invidious, e.g., `git clone https://github.com/iv-org/invidious /docker/invidious/config/invidious`.
3. Create instance: `docker compose -f /docker/invidious/docker-compose up -d`.
