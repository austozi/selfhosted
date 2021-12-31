# BookStack

[BookStack](https://github.com/BookStackApp/BookStack) is a knowledge base application.

## Install

To deploy the application, do `docker-compose up -d -f docker-compose.yml`.

Additional configurations can be specified in ./config/www/.env. To log failed login attempts (e.g. to enable fail2ban), add the following line to the .env file:

```
LOG_FAILED_LOGIN_MESSAGE="Failed login for %u"
```
