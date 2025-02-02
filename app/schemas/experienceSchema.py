from pydantic import BaseModel
from typing import Optional
from datetime import date

class ExperienceSchema(BaseModel):
    company: str
    company_name: str
    position: str
    start_date: date
    end_date: Optional[date] = None
    short_description: Optional[str] = None
    description: Optional[str] = None
    

    class Config:
        from_attributes = True