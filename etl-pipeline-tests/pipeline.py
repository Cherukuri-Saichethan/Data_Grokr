from fetch_api import fetch_data
from transform import transform_data
from generator import generate_users

data = fetch_data()

users = generate_users(data)

df = transform_data(list(users))

df.to_csv("users_output.csv", index=False)

print(df)
print("Saved to users_output.csv")