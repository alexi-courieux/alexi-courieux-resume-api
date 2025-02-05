from sqlalchemy import text
from sqlalchemy.orm import Session
from app.models.experienceModel import ExperienceI18nModel, ExperienceModel
from app.schemas.experienceSchema import ExperienceSchema

def get_experience(db: Session, company: str, language: str) -> ExperienceSchema:
    result = db.query(ExperienceModel).\
        join(ExperienceI18nModel).\
        filter(ExperienceModel.id == company, ExperienceI18nModel.language == language).\
        first()
    
    if result:
        i18n = next((i for i in result.i18n if i.language == language), None)
        if i18n:
            return ExperienceSchema(
                id=result.id,
                companyName=i18n.companyName,
                position=i18n.position,
                startDate=result.start_date,
                endDate=result.end_date,
                shortDescription=i18n.short_description,
                description=i18n.description
            )
    return None

def get_experiences(db: Session, language: str) -> list[ExperienceSchema]:
    results = db.query(ExperienceModel).\
        join(ExperienceI18nModel).\
        filter(ExperienceI18nModel.language == language).\
        all()
    
    experiences = []
    for result in results:
        i18n = next((i for i in result.i18n if i.language == language), None)
        if i18n:
            experiences.append(ExperienceSchema(
                id=result.id,
                companyName=i18n.companyName,
                position=i18n.position,
                startDate=result.start_date,
                endDate=result.end_date,
                shortDescription=i18n.short_description,
                description=i18n.description
            ))
    return experiences