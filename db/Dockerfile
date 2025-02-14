FROM mysql:8.0

# Define build-time arguments
ARG DB_NAME
ARG DB_USER
ARG DB_SUPER_USER
ARG DB_ROOT_PASSWORD_FILE
ARG DB_PASSWORD_FILE
ARG DB_SUPER_PASSWORD_FILE

# Set environment variables
ENV DB_NAME=${DB_NAME}
ENV DB_USER=${DB_USER}
ENV DB_SUPER_USER=${DB_SUPER_USER}
ENV DB_ROOT_PASSWORD_FILE=${DB_ROOT_PASSWORD_FILE}
ENV DB_PASSWORD_FILE=${DB_PASSWORD_FILE}
ENV DB_SUPER_PASSWORD_FILE=${DB_SUPER_PASSWORD_FILE}

# Copy initialization script and entrypoint script
COPY init.sql /docker-entrypoint-initdb.d/
COPY entrypoint.sh /usr/local/bin/

# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Override the default entrypoint
ENTRYPOINT ["entrypoint.sh"]

CMD ["mysqld"]