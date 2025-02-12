from sqlalchemy import Column, Date, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class ExperienceModel(Base):
    __tablename__ = 'EXPERIENCE'

    id = Column("ID", String, primary_key=True)
    startDate = Column("START_DATE", Date)
    endDate = Column("END_DATE", Date)

    i18n = relationship("ExperienceI18nModel", back_populates="experience")

    def __repr__(self):
        return f"<Experience(id='{self.id}', startDate='{self.startDate}', endDate='{self.endDate}')>"

class ExperienceI18nModel(Base):
    __tablename__ = 'EXPERIENCE_I18N'

    id = Column("ID", Integer, primary_key=True)
    experienceId = Column("EXPERIENCE_ID" ,String, ForeignKey('EXPERIENCE.ID'))
    position = Column("POSITION", String)
    short_description = Column("SHORT_DESCRIPTION", String)
    description = Column("DESCRIPTION", String)
    companyName = Column("COMPANY_NAME", String)
    language = Column("LANGUAGE", String)

    experience = relationship("ExperienceModel", back_populates="i18n")

    def __repr__(self):
        return f"<ExperienceI18n(id='{self.id}', experienceId='{self.experienceId}', position='{self.position}', language='{self.language}')>"
    
class ExperienceSkillModel(Base):
    __tablename__ = 'EXPERIENCE_SKILL'

    id = Column("ID", Integer, primary_key=True)
    experienceId = Column("EXPERIENCE_ID", String, ForeignKey('EXPERIENCE.ID'))
    skillId = Column("SKILL_ID", String, ForeignKey('SKILL.ID'))

    def __repr__(self):
        return f"<ExperienceSkill(id='{self.id}', experienceId='{self.experienceId}', skillId='{self.skillId}')>"