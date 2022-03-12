Feature: Autenticação de usuário
  Como cliente da EBAC-SHOP
  Quero autenticar usuário e senha
  Para acessar a página de checkout

  Background:
    Given que eu acesse a página de autenticação do EBAC-SHOP

  Scenario Outline: Autenticar múltiplos usuários
    When eu digitar o <usuario>
    And a <senha>
    Then deve aparecer a mensagem "Olá, <nome>" na página de checkout

    Examples:
      | usuario              | senha        | nome     |
      | adriano@gmail.com    | uG%VZsko%giz | adriano  |
      | fernando@hotmail.com | 3@Zqaj5FqGzm | fernando |
      | carlos@yahoo.com.br  | t&RNur4A$6t4 | carlos   |
      | tiago@gmail.com      | ^tkUMX4kCvnE | tiago    |
      | pedro@outlook.com    | W^bI^#OBDYK^ | pedro    |
      | jose@yahoo.com.br    | qV^3s3@32r9D | jose     |

  Scenario Outline: Usuário inválido
    When eu digitar o <usuario>
    And a <senha>
    Then deve aparecer a <mensagem>

    Examples:
      | usuario             | senha        | mensagem                    |
      | adrianogmail.com    | uG%VZsko%giz | E-mail com formato inválido |
      | invalid@hotmail.com | 3@Zqaj5FqGzm | Usuário inexistente         |

  Scenario Outline: Usuário com senha inválida
    When eu digitar o usuário "adriano@gmail.com"
    And a senha "123@fail"
    Then deve aparecer a mensagem "Usuário ou senha inválidos"
