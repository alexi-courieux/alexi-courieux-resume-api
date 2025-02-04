from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from app.dependencies import get_db
from app.schemas.experienceSchema import ExperienceSchema
from app.crud.experienceCrud import get_experience, get_experiences

router = APIRouter()
@router.get("/{company}", response_model=ExperienceSchema, responses={404: {"description": "Experience not found"}})
async def read_experience(company: str, language: str = Query("EN"), db: Session = Depends(get_db)):
    language = language.upper()
    experience = get_experience(db, company, language)
    if not experience:
        raise HTTPException(status_code=404, detail="Experience not found")
    return experience

@router.get("/", response_model=list[ExperienceSchema])
async def list_experiences(language: str = Query("EN"), db: Session = Depends(get_db)):
    language = language.upper()
    return get_experiences(db, language)
