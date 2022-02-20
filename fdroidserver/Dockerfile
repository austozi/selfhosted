FROM debian:bullseye-slim
RUN apt-get update
RUN apt-get -yy install fdroidserver
RUN mkdir -p /fdroid/repo
WORKDIR /fdroid
CMD ["fdroid", "--help"]
