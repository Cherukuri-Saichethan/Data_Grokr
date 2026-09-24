import pytest
from transform import transform_data

@pytest.fixture
def sample_data():
    return [
        {"id": 1, "name": "Chethan", "email": "chethan@gmail.com"},
        {"id": 2, "name": "Ramesh", "email": "ramesh@gmail.com"}
    ]

def test_transform_columns(sample_data):
    df = transform_data(sample_data)
    assert list(df.columns) == ["id", "name", "email"]

def test_name_uppercase(sample_data):
    df = transform_data(sample_data)
    assert df.iloc[0]["name"] == "CHETHAN"

@pytest.mark.parametrize("name, expected", [
    ("Chethan", "CHETHAN"),
    ("Ramesh", "RAMESH"),
    ("John", "JOHN")
])
def test_uppercase(name, expected):
    df = transform_data([
        {"id": 1, "name": name, "email": "test@gmail.com"}
    ])
    assert df.iloc[0]["name"] == expected