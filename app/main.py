import os
from fastapi import FastAPI, HTTPException
from pydantic import conset
from app.api.v1.endpoints.experienceEndpoint import router as experience_router
from app.api.v1.endpoints.skillEndpoint import router as skill_router
from app.api.v1.endpoints.educationEndpoint import router as education_router
from app.core.exceptionHandler import general_exception_handler, http_exception_handler
from app.core.database import engine, Base
from fastapi.responses import HTMLResponse
from app.core.logging import log_filename

print (f"log file : {log_filename}")

# Create the database tables
Base.metadata.create_all(bind=engine)

app = FastAPI()

app.include_router(experience_router, prefix="/v1/experience", tags=["experience"])
app.include_router(skill_router, prefix="/v1/skill", tags=["skill"])
app.include_router(education_router, prefix="/v1/education", tags=["education"])

@app.get("/", response_class=HTMLResponse, include_in_schema=False)
def root():

    root_url = os.getenv("ROOT_URL", "/")

    return f"""
    <html>
        <head>
            <title>API Documentation</title>
            <style>
                body {{
                    font-family: Arial, sans-serif;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                    margin: 0;
                }}
                .container {{
                    text-align: center;
                }}
                a {{
                    display: block;
                    margin: 10px 0;
                    font-size: 20px;
                    text-decoration: none;
                    color: #007bff;
                }}
                a:hover {{
                    text-decoration: underline;
                }}
            </style>
        </head>
        <body>
            <div class="container">
                <h1>Welcome to the API</h1>
                <a href="{root_url}docs">Swagger UI</a>
                <a href="{root_url}redoc">ReDoc</a>
            </div>
        </body>
    </html>
    """
    
app.add_exception_handler(HTTPException, http_exception_handler)
app.add_exception_handler(Exception, general_exception_handler)