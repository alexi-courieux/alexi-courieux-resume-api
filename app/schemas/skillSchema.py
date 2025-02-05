from pydantic import BaseModel
from typing import Optional
from datetime import date

class SkillSchema(BaseModel):
    id: str
    name: str
    category: str

    class Config:
        from_attributes = True