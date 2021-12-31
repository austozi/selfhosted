# changedetection.io

This application monitors changes on websites and sends a notification when it detects a change. The docker-compose.yml file includes only a small subset of configuration options relevant to my setup. For more details, refere to the [upstream project on GitHub](https://github.com/dgtlmoon/changedetection.io).

This is a single-user application. It provides a single layer of authentication based on the password alone (i.e. no username). Once the application has been configured, notifications can be received (e.g. via email, Gotify, Telegram, etc.) without needing access to the application settings. Therefore, it is probably not necessary to expose this application to the public internet, if remote access via a VPN is feasible. However, if HTTPS access is needed, the application can be deployed behind a reverse proxy with HTTP basic authentication and fail2ban to thwart brute-force attacks.
