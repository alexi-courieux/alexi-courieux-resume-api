#!/bin/bash

# Read secrets
MYSQL_PASSWORD=$(cat /run/secrets/mysql_password)

# Replace placeholders in init.sql with environment variables
sed -i "s/\${MYSQL_DATABASE}/${MYSQL_DATABASE}/g" /docker-entrypoint-initdb.d/init.sql
sed -i "s/\${MYSQL_USER}/${MYSQL_USER}/g" /docker-entrypoint-initdb.d/init.sql
sed -i "s/\${MYSQL_PASSWORD}/${MYSQL_PASSWORD}/g" /docker-entrypoint-initdb.d/init.sql

exec /usr/local/bin/docker-entrypoint.sh "$@"