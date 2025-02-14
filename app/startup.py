import os
import sys
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from a2wsgi import ASGIMiddleware

# Add the project directory to the sys.path
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from main import app as fastapi_app

# Add CORS middleware
fastapi_app.add_middleware(
    CORSMiddleware,
    allow_origins=os.getenv("CORS_ALLOW_ORIGINS", "*"),
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

def create_wsgi_app():
    wsgi_api = ASGIMiddleware(fastapi_app)
    return wsgi_api

def start_wsgi_app(env, start_response):
    app = create_wsgi_app()
    return app(env, start_response)

if __name__ == "__main__":
    from fastapi.middleware.wsgi import WSGIMiddleware

    # Run the application
    from waitress import serve
    serve(start_wsgi_app, host="0.0.0.0", port=8000)