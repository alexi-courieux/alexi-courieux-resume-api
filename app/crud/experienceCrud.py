from sqlalchemy import text
from sqlalchemy.orm import Session

def get_experience(db: Session, company: str, language: str = "EN"):
    sql = text("""
    SELECT e.COMPANY as company, ei18n.COMPANY_NAME as company_name, ei18n.POSITION as position, e.START_DATE as start_date, e.END_DATE as end_date, ei18n.SHORT_DESCRIPTION as short_description, ei18n.DESCRIPTION as description
    FROM EXPERIENCE e
    JOIN EXPERIENCE_I18N ei18n ON e.COMPANY = ei18n.EXPERIENCE_COMPANY
    WHERE e.COMPANY = :company AND ei18n.LANGUAGE = :language
    LIMIT 1
    """)
    result = db.execute(sql, {"company": company, "language": language}).fetchone()
    return result