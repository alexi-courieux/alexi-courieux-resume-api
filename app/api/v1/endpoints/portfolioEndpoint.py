from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from dependencies import get_db
from schemas.projectSchema import ProjectSchema, ProjectSummarySchema
from crud.projectCrud import get_project, get_projects
from core.logging import logger

router = APIRouter()

@router.get("/{project_id}", response_model=ProjectSchema, responses={404: {"description": "Project not found"}})
async def read_project(project_id: str, language: str = Query("EN"), db: Session = Depends(get_db)):
    logger.info(f"Reading project: {project_id}")

    language = language.upper()
    project = get_project(db, project_id, language)
    if not project:
        logger.error(f"404 - Project not found: {project_id}")
        raise HTTPException(status_code=404, detail="Project not found")
    return project

@router.get("/", response_model=list[ProjectSummarySchema])
async def list_projects(language: str = Query("EN"), db: Session = Depends(get_db)):
    logger.info("Listing projects")
    language = language.upper()
    return get_projects(db, language)
