Feature: Funcionalidades de Transferência no App do Banco

  Scenario: Acessar o app do banco
    Given estou com o app aberto
    When logar no app
    Then vejo a home do app

  Scenario: Acessar área de transferência
    Given estou logado no app
    When acessar a área de transferência
    Then vejo a tela de transferência

  Scenario: Realizar transferência para destinatários não cadastrados
    Given estou na tela de transferência
    And dentro do horário permitido das 08:00hs às 20:00hs
    When tentar realizar uma transferência com valor máximo de R$2.000,00
    Then vejo uma mensagem de sucesso

  Scenario: Realizar a transferência para destinatários cadastrados
    Given estou na tela de transferência
    And dentro do horário permitido das 08:00hs às 20:00hs
    When tentar realizar uma transferência com valor máximo de R$5.000,00
    Then vejo uma mensagem de sucesso

  Scenario: Não realizar a transferência para destinatários não cadastrados com valores acima do permitido
    Given estou na tela de transferência
    And dentro do horário permitido das 08:00hs às 20:00hs
    When tentar realizar uma transferência com valor acima de R$2.000,00
    Then vejo uma mensagem de erro

  Scenario: Não realizar transferência para destinatários cadastrados com valores acima do permitido
    Given estou na tela de transferência
    And dentro do horário permitido das 08:00hs às 20:00hs
    When tentar realizar uma transferência com valor acima de R$5.000,00
    Then vejo uma mensagem de erro

  Scenario: Não realizar transferência antes do horário permitido
    Given estou na tela de transferência
    And antes do horário 08:00hs
    When tentar realizar uma transferência
    Then vejo uma mensagem de erro

  Scenario: Não realizar transferência depois do horário permitido
    Given estou na tela de transferência
    And depois do horário 20:00hs
    When tentar realizar uma transferência
    Then vejo uma mensagem de erro

  Scenario: Não realizar transferência sem saldo 
	  Given que não tenho saldo de transferência
	  When tentar realizar uma transferência
	  Then vejo uma mensagem de erro 

# Cenários de validações de inputs do usuário 

  Scenario: Não realizar transferência com entrada de letras
    Given que estou na tela de transferência
    When dentro do horário permitido das 08:00hs às 20:00hs
    Then vejo uma mensagem de erro

  Scenario: Não realizar transferência com entrada de caracteres especiais exceto vírgula e ponto
    Given que estou na tela de transferência
    When dentro do horário permitido das 08:00hs às 20:00hs
    Then vejo uma mensagem de erro
