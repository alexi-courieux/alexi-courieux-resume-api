import traceback
from fastapi import Request, HTTPException
from fastapi.responses import JSONResponse
from app.core.logging import logger

async def http_exception_handler(request: Request, exc: HTTPException):
    logger.error(f"HTTPException: {exc.status_code} : {exc.detail} - {request.url}")
    return JSONResponse(
        status_code=exc.status_code,
        content={"detail": exc.detail},
    )

async def general_exception_handler(request: Request, exc: Exception):
    stack_trace = traceback.format_exc()
    logger.error(f"Unhandled Exception: {str(exc)} - {request.url}\n{stack_trace}")
    return JSONResponse(
        status_code=500,
        content={"detail": "Internal Server Error"},
    )