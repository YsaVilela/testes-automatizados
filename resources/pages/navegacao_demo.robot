*** Settings ***
Resource  ../main.robot    # robotcode: ignore

*** Variables ***
${BOTAO_ADICIONAR_NO_CARRINHO}    css=button[data-test="add-to-cart-sauce-labs-backpack"]
${BOTAO_VER_CARRINHO}             css=a[data-test="shopping-cart-link"]
${CAMPO_NOME_ITEM}                css=div[data-test="inventory-item-name"]

@{selecionar_item}
...       css=button[data-test="add-to-cart-sauce-labs-backpack"]
...       css=button[data-test="add-to-cart-sauce-labs-bike-light"]
...       css=button[data-test="add-to-cart-sauce-labs-bolt-t-shirt"]
...       css=button[data-test="add-to-cart-sauce-labs-fleece-jacket"]
...       css=button[data-test="add-to-cart-sauce-labs-onesie"]

*** Keywords ***

Adicionar item no carrinho
    Click Button    ${BOTAO_ADICIONAR_NO_CARRINHO}    
    Element Should Be Visible    css=button[data-test="remove-sauce-labs-backpack"]    Remove

Visualizar produtos do carrinho
    Click Element   ${BOTAO_VER_CARRINHO}

Verificar se possui um item
    Element Should Be Visible    css=div[data-test="inventory-item"]

Verificar indicação de quantidade de produtos no carrinho é igual a 1
    Element Should Be Visible    css=span[data-test="shopping-cart-badge"]    1

Verificar indicação de quantidade de produtos no carrinho é igual a 5
    Element Should Be Visible    css=span[data-test="shopping-cart-badge"]    5

Iniciar finalizacao da compra
    Click Button    css=button[data-test="checkout"]

Preencher dados de pagamento
    ${Nome}         FakerLibrary.First Name
    Input Text      css=input[data-test="firstName"]    ${Nome} 
    ${Sobrenome}    FakerLibrary.Last Name
    Input Text      css=input[data-test="lastName"]     ${Sobrenome} 
    ${CodigoPostal}    FakerLibrary.Postcode
    Input Text      css=input[data-test="postalCode"]   ${CodigoPostal} 
    Click Element   css=input[data-test="continue"]   

Verificar resumo da compra
    Click Button    css=button[data-test="finish"]

Validar finalização da compra
    Element Should Be Visible    css=span[data-test="title"]            Checkout: Complete!
    Element Should Be Visible    css=h2[data-test="complete-header"]    Thank you for your order!
    Capture Page Screenshot      prints/selenium-screenshot-{index}.png
    Click Button    css=button[data-test="back-to-products"]

Remover Produto do carrinho
    Click Button    css=button[data-test="remove-sauce-labs-backpack"]
    Page Should Not Contain Element   css=div[data-test="inventory-item"]

Retornar a Tela Principal
    Click Button              css=button[data-test="continue-shopping"]
    Wait Until Location Is    https://www.saucedemo.com/inventory.html

Vizualizar mais detalhes do produto
    Click Element    css=div[data-test="inventory-item-name"]
    Page Should Contain Element    css=div[data-test="inventory-item"]

Preencher dados obrigatórios de pagamento
    Click Element   css=input[data-test="continue"]   
    Element Should Be Visible    css=h3[data-test="error"]    Error: First Name is required
    ${Nome}         FakerLibrary.First Name
    Input Text      css=input[data-test="firstName"]    ${Nome} 
    Click Element   css=input[data-test="continue"]   
    Element Should Be Visible    css=h3[data-test="error"]    Error: Last Name is required
    ${Sobrenome}    FakerLibrary.Last Name
    Input Text      css=input[data-test="lastName"]     ${Sobrenome} 
    Click Element   css=input[data-test="continue"]   
    Element Should Be Visible    css=h3[data-test="error"]    Error: Postal Code is required


Adicionar 5 itens no carrinho
    FOR    ${indice}    ${item}    IN ENUMERATE    @{selecionar_item}
        Click Button    ${item}        
    END

