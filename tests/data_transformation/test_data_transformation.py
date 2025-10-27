# nosec B101


import pandas as pd


def transform_data(df):
    # Example transformation logic
    df = df.drop_duplicates()
    df["total"] = df["price"] * df["quantity"]
    return df


def test_remove_duplicates():
    data = {"price": [10, 10], "quantity": [1, 1]}
    df = pd.DataFrame(data)
    transformed_df = transform_data(df)
    # Expect only one row after removing duplicates
    assert len(transformed_df) == 1


def test_total_column_created():
    data = {"price": [10, 20], "quantity": [2, 3]}
    df = pd.DataFrame(data)
    transformed_df = transform_data(df)
    # Check if total column exists and is correct
    assert "total" in transformed_df.columns
    assert transformed_df["total"].tolist() == [20, 60]
