from sqlalchemy import text
from sqlalchemy.orm import Session
from app.models.skillModel import SkillModel, SkillI18nModel, SkillCategoryI18nModel, SkillSkillCategoryModel
from app.models.experienceModel import ExperienceSkillModel
from app.schemas.skillSchema import SkillSchema

def get_experience_skills(db: Session, experienceCompany: str, language: str) -> list[SkillSchema]:
    results = db.query(SkillModel.id, SkillI18nModel.name, SkillCategoryI18nModel.name.label('category')).\
        join(SkillI18nModel, SkillModel.id == SkillI18nModel.skillId).\
        join(SkillSkillCategoryModel, SkillModel.id == SkillSkillCategoryModel.skillId).\
        join(SkillCategoryI18nModel, SkillSkillCategoryModel.skillCategoryId == SkillCategoryI18nModel.skillCategoryId).\
        join(ExperienceSkillModel, SkillModel.id == ExperienceSkillModel.skill_id).\
        filter(SkillI18nModel.language == language, SkillCategoryI18nModel.language == language, ExperienceSkillModel.experience_id == experienceCompany).\
        all()
    
    
    if results:
        return [SkillSchema(
            id=result.id,
            name=result.name,
            category=result.category
        ) for result in results]
    return None

def get_skills(db: Session, language: str) -> list[SkillSchema]:
    results = db.query(SkillModel.id, SkillI18nModel.name, SkillCategoryI18nModel.name.label('category')).\
        join(SkillI18nModel, SkillModel.id == SkillI18nModel.skillId).\
        join(SkillSkillCategoryModel, SkillModel.id == SkillSkillCategoryModel.skillId).\
        join(SkillCategoryI18nModel, SkillSkillCategoryModel.skillCategoryId == SkillCategoryI18nModel.skillCategoryId).\
        filter(SkillI18nModel.language == language, SkillCategoryI18nModel.language == language).\
        all()
    return [SkillSchema(
        id=result.id,
        name=result.name,
        category=result.category
    ) for result in results]