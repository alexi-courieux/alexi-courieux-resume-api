from sqlalchemy import text
from sqlalchemy.orm import Session
from models.educationModel import EducationModel, EducationI18nModel
from schemas.educationSchema import EducationSchema

def get_educations(db: Session, language: str) -> list[EducationSchema]:
    results = db.query(EducationModel).\
        join(EducationI18nModel).\
        filter(EducationI18nModel.language == language).\
        all()
    
    educations = []
    for result in results:
        i18n = next((i for i in result.i18n if i.language == language), None)
        if i18n:
            educations.append(EducationSchema(
                id=result.id,
                school=i18n.school,
                location=i18n.location,
                degree=i18n.degree,
                startDate=result.startDate,
                endDate=result.endDate,
                imageUri=i18n.imageUri
            ))
    return educations