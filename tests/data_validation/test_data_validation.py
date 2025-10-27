import pandas as pd
import pytest


@pytest.fixture
def load_sample_data():
    """Load sample data for validation tests."""
    return pd.read_csv("tests/data_validation/sample_data.csv")


def test_no_missing_values(load_sample_data):
    """Ensure there are no missing/null values."""
    df = load_sample_data
    assert not df.isnull().values.any(), "❌ Data contains missing values!"


def test_no_duplicates(load_sample_data):
    """Ensure there are no duplicate rows."""
    df = load_sample_data
    duplicate_count = df.duplicated().sum()
    assert duplicate_count == 0, f"❌ Found {duplicate_count} duplicate rows!"


def test_expected_columns(load_sample_data):
    """Ensure dataset has correct columns."""
    df = load_sample_data
    expected_columns = {"id", "name", "age", "city"}
    assert set(df.columns) == expected_columns, "❌ Schema mismatch in columns!"


def test_data_types(load_sample_data):
    """Ensure correct data types (age should be numeric)."""
    df = load_sample_data
    assert pd.api.types.is_numeric_dtype(df["age"]), "❌ Age column should be numeric!"
