from setuptools import setup, find_packages

setup(
    name="app",
    version="0.1",
    packages=find_packages(),
    install_requires=[
        "fastapi==0.104.*",
        "sqlalchemy==2.0.*",
        "alembic==1.12.*",
        "pydantic==2.5.*",
        "uvicorn[standard]==0.24.*",
        "asyncpg",
        "psycopg2-binary",
        "python-dotenv"
    ],
)