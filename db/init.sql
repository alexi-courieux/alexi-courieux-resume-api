CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE DATABASE IF NOT EXISTS sqitch;

USE ${MYSQL_DATABASE};

CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT SELECT ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;

CREATE USER '${MYSQL_SUPER_USER}'@'%' IDENTIFIED BY '${MYSQL_SUPER_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_SUPER_USER}'@'%';
GRANT ALL PRIVILEGES ON sqitch.* TO '${MYSQL_SUPER_USER}'@'%';
GRANT SUPER ON *.* TO '${MYSQL_SUPER_USER}'@'%';
FLUSH PRIVILEGES;