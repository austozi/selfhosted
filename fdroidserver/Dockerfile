FROM debian:bullseye-slim
RUN apt-get -q update
RUN apt-get -y install fdroidserver
RUN apt-get -y install apache2
RUN mkdir -p /var/www/html/fdroid/repo
WORKDIR /var/www/html/fdroid
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
