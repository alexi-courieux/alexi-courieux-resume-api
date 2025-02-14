from sqlalchemy.orm import Session
from models.skillModel import SkillModel, SkillI18nModel, SkillSkillCategoryModel, SkillCategoryI18nModel
from models.experienceModel import ExperienceSkillModel
from schemas.skillSchema import SkillSchema

def get_experience_skills(db: Session, experienceCompany: str, language: str) -> list[SkillSchema]:
    results = db.query(SkillModel.id, SkillI18nModel.name).\
        join(SkillI18nModel, SkillModel.id == SkillI18nModel.skillId).\
        join(ExperienceSkillModel, SkillModel.id == ExperienceSkillModel.skillId).\
        filter(SkillI18nModel.language == language, ExperienceSkillModel.experienceId == experienceCompany).\
        all()
    
    skills = []
    for result in results:
        categories = db.query(SkillCategoryI18nModel.name).\
            join(SkillSkillCategoryModel, SkillCategoryI18nModel.skillCategoryId == SkillSkillCategoryModel.skillCategoryId).\
            filter(SkillSkillCategoryModel.skillId == result.id, SkillCategoryI18nModel.language == language).\
            all()
        category_names = [category.name for category in categories]
        skills.append(SkillSchema(
            id=result.id,
            name=result.name,
            categories=category_names
        ))
    return skills

def get_skills(db: Session, language: str) -> list[SkillSchema]:
    results = db.query(SkillModel.id, SkillI18nModel.name).\
        join(SkillI18nModel, SkillModel.id == SkillI18nModel.skillId).\
        filter(SkillI18nModel.language == language).\
        all()
    
    skills = []
    for result in results:
        categories = db.query(SkillCategoryI18nModel.name).\
            join(SkillSkillCategoryModel, SkillCategoryI18nModel.skillCategoryId == SkillSkillCategoryModel.skillCategoryId).\
            filter(SkillSkillCategoryModel.skillId == result.id, SkillCategoryI18nModel.language == language).\
            all()
        category_names = [category.name for category in categories]
        skills.append(SkillSchema(
            id=result.id,
            name=result.name,
            categories=category_names
        ))
    return skills