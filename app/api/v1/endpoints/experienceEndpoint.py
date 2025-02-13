import logging
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from dependencies import get_db
from schemas.experienceSchema import ExperienceSchema
from crud.experienceCrud import get_experience, get_experiences
from core.logging import logger

router = APIRouter()
@router.get("/{company}", response_model=ExperienceSchema, responses={404: {"description": "Experience not found"}})
async def read_experience(company: str, language: str = Query("EN"), db: Session = Depends(get_db)):
    logger.info(f"Reading experience for company: {company}")
    
    language = language.upper()
    experience = get_experience(db, company, language)
    if not experience:
        logger.error(f"404 - Experience not found for company: {company}")
        raise HTTPException(status_code=404, detail="Experience not found")
    return experience

@router.get("/", response_model=list[ExperienceSchema])
async def list_experiences(language: str = Query("EN"), db: Session = Depends(get_db)):
    logger.info("Listing experiences")
    language = language.upper()
    return get_experiences(db, language)
