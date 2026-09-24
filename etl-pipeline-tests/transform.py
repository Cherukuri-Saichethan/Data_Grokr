import pandas as pd

def transform_data(data):
    df = pd.DataFrame(data)
    df = df[["id", "name", "email"]]
    df["name"] = df["name"].str.upper()
    return df