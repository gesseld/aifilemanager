from typing import Optional

from fastapi import APIRouter
from pydantic import BaseModel

api_router = APIRouter()


class HealthResponse(BaseModel):
    status: str
    version: str


@api_router.get("/", tags=["root"])
async def root():
    return {"message": "Welcome to AI Filemanager API"}


@api_router.get("/health", tags=["health"], response_model=HealthResponse)
async def health_check():
    return {"status": "healthy", "version": "1.0.0"}


@api_router.get("/items/{item_id}")
async def read_item(item_id: int, q: Optional[str] = None):
    return {"item_id": item_id, "q": q}
