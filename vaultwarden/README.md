# Vaultwarden

[Vaultwarden](https://github.com/dani-garcia/vaultwarden) is a [Bitwarden](https://www.bitwarden.com)-compatible password management server. It works with the [official Bitwarden clients](https://bitwarden.com/download/).

## Install

To deploy the application, do `docker-compose up -d -f docker-compose.yml`.

The mailer network is used to send email notifications using a private email server. If a public email server is used, the mailer network can be safely removed from the docker-compose.yml file.

## Security

Following deployment, enforce two-factor authentication and disable public internet access to the /admin directory in the web server configuration.

The application log is located in ./config/log/vaultwarden.log. This can be used to formulate the filter for fail2ban. Failed login attempts are logged in the following format:

```
[2021-12-31 17:30:57.948][vaultwarden::api::identity][ERROR] Username or password is incorrect. Try again. IP: 12.34.56.78. Username: user@example.com.
```
