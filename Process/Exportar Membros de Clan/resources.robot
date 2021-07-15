*** Settings ***
Documentation            Keywords do processo Exportar Membros de Clan
Library             ../../Tasks/APIs/Clash Royale API/KEY/GetKey.py
Library             ../../Tasks/APIs/Clash Royale API/Locations/GetMyLocation.py
Library             ../../Tasks/APIs/Clash Royale API/Clans/Get.py
Library             ../../Tasks/APIs/Clash Royale API/Clans/Members/GetMembers.py
Library             ../../Tasks/APIs/Clash Royale API/Clans/Members/Export.py

*** Keywords ***
Pegar Token
    [Arguments]           ${NameKey}
    ${Token}              GetToken        ${NameKey}
    [Return]              ${Token}

Pegar id da Localidade
    [Arguments]           ${Pais}         ${Token}        
    ${LocationID}         GetMyLocation   ${Pais}       ${Token}
    [Return]              ${LocationID}

Pegar Tag da Clan
    [Arguments]           ${ClanName}    ${Token}       ${InitTag}      ${LocationID}
    ${TagClan}            GetTagbyPart   ${ClanName}    ${Token}        ${InitTag}    ${LocationID}
    [Return]              ${TagClan}

Pesquisar por Membros
    [Arguments]           ${TagClan}    ${Token}
    ${Members}            GetMembers    ${TagClan}       ${Token}
    [Return]              ${Members}

Gerar csv com listagem de Membros
    [Arguments]           ${Members}     ${OutputPath}    ${NameReport}        
    ExportMembers         ${Members}     ${OutputPath}    ${NameReport}


