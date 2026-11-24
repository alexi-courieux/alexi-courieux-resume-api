from sqlalchemy import Boolean, Column, Date, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class ProjectModel(Base):
    __tablename__ = 'PROJECT'

    id = Column("ID", String, primary_key=True)
    linkUrl = Column("LINK_URL", String, nullable=True)
    repositoryUrl = Column("REPOSITORY_URL", String, nullable=True)
    projectDate = Column("PROJECT_DATE", Date, nullable=False)
    displayOrder = Column("DISPLAY_ORDER", Integer, nullable=False, default=0)
    featured = Column("FEATURED", Boolean, nullable=False, default=False)

    i18n = relationship("ProjectI18nModel", back_populates="project")

    def __repr__(self):
        return f"<Project(id='{self.id}', projectDate='{self.projectDate}')>"

class ProjectI18nModel(Base):
    __tablename__ = 'PROJECT_I18N'

    id = Column("ID", Integer, primary_key=True)
    projectId = Column("PROJECT_ID", String, ForeignKey('PROJECT.ID'))
    language = Column("LANGUAGE", String)
    title = Column("TITLE", String)
    shortDescription = Column("SHORT_DESCRIPTION", String)
    description = Column("DESCRIPTION", String)
    linkLabel = Column("LINK_LABEL", String, nullable=True)
    thumbnailUri = Column("THUMBNAIL_URI", String, nullable=False)
    thumbnailAlt = Column("THUMBNAIL_ALT", String, nullable=False)

    project = relationship("ProjectModel", back_populates="i18n")

    def __repr__(self):
        return f"<ProjectI18n(id='{self.id}', projectId='{self.projectId}', title='{self.title}', language='{self.language}')>"

class ProjectSkillModel(Base):
    __tablename__ = 'PROJECT_SKILL'

    id = Column("ID", Integer, primary_key=True)
    projectId = Column("PROJECT_ID", String, ForeignKey('PROJECT.ID'))
    skillId = Column("SKILL_ID", String, ForeignKey('SKILL.ID'))

    def __repr__(self):
        return f"<ProjectSkill(id='{self.id}', projectId='{self.projectId}', skillId='{self.skillId}')>"
