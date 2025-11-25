import os

from sqlmodel import Session, create_engine

DATABASE_URL = os.getenv("DATABASE_URL")
if not DATABASE_URL:
    raise ValueError("DATABASE_URL environment variable is not set")

engine = create_engine(DATABASE_URL)

def get_db():
    with Session(engine) as session:
        yield session

