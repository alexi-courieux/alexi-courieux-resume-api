# My FastAPI Project

This is a FastAPI project that serves as a template for building APIs. It includes a structured layout with separate directories for models, schemas, CRUD operations, and API endpoints.

## Project Structure

```
my-fastapi-project
├── app
│   ├── main.py              # Entry point of the application
│   ├── api
│   │   └── v1
│   │       └── endpoints
│   │           └── xEndpoint.py  # API endpoints for the x resource
│   ├── core
│   │   └── config.py        # Configuration settings
│   ├── models
│   │   └── xModel.py       # Data model for the x resource
│   ├── schemas
│   │   └── xSchema.py       # Pydantic schemas for validation
│   └── crud
│       └── xCrud.py       # CRUD operations for the x resource
├── .env                     # Environment variables
├── startup.py               # Application startup script, capable of handling WSGI and ASGI servers
├── requirements.txt         # Project dependencies
└── README.md                # Project documentation
```

## Setup Instructions

1. Clone the repository:
   ```
   git clone <repository-url>
   cd my-fastapi-project
   ```

2. Install the required dependencies:
   ```
   pip install -r requirements.txt
   ```

3. Create an environment file .env and add the following variables :
   ```
   DB_USERNAME=your_db_username
   DB_PASSWORD=your_db_password
   DB_HOST=your_db_host
   DB_PORT=your_db_port
   DB_NAME=your_db_name
   CORS_ORIGIN=http://localhost:* # URL of the consumer application
   ```
   

3. Run the application (ASGI):
   ```
   ./.venv/Scripts/activate
   python startup.py
   ```

## Usage

Once the application is running, you can access the API documentation at `http://127.0.0.1:8000/docs`. This will provide you with an interactive interface to test the API endpoints.

## Contributing

Feel free to submit issues or pull requests for any improvements or features you would like to see in this project.