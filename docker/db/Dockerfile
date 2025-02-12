FROM mysql:8.0

# Define build-time arguments
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_ROOT_PASSWORD_FILE
ARG MYSQL_PASSWORD_FILE

# Set environment variables
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_ROOT_PASSWORD_FILE=${MYSQL_ROOT_PASSWORD_FILE}
ENV MYSQL_PASSWORD_FILE=${MYSQL_PASSWORD_FILE}

# Copy initialization script and entrypoint script
COPY init.sql /docker-entrypoint-initdb.d/
COPY entrypoint.sh /usr/local/bin/

# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Override the default entrypoint
ENTRYPOINT ["entrypoint.sh"]

CMD ["mysqld"]