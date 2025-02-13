FROM python:3.9-slim

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD_FILE
ARG DB_HOST
ARG DB_PORT

ENV DB_NAME=${DB_NAME}
ENV DB_USER=${DB_USER}
ENV DB_PASSWORD_FILE=${DB_PASSWORD_FILE}
ENV DB_HOST=${DB_HOST}
ENV DB_PORT=${DB_PORT}

# Set the working directory
WORKDIR /app

# Copy the project files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt


# Run the startup script
CMD ["python", "startup.py"]