import os
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from a2wsgi import ASGIMiddleware
from app.main import app as fastapi_app

def init_app():
    app = fastapi_app
    # Add CORS middleware
    app.add_middleware(
        CORSMiddleware,
        allow_origins=os.getenv("CORS_ALLOW_ORIGINS", "*"),
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )
    return app

def start_asgi_app():
    app = init_app()
    return app

def create_wsgi_app():
    app = init_app()
    wsgiApi = ASGIMiddleware(app)
    return wsgiApi

def start_wsgi_app(env, start_response):
    app = create_wsgi_app()
    return app(env, start_response)

if __name__ == "__main__":
    import os
    import sys
    from fastapi import FastAPI
    from fastapi.middleware.wsgi import WSGIMiddleware
    from app.main import app as fastapi_app

    # Add the project directory to the sys.path
    sys.path.append(os.path.dirname(os.path.abspath(__file__)))

    # Run the application
    app = create_wsgi_app()
    import uvicorn
    uvicorn.run("startup:start_asgi_app", host="127.0.0.1", port=8000, reload=True, factory=True)