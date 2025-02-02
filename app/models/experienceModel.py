from sqlalchemy import Column, Integer, String, DateTime
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class ExperienceModel(Base):
    __tablename__ = 'EXPERIENCE'

    company = Column(name="COMPANY",type_=String, primary_key=True)
    start_date = Column(name="START_DATE",type_=DateTime, primary_key=True)
    end_date = Column(name="END_DATE",type_=DateTime, primary_key=True)

    def __repr__(self):
        return f"<Experience(company='{self.company}', start_date='{self.start_date}', end_date='{self.end_date}')>"

class ExperienceI18nModel(Base):
    __tablename__ = 'EXPERIENCE_I18N'

    id = Column(name="ID",type_=Integer, primary_key=True)
    company = Column(name="EXPERIENCE_COMPANY",type_=String)
    short_description = Column(name="SHORT_DESCRIPTION",type_=String)
    description = Column(name="DESCRIPTION",type_=String)
    companyName = Column(name="COMPANY_NAME",type_=String)
    language = Column(name="LANGUAGE",type_=String)

    def __repr__(self):
        return f"<ExperienceI18n(id='{self.id}', company='{self.company}', short_description='{self.short_description}', description='{self.description}', companyName='{self.companyName}', language='{self.language}')>"