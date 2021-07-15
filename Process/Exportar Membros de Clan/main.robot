*** Settings ***
Documentation       Processo com o objetivo gerar Chave de API para Utilização de Clash Royale API


Library             ../../Tasks/Logger/Console/Log.py
Resource            Input.robot
Resource            resources.robot

*** Test Cases ***
Extrair Lista de Membros de Clan
    # LogInfo                       Teve um erro aqui         ${PROCESS NAME}
    # LogError                      Teve um erro aqui         ${PROCESS NAME}
    ${Token}                      Pegar Token               ${NameKey}
    Run Keyword If                '${Token}' == 'Key Not Found'    LogError    Key Not Found    ${PROCESS NAME}    ELSE    LogInfo    Token obtido com sucesso    ${PROCESS NAME}
    
    ${LocationID}                 Pegar id da Localidade    ${Pais}        ${Token}
    Run Keyword If                '${LocationID}' == 'Location Not Found'    LogError    Location Not Found    ${PROCESS NAME}    ELSE    LogInfo    Id de Localidade obtido com sucesso    ${PROCESS NAME}
    
    ${TagClan}                    Pegar Tag da Clan         ${ClanName}    ${Token}        ${InitTag}    ${LocationID}    
    Run Keyword If                '${TagClan}' == 'Tag Not Found'    LogError    Tag Not Found    ${PROCESS NAME}    ELSE    LogInfo    Tag do Clan Obtido com sucesso     ${PROCESS NAME}

    ${Members}                    Pesquisar por Membros     ${TagClan}     ${Token}
    Gerar csv com listagem de Membros                       ${Members}     ${OutputPath}    ${NameReport}
    
    LogInfo    Listagem dos Membros do Clan ${ClanName} gerado com sucesso em ${OutputPath}${NameReport}.csv     ${PROCESS NAME}
