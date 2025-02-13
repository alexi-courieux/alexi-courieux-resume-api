from fastapi import APIRouter, Depends
from core.logging import logger
from crud.educationCrud import get_educations
from dependencies import get_db
from schemas.educationSchema import EducationSchema
from sqlalchemy.orm import Session


router = APIRouter()

@router.get("/", response_model=list[EducationSchema])
async def list_educations(language: str = "EN", db: Session = Depends(get_db)):
    logger.info("Listing educations")

    language = language.upper()
    return get_educations(db, language)
