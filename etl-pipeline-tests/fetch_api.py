import requests

def fetch_data():
    response = requests.get("https://jsonplaceholder.typicode.com/users")
    return response.json()

for user in fetch_data():
    print(user["name"])