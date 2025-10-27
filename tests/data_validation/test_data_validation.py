import pytest

# ✅ Sample data validation test
def test_data_quality_checks():
    # Example simulated data
    data = [10, 20, 30, 40, 50]

    # Check that data is not empty
    assert len(data) > 0, "Data should not be empty"

    # Check that all values are positive
    assert all(x > 0 for x in data), "All values should be positive"

    # Check that data length matches expected count
    expected_count = 5
    assert len(data) == expected_count, f"Expected {expected_count} rows, got {len(data)}"

# ✅ Add another example test
def test_no_null_values():
    # Example data with no None/null values
    data = [1, 2, 3, 4, 5]
    assert None not in data, "Data contains null values"
