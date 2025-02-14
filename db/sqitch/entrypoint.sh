#!/bin/bash

# Read secrets
DB_SUPER_PASSWORD=$(cat $MYSQL_SUPER_PASSWORD_FILE)

# Install dependencies
apt-get update && apt-get install -y sqitch libdbd-mysql-perl default-mysql-client

# Replace placeholders in sqitch.conf with environment variable values
sed -i "s/\$DB_SUPER_USER/$DB_SUPER_USER/g" sqitch.conf
sed -i "s/\$DB_SUPER_PASSWORD/$DB_SUPER_PASSWORD/g" sqitch.conf
sed -i "s/\$DB_HOST/$DB_HOST/g" sqitch.conf
sed -i "s/\$DB_PORT/$DB_PORT/g" sqitch.conf
sed -i "s/\$DB_NAME/$DB_NAME/g" sqitch.conf

ls -la .

# Run Sqitch deploy and verify, revert if it fails
{
    echo "Starting Sqitch deployment..."
    sqitch deploy db:mysql://$DB_SUPER_USER:$DB_SUPER_PASSWORD@$DB_HOST:$DB_PORT/$DB_NAME
    echo "Sqitch deployment completed successfully."
} || {
    echo "Sqitch deployment failed. Reverting changes..."
    sqitch revert
    echo "Sqitch revert completed."
}