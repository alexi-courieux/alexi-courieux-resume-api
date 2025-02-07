from pydantic import BaseModel
from typing import Optional
from datetime import date

class EducationSchema(BaseModel):
    id: int
    school: str
    location: str
    degree: str
    startDate: date
    endDate: Optional[date] = None

    class Config:
        from_attributes = True