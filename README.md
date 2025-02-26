# My FastAPI Project

This is a FastAPI project used to serve my resume data. It provides endpoints to access my experience, education, and skills data.

## Project Structure

```
alexi-courieux-resume-api
├── app
│   ├── main.py                        # Entry point of the application
│   ├── api
│   │   └── v1
│   │       └── endpoints              # API endpoints
│   ├── core
│   │   ├── config.py                  # Configuration settings
│   │   ├── exceptionHandler.py        # Custom exception handler
│   │   └── logging.py                 # Logging configuration
│   ├── models                         # Pydantic models for database queries
│   ├── schemas                        # Pydantic schemas for request and response bodies
│   ├── crud.py                        # CRUD operations
│   ├── dependencies.py                # Dependency management
│   ├── Dockerfile                     # Dockerfile for the app
│   ├── __init__.py                    # Init file for the app module
│   ├── requirements.txt               # Project dependencies
│   └── startup.py                     # Application startup script
├── db
│   ├── Dockerfile                     # Dockerfile for the database
│   ├── entrypoint.sh                  # Entrypoint script for the database
│   ├── init.sql                       # Initialization script for the database
│   └── sqitch
│       ├── deploy                     # Sqitch deploy scripts
│       ├── revert                     # Sqitch revert scripts
│       ├── verify                     # Sqitch verify scripts
│       ├── Dockerfile                 # Dockerfile for Sqitch
│       ├── entrypoint.sh              # Entrypoint script for Sqitch
│       ├── sqitch.conf                # Sqitch configuration file
│       └── sqitch.plan                # Sqitch plan file
├── secrets
│   ├── mysql_password.txt             # MySQL password secret
│   ├── mysql_root_password.txt        # MySQL root password secret
│   └── mysql_super_password.txt       # MySQL super user password secret
├── .env                               # Environment variables used by docker-compose
├── .gitignore                         # Git ignore file
├── docker-compose.yml                 # Docker Compose configuration
├── README.md                          # Project documentation
└── .github
    ├── ISSUE_TEMPLATE
    │   ├── bug_report.md              # Bug report template
    │   └── feature_request.md         # Feature request template
    └── workflows
        └── build-deploy.yml           # GitHub Actions workflow for build and deploy
```

## Setup Instructions

1. Clone the repository:
   ```
   git clone <repository-url>
   cd alexi-courieux-resume-api
   ```

2. Install the required dependencies:
   ```
   pip install -r requirements.txt
   ```

3. Create an environment file .env and add the following variables:
   ```
   DB_USER=your_db_username
   DB_HOST=your_db_host
   DB_PORT=your_db_port
   DB_NAME=your_db_name
   ROOT_URL=/ # root URL of the application after the domain, e.g. /api/
   CORS_ORIGIN=http://localhost:* # URL of the consumer application
   ```

4. 1. Run the application (without Docker):
   ```
   ./.venv/Scripts/activate
   python app/startup.py
   ```

4. 2. Run the application (with Docker):
   ```
   docker compose --profile backend up --build
   ```

## Usage

Once the application is running, you can access the API documentation at `http://127.0.0.1:8000`. This will provide you links to interactive interfaces to test the API endpoints (Swagger UI, ReDoc).

## Database migrations

This project uses [Sqitch](https://sqitch.org/) for managing database migrations. Sqitch is a database change management application that allows you to track changes to your database schema in a way that is easy to deploy and rollback.

To trigger the migrations, you can use Docker Compose. Run the following command:
```bash
docker-compose up --profile migrate --build
```

You can also run the Sqitch container separately:
```bash
docker-compose up sqitch
```

This will run the Sqitch container and apply the migrations to the database.
<div style="border: 1px solid #007bff; padding: 10px; border-radius: 5px; background-color:rgb(0, 136, 255);">
  <strong>Info:</strong> Sqitch requires a super user (with the SUPER privilege) to apply the migrations. Make sure to provide the super user password in the <code>secrets/mysql_super_password.txt</code> file.
</div>


## Contributing

Feel free to submit issues or pull requests for any improvements or features you would like to see in this project.