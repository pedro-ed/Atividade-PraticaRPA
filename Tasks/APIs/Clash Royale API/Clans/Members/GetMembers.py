import requests
import json

def GetMembers(TagClan:str,Token:str):
    headers = {
    "Content-Type": "application/json",
    "Authorization": f"Bearer {Token}"
    }
    TagClanUrl = TagClan.replace("#","%23")
    Membros = requests.get(f"https://api.clashroyale.com/v1/clans/{TagClanUrl}/members",headers=headers)
    MembersInfos = []
    for membro in json.loads(Membros.text)["items"]:
        nome = membro["name"]
        level = membro["expLevel"]
        trofeus = membro["trophies"]
        papel = membro["role"]
        MembersInfos.append({
            "Nome":nome,
            "Level":level,
            "Trofeus":trofeus,
            "Papel":papel
        })
    return MembersInfos

    