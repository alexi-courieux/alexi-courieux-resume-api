from pydantic import BaseModel
from typing import Optional
from datetime import date

class ExperienceSchema(BaseModel):
    company: str
    companyName: str
    position: str
    startDate: date
    endDate: Optional[date] = None
    shortDescription: Optional[str] = None
    description: Optional[str] = None
    

    class Config:
        from_attributes = True