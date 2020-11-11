*** Settings ***
Resource         ../resource/Resource.robot
Test Setup       Abrir Navegador
Test Teardown    Fechar Navegador

### SETUP ele roda Keywords antes da suite ou antes de um teste
### TEARDOM ele roda Keywords depois de uma suite de teste

*** Test Case ***
Caso de Teste 01: Pesquisar um produto existente e adicionar no carrinho
    Acessar a página home do site
    Acessar a página de "login"
    Realizar o "login" utilizando o e-mail "renanzsda@gmail.com" e a senha "renan"
    Verificar se o "login" foi realizado com sucesso verificando se o nome do usuário "logado" é "Renan Silva de Araújo"
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão Pesquisar
    Conferir se o produto "Blouse" foi listado no site
    Verificar se o produto está em estoque.
    Selecionar e adicionar o "Blouse" no carrinho de compras
    Verificar se o produto foi adicionado com sucesso no carrinho de compras e acessar o carrinho
    Acessar carrinho de compras e validar dados do "Blouse" com valor unitário de "$27.00" e ir para a próximo etapa
    Verificar endereço
    Verificar entrega
    Selecionar o metodo de pagamento "Pay by bank wire"
    Finalizar pagamento e finalizar processo para o "Pay by bank wire"
    Confirmar pagamento com o valor de "$29.00"

Caso de Teste 02: Pesquisar vários produtos existentes e adiociona-los no carrinho
    Acessar a página home do site
    Acessar a página de "login"
    Realizar o "login" utilizando o e-mail "renanzsda@gmail.com" e a senha "renan"
    Verificar se o "login" foi realizado com sucesso verificando se o nome do usuário "logado" é "Renan Silva de Araújo"
    Digitar o nome do produto "Faded Short Sleeve T-shirts" no campo de pesquisa
    Clicar no botão Pesquisar
    Conferir se o produto "Faded Short Sleeve T-shirts" foi listado no site
    Verificar se o produto está em estoque.
    Selecionar e adicionar o "Faded Short Sleeve T-shirts" no carrinho de compras
    Verificar se o produto foi adicionado com sucesso no carrinho de compras e acessar o carrinho
    Adicionar mais valores para o produto.
    Acessar carrinho de compras e validar dados do "Faded Short Sleeve T-shirts" com valor unitário de "$16.51" e ir para a próximo etapa
    Verificar endereço
    Verificar entrega
    Selecionar o metodo de pagamento "Pay by check"
    Finalizar pagamento e finalizar processo para o "Pay by check"
    Confirmar pagamento com o valor de "$35.02"

Caso de Teste 03: Tentar realizar login com dados inválidos
    Acessar a página home do site
    Acessar a página de "login"
    Realizar o "login" utilizando o e-mail "testefalhar@gmail.com" e a senha "falhou"
    Validar "login" errado



# *** Keywords ***
