from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)


def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Welcome to AI Filemanager API"}


def test_health():
    response = client.get("/health")
    assert response.status_code == 200
    assert "status" in response.json()
    assert "version" in response.json()


def test_read_item():
    response = client.get("/items/42")
    assert response.status_code == 200
    assert response.json() == {"item_id": 42, "q": None}
