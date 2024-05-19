*** Settings ***
Resource          ../../resources/main.robot
Test Setup        Dado que eu acesse o Swag Labs
Test Teardown     Fechar o navegador

*** Test Cases ***
Caso de Teste: Realizar login com usuario correto
    Prencher os dados do login 
    Clicar no botão de login
    
