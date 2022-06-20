# Linkding

[Linkding](https://github.com/sissbruecker/linkding) is a bookmarking app.

## Install

This installation uses the Docker container images released by upstream. It requires [Docker](https://docs.docker.com/) and [Docker Compose](https://docs.docker.com/compose).

1. Download docker-compose.yml to the server and edit it to suit the deployment environment.
2. Navigate to the directory where docker-compose.yml is and run docker-compose up -d in the terminal. A configuration folder will be created in the same directory as docker-compose.yml to persist the application data.

Upon first launch, create a superuser:

```
docker exec -it linkding python manage.py createsuperuser --username=admin --email=admin@example.com
```
