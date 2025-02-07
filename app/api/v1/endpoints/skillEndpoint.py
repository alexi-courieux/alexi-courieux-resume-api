from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from app.dependencies import get_db
from app.crud.skillCrud import get_skills, get_experience_skills
from app.schemas.skillSchema import SkillSchema
from app.core.logging import logger
from time import time

router = APIRouter()
@router.get("/{experienceId}", response_model=list[SkillSchema], responses={404: {"description": "No skills found for experience"}})
async def list_skills_experience(experienceId: str, language: str = Query("EN"), db: Session = Depends(get_db)):
    start_time = time()
    logger.info(f"Reading skills for experience: {experienceId}")
    
    language = language.upper()
    skills = get_experience_skills(db, experienceId, language)
    
    duration = time() - start_time
    logger.info(f"Read skills for experience: {experienceId} in {duration:.2f}ms")
    
    if not skills:
        raise HTTPException(status_code=404, detail="No skills found for experience: " + experienceId)
    return skills

@router.get("/", response_model=list[SkillSchema])
async def list_skills(language: str = Query("EN"), db: Session = Depends(get_db)):
    start_time = time()
    logger.info("Listing skills")
    
    language = language.upper()
    skills = get_skills(db, language)
    
    duration = time() - start_time
    logger.info(f"Listed skills in {duration:.2f}ms")
    
    return skills