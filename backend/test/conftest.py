import sys
from pathlib import Path

import pytest
from fastapi.testclient import TestClient

# Add backend directory to Python path
sys.path.insert(0, str(Path(__file__).parent.parent.parent))
from backend.app.main import app


@pytest.fixture
def client():
    return TestClient(app)
