import requests

def makeApiRequest(url, params=None):
    response = requests.get(url, params=params)
    return response.json()