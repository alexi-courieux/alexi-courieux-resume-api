from fastapi import FastAPI
from app.api.v1.endpoints.experienceEndpoint import router as experience_router
from app.database import engine, Base
from fastapi.responses import HTMLResponse

# Create the database tables
Base.metadata.create_all(bind=engine)

app = FastAPI()

app.include_router(experience_router, prefix="/v1/experience", tags=["experience"])

@app.get("/", response_class=HTMLResponse, include_in_schema=False)
def root():
    return """
    <html>
        <head>
            <title>API Documentation</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                    margin: 0;
                }
                .container {
                    text-align: center;
                }
                a {
                    display: block;
                    margin: 10px 0;
                    font-size: 20px;
                    text-decoration: none;
                    color: #007bff;
                }
                a:hover {
                    text-decoration: underline;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <h1>Welcome to the API</h1>
                <a href="/docs">Swagger UI</a>
                <a href="/redoc">ReDoc</a>
            </div>
        </body>
    </html>
    """