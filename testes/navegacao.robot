*** Settings ***
Resource          ../resources/main.robot
Test Setup        Dado que eu acesse o Swag Labs e realize o login correto    # robotcode: ignore
Test Teardown     Fechar o navegador

*** Test Cases ***
Caso de Teste: Realizar Compra Completa de Um Produto
    Adicionar item no carrinho
    Verificar indicação de quantidade de produtos no carrinho é igual a 1
    Visualizar produtos do carrinho
    Verificar se possui um item
    Iniciar finalizacao da compra
    Preencher dados de pagamento
    Verificar resumo da compra
    Validar finalização da compra

Caso de Teste: Realizar Compra Completa de Cinco produtos  
    Adicionar 5 itens no carrinho
    Verificar indicação de quantidade de produtos no carrinho é igual a 5
    Visualizar produtos do carrinho
    Iniciar finalizacao da compra
    Preencher dados de pagamento
    Verificar resumo da compra
    Validar finalização da compra

Caso de Teste: Remover Produto do Carrinho e Retornar a Tela Principal
    Adicionar item no carrinho
    Visualizar produtos do carrinho
    Remover Produto do carrinho
    Retornar a Tela Principal

Caso de Teste: Visualizar Detalhes de Um Produto
    Vizualizar mais detalhes do produto

Caso de Teste: Verificar Validação Dados Obrigatórios de Pagamento
    Visualizar produtos do carrinho
    Iniciar finalizacao da compra
    Preencher dados obrigatórios de pagamento


