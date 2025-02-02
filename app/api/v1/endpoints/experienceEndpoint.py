from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app.dependencies import get_db
from app.schemas.experienceSchema import ExperienceSchema
from app.crud.experienceCrud import get_experience

router = APIRouter()
@router.get("/{company}", response_model=ExperienceSchema, responses={404: {"description": "Experience not found"}})
async def read_experience(company: str, db: Session = Depends(get_db)):
    experience = get_experience(db, company)
    if not experience:
        raise HTTPException(status_code=404, detail="Experience not found")
    return experience
