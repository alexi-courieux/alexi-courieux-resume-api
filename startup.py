from fastapi import FastAPI
from a2wsgi import ASGIMiddleware
from app.main import app as fastapi_app

def create_wsgi_app():
    wsgiApi = ASGIMiddleware(fastapi_app)
    return wsgiApi

def start(env, start_response):
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
    uvicorn.run("startup:create_wsgi_app", host="0.0.0.0", port=8000, reload=True)