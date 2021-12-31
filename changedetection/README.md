# changedetection.io

This application monitors changes on websites and sends a notification when it detects a change. For details, refere to the [upstream project on GitHub](https://github.com/dgtlmoon/changedetection.io)

This is a single-user application. It provides a single layer of authentication based on the password alone. It is probably not necessarily to expose this application to the public internet if remote access via a VPN is feasible. However, if HTTPS access is needed, this can be deployed behind a reverse proxy with HTTP basic authentication and fail2ban to thwart brute-force attacks.
