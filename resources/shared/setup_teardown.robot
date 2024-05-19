*** Settings ***
Resource          ../main.robot

*** Keywords ***
Dado que eu acesse o Swag Labs
    Open Browser    url=https://www.saucedemo.com/    browser=Chrome

Dado que eu acesse o Swag Labs e realize o login correto
    Open Browser    url=https://www.saucedemo.com/    browser=Chrome
    Input Text      css=input[data-test="username"]    standard_user
    Input Text      css=input[data-test="password"]    secret_sauce
    Click Button    css=input[data-test="login-button"]

Fechar o navegador
    Close Browser