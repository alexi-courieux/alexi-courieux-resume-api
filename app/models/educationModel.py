from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class EducationModel(Base):
    __tablename__ = 'EDUCATION'

    id = Column("ID", Integer, primary_key=True)
    startDate = Column("START_DATE", DateTime)
    endDate = Column("END_DATE", DateTime)

    i18n = relationship("EducationI18nModel", back_populates="education")

    def __repr__(self):
        return f"<Education(id='{self.id}', startDate='{self.startDate}', endDate='{self.endDate}')>"

class EducationI18nModel(Base):
    __tablename__ = 'EDUCATION_I18N'

    id = Column("ID", Integer, primary_key=True)
    educationId = Column("EDUCATION_ID" ,String, ForeignKey('EDUCATION.ID'), nullable=False)
    school= Column("SCHOOL", String, nullable=False)
    location = Column("LOCATION", String, nullable=False)
    degree = Column("DEGREE", String, nullable=False)
    language = Column("LANGUAGE", String, nullable=False, default="EN")
    imageUri = Column("IMAGE_URI", String, nullable=True)

    education = relationship("EducationModel", back_populates="i18n")

    def __repr__(self):
        return f"<EducationI18n(id='{self.id}', educationId='{self.educationId}', school='{self.school}', language='{self.language}')>"
    
class EducationSkillModel(Base):
    __tablename__ = 'EDUCATION_SKILL'

    id = Column("ID", Integer, primary_key=True)
    educationId = Column("EDUCATION_ID", String, ForeignKey('EDUCATION.ID'), nullable=False)
    skillId = Column("SKILL_ID", String, ForeignKey('SKILL.ID'), nullable=False)

    def __repr__(self):
        return f"<EducationSkill(id='{self.id}', educationId='{self.educationId}', skillId='{self.skillId}')>"