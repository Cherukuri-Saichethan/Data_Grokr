import pandas as pd

df = pd.read_csv("transactions.csv")

print(df)

print("\nTotal:", df["amount"].sum())

print("\nAverage:", df["amount"].mean())

print("\nBy Type:")
print(df.groupby("type")["amount"].sum())

print("\nBy Category:")
print(df.groupby("category")["amount"].sum())