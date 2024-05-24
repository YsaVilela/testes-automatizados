*** Settings ***
Resource          ../resources/main.robot
Test Setup        Dado que eu acesse o Swag Labs
Test Teardown     Fechar o navegador

*** Test Cases ***
Caso de Teste: Realizar login com usuario correto
    [Tags]    Login
    [Documentation]    É realizado o login com as credenciais corretas
    Dados que eu prencha os dados do login 
    E clique no botão de login
    Entao entro com sucesso no sistema
    
Caso de Teste: Verificar Campo Obrigatório
    [Tags]    Login
    [Documentation]    Campos Inválidos: deve ser apresentado mensagens de campo obrigatório
    Dado que eu verifique as mensagens de campo obrigatório

Caso de Teste: Verificar Usuario bloqueado
    [Tags]    Login
    [Documentation]    Usuário Bloqueado: deve ser apresentado uma mensagem indicando que o usuário está bloqueado
    Dado que eu verifique a mensagem de usuario bloqueado