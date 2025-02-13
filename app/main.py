import os
from fastapi import FastAPI, HTTPException
from sqlalchemy import text
from app.api.v1.endpoints.experienceEndpoint import router as experience_router
from app.api.v1.endpoints.skillEndpoint import router as skill_router
from app.api.v1.endpoints.educationEndpoint import router as education_router
from app.core.exceptionHandler import general_exception_handler, http_exception_handler
from app.core.database import engine
from fastapi.responses import HTMLResponse
from app.core.logging import log_filename
from app.core.logging import logger

print(f"log file : {log_filename}")

app = FastAPI()

app.include_router(experience_router, prefix="/v1/experience", tags=["experience"])
app.include_router(skill_router, prefix="/v1/skill", tags=["skill"])
app.include_router(education_router, prefix="/v1/education", tags=["education"])

def render_html(title: str, body_content: str) -> str:
    return f"""
    <html>
        <head>
            <title>{title}</title>
            <style>
                body {{
                    font-family: Arial, sans-serif;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                    margin: 0;
                    background-color: #f4f4f9;
                }}
                .container {{
                    text-align: center;
                    background: #fff;
                    padding: 20px;
                    border-radius: 8px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
                ul {{
                    padding: 0;
                }}
                ul li {{
                    margin: 10px 0;
                    font-size: 20px;
                    list-style-type: none;
                }}
                .status {{
                    font-weight: bold;
                }}
                .green {{
                    color: green;
                }}
                .red {{
                    color: red;
                }}
                .yellow {{
                    color: orange;
                }}
                .error {{
                    margin-left: 10px;
                    font-size: 16px;
                }}
            </style>
        </head>
        <body>
            <div class="container">
                {body_content}
            </div>
        </body>
    </html>
    """

@app.get("/", response_class=HTMLResponse, include_in_schema=False)
def root():
    root_url = os.getenv("ROOT_URL", "/")
    body_content = f"""
    <h1>Welcome to the API</h1>
    <a href="{root_url}docs">Swagger UI</a>
    <a href="{root_url}redoc">ReDoc</a>
    """
    return render_html("API Documentation", body_content)

@app.get("/health", response_class=HTMLResponse, include_in_schema=False)
def health_check():
    body_content = f"""
    <h1 class='green'>Application is Running</h1>
    <a href="/health-complete">Complete Health Check</a>
    """
    return render_html("Health Check", body_content)

@app.get("/health-complete", response_class=HTMLResponse, include_in_schema=False)
async def health_check_complete():
    checks = [
        {"name": "Application", "status": "OK", "color": "green"},
    ]

    try:
        # Attempt to execute a simple query to check if the database is reachable
        with engine.connect() as connection:
            connection.execute(text("SELECT 1"))
        checks.append({"name": "Database connection", "status": "OK", "color": "green"})
    except Exception as e:
        logger.error(f"Database connection failed: {e}")
        checks.append({"name": "Database connection", "status": "KO", "color": "red", "error": str(e)})

    all_systems_operational = all(check["status"] == "OK" for check in checks)
    header_message = "ALL Systems Operational" if all_systems_operational else "Some Systems are Partially Operational"

    body_content = f"<h1>{header_message}</h1><ul>"
    for check in checks:
        body_content += f"<li>{check['name']}: <span class='status {check['color']}'>{check['status']}</span></li>"
        if "error" in check:
            body_content += f"<p class='error'>Error: {check['error']}</p>"
    body_content += "</ul>"

    status_code = 200 if all_systems_operational else 500
    return HTMLResponse(content=render_html("Health Check", body_content), status_code=status_code)

app.add_exception_handler(HTTPException, http_exception_handler)
app.add_exception_handler(Exception, general_exception_handler)