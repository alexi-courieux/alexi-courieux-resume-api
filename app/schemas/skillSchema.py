from pydantic import BaseModel
from typing import List
from datetime import date

class SkillSchema(BaseModel):
    id: str
    name: str
    categories: List[str]

    class Config:
        from_attributes = True