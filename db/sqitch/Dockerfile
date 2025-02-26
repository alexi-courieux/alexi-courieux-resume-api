FROM perl:5.41.8-slim

ARG DB_HOST
ARG DB_PORT
ARG DB_NAME
ARG DB_SUPER_USER
ARG MYSQL_SUPER_PASSWORD_FILE

ENV DB_HOST=${DB_HOST}
ENV DB_PORT=${DB_PORT}
ENV DB_NAME=${DB_NAME}
ENV DB_SUPER_USER=${DB_SUPER_USER}
ENV MYSQL_SUPER_PASSWORD_FILE=${MYSQL_SUPER_PASSWORD_FILE}

# Install dependencies
RUN apt-get update && \
    apt-get install sqitch libdbd-sqlite3-perl sqlite3 dos2unix -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /sqitch

# Copy the Sqitch configuration and migration files
COPY sqitch.conf sqitch.plan /sqitch/
COPY deploy /sqitch/deploy/
COPY revert /sqitch/revert/
COPY verify /sqitch/verify/

COPY entrypoint.sh /usr/local/bin/
RUN dos2unix /usr/local/bin/entrypoint.sh && chmod +x /usr/local/bin/entrypoint.sh && \
    chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]