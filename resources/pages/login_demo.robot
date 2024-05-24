*** Settings ***
Resource  ../main.robot    # robotcode: ignore

*** Variables ***
${USUARIO_CORRETO}       standard_user
${SENHA}                 secret_sauce

${CAMPO_NOME}    css=input[data-test="username"] 
${CAMPO_SENHA}   css=input[data-test="password"]
${BOTAO_LOGIN}   css=input[data-test="login-button"]

${TITULO_TELA_INICIAL}    css=span[data-test="title"]

*** Keywords ***
Dados que eu prencha os dados do login 
    Input Text      ${CAMPO_NOME}    ${USUARIO_CORRETO}
    Input Text      ${CAMPO_SENHA}   ${SENHA}

E clique no botão de login
    Click Button    ${BOTAO_LOGIN}

Entao entro com sucesso no sistema
    Element Should Be Visible    ${TITULO_TELA_INICIAL} 

Dado que eu verifique as mensagens de campo obrigatório
    Click Button    ${BOTAO_LOGIN}
    Element Should Be Visible     css=h3[data-test="error"]    Epic sadface: Username is required
    Input Text      ${CAMPO_NOME}    locked_out_user
    Click Button    ${BOTAO_LOGIN}
    Element Should Be Visible     css=h3[data-test="error"]    Epic sadface: Password is required

Dado que eu verifique a mensagem de usuario bloqueado
    Input Text      ${CAMPO_NOME}    locked_out_user
    Input Text      ${CAMPO_SENHA}   ${SENHA}
    Click Button    ${BOTAO_LOGIN}
    Element Should Be Visible     css=h3[data-test="error"]    Epic sadface: Sorry, this user has been locked out.

