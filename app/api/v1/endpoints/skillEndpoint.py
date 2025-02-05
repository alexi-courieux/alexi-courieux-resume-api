from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from app.dependencies import get_db
from app.crud.skillCrud import get_skills, get_experience_skills
from app.schemas.skillSchema import SkillSchema

router = APIRouter()
@router.get("/{experienceId}", response_model=list[SkillSchema], responses={404: {"description": "Experience not found"}})
async def read_experience(experienceId: str, language: str = Query("EN"), db: Session = Depends(get_db)):
    language = language.upper()
    skills = get_experience_skills(db, experienceId, language)
    if not skills:
        raise HTTPException(status_code=404, detail="No skills found for experience: " + experienceId)
    return skills

@router.get("/", response_model=list[SkillSchema])
async def list_experiences(language: str = Query("EN"), db: Session = Depends(get_db)):
    language = language.upper()
    return get_skills(db, language)
