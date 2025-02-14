import os
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from urllib.parse import quote_plus
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv(override=True)


# Define the database connection parameters from environment variables
DB_USER = os.getenv("DB_USER")
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")
DB_PASSWORD_FILE = os.getenv("DB_PASSWORD_FILE")
if DB_PASSWORD_FILE:
    with open(DB_PASSWORD_FILE, 'r') as file:
        DB_PASSWORD = file.read().strip()
else:
    DB_PASSWORD = os.getenv("DB_PASSWORD")
    if not DB_PASSWORD:
        print("DB_PASSWORD_FILE not set, using DB_PASSWORD")

# Check if the database connection parameters are set
missing_params = []
if not DB_USER:
    missing_params.append("DB_USER")
if not DB_HOST:
    missing_params.append("DB_HOST")
if not DB_PORT:
    missing_params.append("DB_PORT")
if not DB_NAME:
    missing_params.append("DB_NAME")
if not DB_PASSWORD:
    missing_params.append("DB_PASSWORD")
if missing_params:
    raise ValueError(f"Database connection parameters are not set: {', '.join(missing_params)}")

# Construct the DATABASE_URL
DATABASE_URL = f"mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"

engine = create_engine(DATABASE_URL, pool_pre_ping=True)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()