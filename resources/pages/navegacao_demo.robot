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

Dado que eu adicione um item no carrinho
    Click Button    ${BOTAO_ADICIONAR_NO_CARRINHO}    
    Element Should Be Visible    css=button[data-test="remove-sauce-labs-backpack"]    Remove

E visualizualize os produtos do carrinho
    Click Element   ${BOTAO_VER_CARRINHO}

E verifique se possui um item
    Element Should Be Visible    css=div[data-test="inventory-item"]

E verifique que a indicação de quantidade de produtos no carrinho é igual a ${Quantidade}
    Element Should Be Visible    css=span[data-test="shopping-cart-badge"]    ${Quantidade}

E inicialize a finalizacao da compra
    Click Button    css=button[data-test="checkout"]

E preencha os dados de pagamento
    ${Nome}         FakerLibrary.First Name
    Input Text      css=input[data-test="firstName"]    ${Nome} 
    ${Sobrenome}    FakerLibrary.Last Name
    Input Text      css=input[data-test="lastName"]     ${Sobrenome} 
    ${CodigoPostal}    FakerLibrary.Postcode
    Input Text      css=input[data-test="postalCode"]   ${CodigoPostal} 
    Click Element   css=input[data-test="continue"]   

E verifique resumo da compra
    Click Button    css=button[data-test="finish"]

Então deve apresentar a mensagem de finalização da compra
    Element Should Be Visible    css=span[data-test="title"]            Checkout: Complete!
    Element Should Be Visible    css=h2[data-test="complete-header"]    Thank you for your order!
    Click Button    css=button[data-test="back-to-products"]

E remova um produto do carrinho
    Click Button    css=button[data-test="remove-sauce-labs-backpack"]
    Page Should Not Contain Element   css=div[data-test="inventory-item"]

Entao retorne a Tela Principal
    Click Button              css=button[data-test="continue-shopping"]
    Wait Until Location Is    https://www.saucedemo.com/inventory.html

Dado que eu selecione para vizualizar mais detalhes do produto
    Click Element    css=div[data-test="inventory-item-name"]

Entao sou redicionado para os detalhes do produto escolhido
    Page Should Contain Element    css=div[data-test="inventory-item"]

Entao validar mensagens de indicacao que os campos sao obrigatorios
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


Dado que eu adicione 5 itens no carrinho
    FOR    ${indice}    ${item}    IN ENUMERATE    @{selecionar_item}
        Click Button    ${item}        
    END

