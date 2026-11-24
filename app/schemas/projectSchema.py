from pydantic import BaseModel
from typing import List, Optional
from datetime import date
from schemas.skillSchema import SkillSchema

class ProjectSummarySchema(BaseModel):
    """Data needed to render a thumbnail card in the portfolio grid."""
    id: str
    title: str
    shortDescription: str
    thumbnailUri: str
    thumbnailAlt: str
    linkUrl: Optional[str] = None
    linkLabel: Optional[str] = None
    projectDate: date
    featured: bool
    skills: List[SkillSchema] = []

    class Config:
        from_attributes = True

class ProjectSchema(ProjectSummarySchema):
    """Full project, including the long description and repository link."""
    description: str
    repositoryUrl: Optional[str] = None
