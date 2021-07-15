import requests
import json

def GetTagbyPart(Name:str,Token:str,InitTag:str,IDLocation:str):
    headers = {
    "Content-Type": "application/json",
    "Authorization": f"Bearer {Token}"
    }
    Name = Name.replace(" ","%20")
    Clans = requests.get(f"https://api.clashroyale.com/v1/clans?name={Name}&locationId={IDLocation}",headers=headers)
    for clan in json.loads(Clans.text)["items"]:
        if InitTag in clan["tag"]:
            # print(clan)
            return clan["tag"]
    return "Tag Not Found"


