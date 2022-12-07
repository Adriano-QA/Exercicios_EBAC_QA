Feature: Tela de cadastro - Checkout
  Como cliente da EBAC-SHOP
  Quero fazer concluir meu cadastro
  Para finalizar minha compra

  Scenario Outline: Todos os campos obrigatórios corretos
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <pais>
    And digitar <endereco>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <endereco de e-mail>
    Then deve aparecer a mensagem "Deseja finalizar a compra?"

    Examples:
      | nome    | sobrenome | pais   | endereco                 | cidade     | cep       | telefone       | endereco de e-mail           |
      | Adriano | Silva     | Brasil | Rua 4, 365               | Itirapina  | 13530-000 | (19) 3575-3287 | aasilva@gmail.com            |
      | Pedro   | Camargo   | Brasil | Avenida 3, 568           | São Carlos | 13560-011 | (16) 3415-6607 | pedrocamargo@netshoes.com    |
      | Carlos  | Gomes     | Brasil | Rodovia Nilo Romano, 662 | Itirapina  | 13530-000 | (19) 3575-9365 | carlosgomes@globoaves.com.br |

  Scenario Outline: Cadstro com informações inválidas
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <pais>
    And digitar <endereco>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <endereco de e-mail>
    Then deve aparecer a <mensagem>

    Examples:
      | nome      | sobrenome  | pais   | endereco                     | cidade        | cep             | telefone       | endereco de e-mail           | mensagem                                                 |
      | null      | Silva      | Brasil | Rua 4, 365                   | Itirapina     | 13530-000       | (19) 3575-3287 | aasilva@gmail.com            | O campo Nome é de preenchimento obrigatório.             |
      | Pedro     | null       | Brasil | Avenida 3, 568               | São Carlos    | 13560-011       | (16) 3415-6607 | pedrocamargo@netshoes.com    | O campo Sobrenome é de preenchimento obrigatório.        |
      | Adriano   | Silva      | null   | Rua 4, 365                   | Itirapina     | 13530-000       | (19) 3575-3287 | aasilva@gmail.com            | Favor selecionar um país.                                |
      | Pedro     | Camargo    | Brasil | null                         | São Carlos    | 13560-011       | (16) 3415-6607 | pedrocamargo@netshoes.com    | O campo Endereço é de preenchimento obrigatório.         |
      | Pedro     | Camargo    | Brasil | Avenida 3, 568               | null          | 13560-011       | (16) 3415-6607 | pedrocamargo@netshoes.com    | O campo Cidade é de preenchimento obrigatório.           |
      | Pedro     | Camargo    | Brasil | Avenida 3, 568               | São Carlos    | null            | (16) 3415-6607 | pedrocamargo@netshoes.com    | O campo CEP é de preenchimento obrigatório.              |
      | Adriano   | Silva      | Brasil | Rua 4, 365                   | Itirapina     | 13530-000       | null           | aasilva@gmail.com            | O campo Telefone é de preenchimento obrigatório.         |
      | Adriano   | Silva      | Brasil | Rua 4, 365                   | Itirapina     | 13530-000       | (19) 3575-3287 | null                         | O campo e-mail é de preenchimento obrigatório.           |
      | Adriano@1 | Silva      | Brasil | Rua 4, 365                   | Itirapina     | 13530-000       | (19) 3575-3287 | aasilva@gmail.com            | Nome inválido. Deve conter apenas letras e espaço.       |
      | Pedro     | Camargo#43 | Brasil | Avenida 3, 568               | São Carlos    | 13560-011       | (16) 3415-6607 | pedrocamargo@netshoes.com    | Sobrenome inválido. Deve conter apenas letras e espaço   |
      | Carlos    | Gomes      | Brasil | Rodovia Nilo Romano, 662 @#$ | Itirapina     | 13530-000       | (19) 3575-9365 | carlosgomes@globoaves.com.br | Endereço inválido. Não deve conter caracteres especiais. |
      | Adriano   | Silva      | Brasil | Rua 4, 365                   | Itirapina123@ | 13530-000       | (19) 3575-3287 | aasilva@gmail.com            | Cidade inválida. Deve conter apenas letras e espaços.    |
      | Pedro     | Camargo    | Brasil | Avenida 3, 568               | São Carlos    | 13560-011!@#asd | (16) 3415-6607 | pedrocamargo@netshoes.com    | CEP inválido. Deve conter apenas números                 |
      | Carlos    | Gomes      | Brasil | Rodovia Nilo Romano, 662     | Itirapina     | 13530-000       | (00) 9999-9999 | carlosgomes@globoaves.com.br | Telefone inválido. Favor informar telefone com DDD.      |
      | Pedro     | Camargo    | Brasil | Avenida 3, 568               | São Carlos    | 13560-011       | (16) 3415-6607 | pedrocamargo@netshoes,com;   | E-mail inválido. Favor informar e-mail válido.           |
      
