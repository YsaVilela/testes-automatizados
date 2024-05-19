*** Settings ***
Resource          ../../resources/main.robot
Test Setup        Dado que eu acesse o Swag Labs
Test Teardown     Fechar o navegador

*** Test Cases ***
Caso de Teste: Verificar Campo Obrigatório
    Clicar no botão de login
    Verificar mensagem de campo obrigatório

Caso de Teste: Verificar Usuario bloqueado
    Verificar mensagem de usuario bloqueado

