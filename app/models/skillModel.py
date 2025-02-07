from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class SkillModel(Base):
    __tablename__ = 'SKILL'

    id = Column(name="ID",type_=String, primary_key=True)

    def __repr__(self):
        return f"<Skill(id='{self.id}')>"
    
class SkillI18nModel(Base):
    __tablename__ = 'SKILL_I18N'

    id = Column(name="ID",type_=Integer, primary_key=True)
    skillId = Column("SKILL_ID", String, ForeignKey('SKILL.ID'))
    name = Column(name="NAME",type_=String)
    language = Column(name="LANGUAGE",type_=String)

    def __repr__(self):
        return f"<SkillI18n(id='{self.id}', skillId='{self.skillId}', name='{self.name}', language='{self.language}')>"
    
class SkillSkillCategoryModel(Base):
    __tablename__ = 'SKILL_SKILL_CATEGORY'

    id = Column("ID",Integer, primary_key=True)
    skillId = Column("SKILL_ID",String, ForeignKey('SKILL.ID'))
    skillCategoryId = Column("SKILL_CATEGORY_ID",String, ForeignKey('SKILL_CATEGORY.ID'))

    def __repr__(self):
        return f"<SkillSkillCategory(id='{self.id}', skillId='{self.skillId}', skillCategoryId='{self.skillCategoryId}')>"
    
class SkillCategoryModel(Base):
    __tablename__ = 'SKILL_CATEGORY'

    id = Column("ID",String, primary_key=True)

    def __repr__(self):
        return f"<SkillCategory(id='{self.id}')>"
    
class SkillCategoryI18nModel(Base):
    __tablename__ = 'SKILL_CATEGORY_I18N'

    id = Column("ID",Integer, primary_key=True)
    skillCategoryId = Column("SKILL_CATEGORY_ID",String, ForeignKey('SKILL_CATEGORY.ID'))
    name = Column("NAME", String)
    language = Column("LANGUAGE", String)

    def __repr__(self):
        return f"<SkillCategoryI18n(id='{self.id}', skillCategoryId='{self.skillCategoryId}', name='{self.name}', language='{self.language}')>"