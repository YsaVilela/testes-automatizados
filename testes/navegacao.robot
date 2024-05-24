*** Settings ***
Resource          ../resources/main.robot
Test Setup        Dado que eu acesse o Swag Labs e realize o login correto    # robotcode: ignore
Test Teardown     Fechar o navegador

*** Test Cases ***
Caso de Teste: Realizar Compra Completa de Um Produto
    [Tags]    Compra Completa
    [Documentation]    É realizado uma compra completa de apenas um item 
    Dado que eu adicione um item no carrinho
    E verifique que a indicação de quantidade de produtos no carrinho é igual a 1
    E visualizualize os produtos do carrinho
    E verifique se possui um item
    E inicialize a finalizacao da compra
    E preencha os dados de pagamento
    E verifique resumo da compra
    Então deve apresentar a mensagem de finalização da compra

Caso de Teste: Realizar Compra Completa de Cinco produtos  
    [Tags]    Compra Completa
    [Documentation]    É realizado uma compra completa de cinco item 
    Dado que eu adicione 5 itens no carrinho
    E verifique que a indicação de quantidade de produtos no carrinho é igual a 5
    E visualizualize os produtos do carrinho
    E inicialize a finalizacao da compra
    E preencha os dados de pagamento
    E verifique resumo da compra
    Então deve apresentar a mensagem de finalização da compra

Caso de Teste: Remover Produto do Carrinho e Retornar a Tela Principal
    [Tags]    Funcionalidades do Carrinho
    [Documentation]    É adicionado um produto no carrinho e removido com sucesso
    Dado que eu adicione um item no carrinho
    E visualizualize os produtos do carrinho
    E remova um produto do carrinho
    Entao retorne a Tela Principal

Caso de Teste: Visualizar Detalhes de Um Produto
    [Tags]    Card do Produto
    [Documentation]    Ao clicar no card do produto deve ser exibido seus detalhes
    Dado que eu selecione para vizualizar mais detalhes do produto
    Entao sou redicionado para os detalhes do produto escolhido

Caso de Teste: Verificar Validação Dados Obrigatórios de Pagamento
    [Tags]    Validação Dados do Cliente
    [Documentation]    Ao adicionar os dados no formulário deve ser feito as validaçõs de campo obrigatório em todos
    E visualizualize os produtos do carrinho
    E inicialize a finalizacao da compra
    Entao validar mensagens de indicacao que os campos sao obrigatorios


