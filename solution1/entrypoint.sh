#!/bin/sh
set -e
HUMHUB_DB_NAME=${HUMHUB_DB_NAME:-"humhub"}
HUMHUB_DB_HOST=${HUMHUB_DB_HOST:-"db"}
HUMHUB_DB_PORT=${HUMHUB_DB_PORT:-3306}
HUMHUB_DB_USER=${HUMHUB_DB_USER:-"humhub"}
HUMHUB_DB_PASSWORD=${HUMHUB_DB_PASSWORD:-"humhub"}
HUMHUB_NAME=${HUMHUB_NAME:-"HumHub"}
HUMHUB_EMAIL=${HUMHUB_EMAIL:-"humhub@example.com"}
HUMHUB_LANG=${HUMHUB_LANG:-"en-US"}
HUMHUB_DEBUG=${HUMHUB_DEBUG:-"false"}
HUMHUB_AUTO_INSTALL=${HUMHUB_AUTO_INSTALL:-"1"}

HUMHUB_ADMIN_LOGIN=${HUMHUB_ADMIN_LOGIN:-"admin"}
HUMHUB_ADMIN_EMAIL=${HUMHUB_ADMIN_EMAIL:-"admin@example.com"}
HUMHUB_ADMIN_PASSWORD=${HUMHUB_ADMIN_PASSWORD:-"admin"}

## Setup configuration for php, database...

if [ -z "$HUMHUB_DB_USER" ]; then
    HUMHUB_AUTO_INSTALL="false"
fi

#cd /var/www/localhost/htdocs/protected/ || exit 1
#    php yii migrate/up --includeModuleMigrations=1 --interactive=0

if [ "$HUMHUB_AUTO_INSTALL" != "false" ]; then
# cannot open yii
    #php yii installer/write-db-config "$HUMHUB_DB_HOST" "$HUMHUB_DB_NAME" "$HUMHUB_DB_USER" "$HUMHUB_DB_PASSWORD"
    #php yii installer/install-db
    #php yii installer/write-site-config "$HUMHUB_NAME" "$HUMHUB_EMAIL"	
    #php yii installer/create-admin-account "${HUMHUB_ADMIN_LOGIN}" "${HUMHUB_ADMIN_EMAIL}" "${HUMHUB_ADMIN_PASSWORD}"

    #chown -R nginx:nginx /var/www/localhost/htdocs/protected/runtime
    #chown nginx:nginx /var/www/localhost/htdocs/protected/config/dynamic.php
    echo "Done."
fi

exec "$@"
