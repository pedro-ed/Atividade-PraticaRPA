def ExportMembers(ListMembers:list,OutputPath:str,NameReport:str):
    Header = ["nome","level","troféus","papel"]
    Keys = list(dict.keys(ListMembers[0]))
    HeaderStr = ""
    for i in range(len(Header)):HeaderStr+=Header[i]+","
    HeaderStr = HeaderStr[:-1]+"\n"
    lines = HeaderStr
    for Membro in ListMembers:
        line =f"{Membro['Nome']},{Membro['Level']},{Membro['Trofeus']},{Membro['Papel']}\n"
        lines+=line

    with open(OutputPath+NameReport+".csv","w",encoding="utf-8") as file:
        file.write(lines)
