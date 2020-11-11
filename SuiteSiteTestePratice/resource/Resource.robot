*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${URL}      http://automationpractice.com/
${BROWSER}  firefox


*** Keywords ***
### Setup e TEARDOM
Abrir Navegador
    Open Browser  about:blank     ${BROWSER}

Fechar Navegador
     Close Browser

###Passo-a-Passo Teste Case 1
Acessar a página home do site
    Go To             http://automationpractice.com/
    Title Should Be   My Store

Acessar a página de "login"
    Click Link        css=html body#index.index.hide-left-column.hide-right-column.lang_en div#page div.header-container header#header div.nav div.container div.row nav div.header_user_info a.login
    Set Selenium Timeout    1000

Realizar o "login" utilizando o e-mail "${email}" e a senha "${senha}"
    Input Text        id=email     ${email}
    Input Password    id=passwd    ${senha}
    Click Element     id=SubmitLogin
    Set Selenium Timeout    1000

Verificar se o "login" foi realizado com sucesso verificando se o nome do usuário "logado" é "${usuario}"
    Page Should Contain    ${usuario}

Digitar o nome do produto "${produto}" no campo de pesquisa
    Input Text    id=search_query_top    ${produto}

Clicar no botão Pesquisar
    Click Element    name=submit_search

Conferir se o produto "${produto}" foi listado no site
    Page Should Contain    Search  "Blouse"
    Page Should Contain    Showing 1

Verificar se o produto está em estoque.
    Page Should Contain    In stock

Selecionar e adicionar o "${produto}" no carrinho de compras
    Wait Until Element Is Visible    css=.ajax_block_product
    Mouse Over    css=.ajax_block_product
    Wait Until Element Is Visible   css=.ajax_add_to_cart_button
    Click Link    css=.ajax_add_to_cart_button

Verificar se o produto foi adicionado com sucesso no carrinho de compras e acessar o carrinho
    Page Should Contain    Product successfully added to your shopping cart
    Page Should Contain    There is 1 item in your cart.
    Page Should Contain    Proceed to checkout
    Wait Until Element Is Visible    css=.btn[title='Proceed to checkout']
    Click Element    css=.btn[title='Proceed to checkout']

Acessar carrinho de compras e validar dados do "${produto}" com valor unitário de "${valor}" e ir para a próximo etapa
    Page Should Contain     ${produto}
    Page Should Contain     In stock
    Page Should Contain     ${valor}
    Wait Until Element Is Visible    css=.standard-checkout[title='Proceed to checkout']
    Click Element    css=.standard-checkout[title='Proceed to checkout']

Verificar endereço
    Page Should Contain     Santos Dumont
    Wait Until Element Is Visible    css=.btn[name='processAddress']
    Click Element    css=.btn[name='processAddress']

Verificar entrega
      Wait Until Element Is Visible    css=.checker
      Page Should Contain Checkbox    id:cgv
      Checkbox Should Not Be Selected    id:cgv
      Select Checkbox    id:cgv
      Checkbox Should Be Selected    id:cgv
      Wait Until Element Is Visible    css=.btn[name="processCarrier"]
      Click Element    css=.btn[name="processCarrier"]

Selecionar o metodo de pagamento "Pay by bank wire"
    Wait Until Element Is Visible    css=.bankwire[title='Pay by bank wire']
    Click Element   css=.bankwire[title='Pay by bank wire']


Finalizar pagamento e finalizar processo para o "Pay by check"
      Wait Until Element Is Visible    css=html body#module-cheque-payment.module-cheque-payment.hide-left-column.hide-right-column.lang_en div#page div.columns-container div#columns.container div.row div#center_column.center_column.col-xs-12.col-sm-12 form p#cart_navigation.cart_navigation.clearfix button.button.btn.btn-default.button-medium span
      Click Element    css=html body#module-cheque-payment.module-cheque-payment.hide-left-column.hide-right-column.lang_en div#page div.columns-container div#columns.container div.row div#center_column.center_column.col-xs-12.col-sm-12 form p#cart_navigation.cart_navigation.clearfix button.button.btn.btn-default.button-medium span

Finalizar pagamento e finalizar processo para o "Pay by bank wire"
      Wait Until Element Is Visible    css=html body#module-bankwire-payment.module-bankwire-payment.hide-left-column.hide-right-column.lang_en div#page div.columns-container div#columns.container div.row div#center_column.center_column.col-xs-12.col-sm-12 form p#cart_navigation.cart_navigation.clearfix button.button.btn.btn-default.button-medium span
      Click Element    css=html body#module-bankwire-payment.module-bankwire-payment.hide-left-column.hide-right-column.lang_en div#page div.columns-container div#columns.container div.row div#center_column.center_column.col-xs-12.col-sm-12 form p#cart_navigation.cart_navigation.clearfix button.button.btn.btn-default.button-medium span

Confirmar pagamento com o valor de "${valor}"
      Page Should Contain    ${valor}
      Page Should Contain    Your order on My Store is complete.

Selecionar o metodo de pagamento "Pay by check"
      Wait Until Element Is Visible    css=.cheque[title="Pay by check."]
      Click Element   css=.cheque[title="Pay by check."]

Adicionar mais valores para o produto.
      Wait Until Element Is Visible    css=.icon-plus
      Click Element     css=.icon-plus

Validar "login" errado
      Page Should Contain    Authentication failed.





###Passo-a-Passo Teste Case 2
