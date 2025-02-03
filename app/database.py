import os
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from urllib.parse import quote_plus
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Define the database connection parameters from environment variables
DB_USERNAME = os.getenv("DB_USERNAME")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")

# Print the database connection parameters
print(f"DB_USERNAME: {DB_USERNAME}")
print(f"DB_PASSWORD: {DB_PASSWORD}")
print(f"DB_HOST: {DB_HOST}")
print(f"DB_PORT: {DB_PORT}")
print(f"DB_NAME: {DB_NAME}")
print(f"mysql --host={DB_HOST} --port={DB_PORT} --user={DB_USERNAME} --password={DB_PASSWORD} -D {DB_NAME}")

# Check if the database connection parameters are set
if not DB_USERNAME or not DB_PASSWORD or not DB_HOST or not DB_PORT or not DB_NAME:
    raise ValueError("Database connection parameters are not set")

# URL-encode the password
DB_PASSWORD_ENCODED = quote_plus(DB_PASSWORD)

# Construct the DATABASE_URL
DATABASE_URL = f"mysql+pymysql://{DB_USERNAME}:{DB_PASSWORD_ENCODED}@{DB_HOST}:{DB_PORT}/{DB_NAME}"

engine = create_engine(DATABASE_URL, pool_pre_ping=True)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()