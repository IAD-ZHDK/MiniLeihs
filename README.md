# MiniLeihs

**Our homebrew material borrowing tracking system.**

## Environment

```
SHOP_NAME
APP_HOST
MONGO_URL
REDIS_URL
SMTP_USER
SMTP_PASSWORD
MAIL_SENDER
PASSWORD_ADMIN
PASSWORD_TERMINAL
FIRST_NOTIFICATION
NOTIFY_INTERVAL
```

## Installation MacOS

How to deploy:

[Dokku Application Deployment](https://dokku.com/docs/deployment/application-deployment/)


Fixing v8 install issues on Big Sur:

```bash
brew install v8 v8@3.15
bundle config build.libv8 --with-system-v8
bundle config build.therubyracer --with-v8-dir=/usr/local/opt/v8@3.15
bundle update libv8 therubyracer
```

Compile App

```bash
bundle install
rake assets:precompile
```