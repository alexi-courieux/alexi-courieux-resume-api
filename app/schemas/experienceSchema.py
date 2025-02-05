from pydantic import BaseModel
from typing import Optional
from datetime import date

class ExperienceSchema(BaseModel):
    id: str
    companyName: str
    position: str
    startDate: date
    endDate: Optional[date] = None
    shortDescription: str
    description: str

    class Config:
        from_attributes = True