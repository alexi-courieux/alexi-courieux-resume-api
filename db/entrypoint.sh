#!/bin/bash

# Read secrets
DB_PASSWORD=$(cat /run/secrets/mysql_password)
DB_SUPER_PASSWORD=$(cat /run/secrets/mysql_super_password)

# Replace placeholders in init.sql with environment variables
sed -i "s/\${MYSQL_DATABASE}/${DB_NAME}/g" /docker-entrypoint-initdb.d/init.sql
sed -i "s/\${MYSQL_USER}/${DB_USER}/g" /docker-entrypoint-initdb.d/init.sql
sed -i "s/\${MYSQL_PASSWORD}/${DB_PASSWORD}/g" /docker-entrypoint-initdb.d/init.sql
sed -i "s/\${MYSQL_SUPER_USER}/${DB_SUPER_USER}/g" /docker-entrypoint-initdb.d/init.sql
sed -i "s/\${MYSQL_SUPER_PASSWORD}/${DB_SUPER_PASSWORD}/g" /docker-entrypoint-initdb.d/init.sql

exec /usr/local/bin/docker-entrypoint.sh "$@"