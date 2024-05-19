*** Settings ***
Resource  ../main.robot    # robotcode: ignore

*** Variables ***
${USUARIO_CORRETO}       standard_user
${SENHA}                 secret_sauce

${CAMPO_NOME}    css=input[data-test="username"] 
${CAMPO_SENHA}   css=input[data-test="password"]
${BOTAO_LOGIN}   css=input[data-test="login-button"]


*** Keywords ***
Prencher os dados do login 
    Input Text      ${CAMPO_NOME}    ${USUARIO_CORRETO}
    Input Text      ${CAMPO_SENHA}   ${SENHA}

Clicar no botão de login
    Click Button    ${BOTAO_LOGIN}

Verificar mensagem de campo obrigatório
    Element Should Be Visible     css=h3[data-test="error"]    Epic sadface: Username is required

Verificar mensagem de usuario bloqueado
    Input Text      ${CAMPO_NOME}    locked_out_user
    Input Text      ${CAMPO_SENHA}   ${SENHA}
    Click Button    ${BOTAO_LOGIN}
    Element Should Be Visible     css=h3[data-test="error"]    Epic sadface: Sorry, this user has been locked out.

