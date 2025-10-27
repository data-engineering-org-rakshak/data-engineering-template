# nosec B101


import os
import pandas as pd


def load_data_to_csv(df, file_path):
    df.to_csv(file_path, index=False)


def test_data_is_saved_correctly(tmp_path):
    # Arrange
    file_path = tmp_path / "output.csv"
    data = {"id": [1, 2, 3], "value": [10, 20, 30]}
    df = pd.DataFrame(data)

    # Act
    load_data_to_csv(df, file_path)

    # Assert
    assert os.path.exists(file_path), "CSV file not created"
    loaded_df = pd.read_csv(file_path)
    assert loaded_df.equals(df), "Loaded data does not match original data"

    # ✅ Save a permanent copy for artifacts
    os.makedirs("output", exist_ok=True)
    df.to_csv("output/test_data_output.csv", index=False)
