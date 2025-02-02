from pydantic import BaseSettings

class Settings(BaseSettings):
    app_name: str = "Alexi Courieux's Resume API"
    admin_email: str = "contact@alexicourieux.com"
    items_per_page: int = 50

    class Config:
        env_file = ".env"

settings = Settings()