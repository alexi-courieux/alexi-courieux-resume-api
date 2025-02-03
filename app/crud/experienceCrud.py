from sqlalchemy import text
from sqlalchemy.orm import Session
from app.schemas.experienceSchema import ExperienceSchema

def get_experience(db: Session, company: str, language: str) -> ExperienceSchema:
    sql = text("""
    SELECT e.COMPANY as company, ei18n.COMPANY_NAME as company_name, ei18n.POSITION as position, e.START_DATE as start_date, e.END_DATE as end_date, ei18n.SHORT_DESCRIPTION as short_description, ei18n.DESCRIPTION as description
    FROM EXPERIENCE e
    JOIN EXPERIENCE_I18N ei18n ON e.COMPANY = ei18n.EXPERIENCE_COMPANY
    WHERE e.COMPANY = :company AND ei18n.LANGUAGE = :language
    LIMIT 1
    """)
    result = db.execute(sql, {"company": company, "language": language}).fetchone()
    if result:
        return ExperienceSchema(
            company=result.company,
            companyName=result.company_name,
            position=result.position,
            startDate=result.start_date,
            endDate=result.end_date,
            shortDescription=result.short_description,
            description=result.description
        )
    return None

def get_experiences(db: Session, language: str) -> list[ExperienceSchema]:
    sql = text("""
    SELECT e.COMPANY as company, ei18n.COMPANY_NAME as company_name, ei18n.POSITION as position, e.START_DATE as start_date, e.END_DATE as end_date, ei18n.SHORT_DESCRIPTION as short_description, ei18n.DESCRIPTION as description
    FROM EXPERIENCE e
    JOIN EXPERIENCE_I18N ei18n ON e.COMPANY = ei18n.EXPERIENCE_COMPANY
    WHERE ei18n.LANGUAGE = :language
    """)
    results = db.execute(sql, {"language": language}).fetchall()
    return [ExperienceSchema(
        company=result.company,
        companyName=result.company_name,
        position=result.position,
        startDate=result.start_date,
        endDate=result.end_date,
        shortDescription=result.short_description,
        description=result.description
    ) for result in results]