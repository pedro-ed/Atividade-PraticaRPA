*** Settings ***
Documentation       Processo com o objetivo gerar Chave de API para Utilização de Clash Royale API
Library             SeleniumLibrary
Library             ../../Tasks/Sistema/Rede/IP.py
Library             ../../Tasks/APIs/Clash Royale API/KEY/Save.py

Resource            Input.robot
Resource            ../../Tasks/Sites/Clash Royale/Login/resources.robot
Resource            ../../Tasks/Sites/Clash Royale/CreateKey/resources.robot

*** Test Cases ***

Logar na Pagina
    Abrir Browser Para Logar
    Inserir Username    ${Username}
    Inserir Password    ${Password}
    Clicar em Logar
    Verificar Se Logado    

Criar Nova Chave
    ${IP}                          Pegar IP Local
    Acessar Formulario de nova Key
    Inserir KEY NAME               ${KEY NAME}
    Inserir KEY DESCRIPTION        ${KEY DESCRIPTION}
    Inserir IP ADDRESSES           ${IP}
    Clicar em Create Key
    Acessar Key Criada             ${KEY NAME}
    ${KEY TOKEN}                   Pegar Token da Key
    Salvar Key    ${KEY NAME}    ${KEY DESCRIPTION}    ${IP}    ${KEY TOKEN}
    Close Browser
    