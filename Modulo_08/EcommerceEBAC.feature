Feature: Configurar produto
  Como cliente da EBAC-SHOP
  Quero configurar meu produto de acordo com meu tamanho e gosto
  E escolher a quantidade
  Para depois inserir no carrinho

  Background:
    Given que eu acesse a página do EBAC-SHOP

  Scenario Outline: Seleções de cor, tamanho e quantidade válidos
    When eu selecionar a <cor>
    And o <tamanho>
    And a <quantidade>
    Then deve emitir a mensagem "Produto adicionado ao carrinho"

    Examples:
      | cor    | tamanho | quantidade |
      | blue   | XS      | 1          |
      | orange | S       | 5          |
      | red    | M       | 9          |
      | blue   | L       | 10         |
      | blue   | XL      | 11         |

  Scenario Outline: Seleções de cor inválida
    When eu selecionar a <cor>
    And o <tamanho>
    And a <quantidade>
    Then deve emitir a mensagem de erro "Selecionar Cor: Por favor, escolha uma opção"

    Examples:
      | cor  | tamanho | quantidade |
      | null | XS      | 1          |
      | null | S       | 5          |
      | null | M       | 9          |
      | null | L       | 10         |
      | null | XL      | 11         |

  Scenario Outline: Seleções de tamanho inválido
    When eu selecionar a <cor>
    And o <tamanho>
    And a <quantidade>
    Then deve emitir a mensagem de erro "Selecionar Tamanho: Por favor, escolha uma opção"

    Examples:
      | cor    | tamanho | quantidade |
      | blue   | null    | 1          |
      | orange | null    | 5          |
      | red    | null    | 9          |
      | blue   | null    | 10         |
      | blue   | null    | 11         |

  Scenario Outline: Seleções de quantidade inválida
    When eu selecionar a <cor>
    And o <tamanho>
    And a <quantidade>
    Then deve emitir a mensagem de erro <mensagem>

    Examples:
      | cor    | tamanho | quantidade | mensagem                             |
      | blue   | XS      | 11         | Permitido selecionar até 10 produtos |
      | orange | S       | 0          | Quantidade inválida                  |
      | red    | M       | null       | Quantidade inválida                  |
      | blue   | L       | 15         | Permitido selecionar até 10 produtos |
      | blue   | XL      | 30         | Permitido selecionar até 10 produtos |

  Scenario: Limpar configuração dos produtos
    When eu clicar no botão "Limpar"
    Then deve aparecer a mensagem "Selecione a cor e o tamanho desejados"

Feature: Autenticação de usuário
  Como cliente da EBAC-SHOP
  Quero autenticar usuário e senha
  Para acessar a página de checkout

  Background:
    Given que eu acesse a página de autenticação do EBAC-SHOP

  Scenario Outline: Login e senha válidos
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

  Scenario Outline: Login inválido e senha válida
    When eu digitar o <usuario>
    And a <senha>
    Then deve aparecer a mensagem "Usuário ou senha inválidos"

    Examples:
      | usuario                     | senha        | nome     |
      | invalidadriano@gmail.com    | uG%VZsko%giz | adriano  |
      | invalidfernando@hotmail.com | 3@Zqaj5FqGzm | fernando |
      | invalidcarlos@yahoo.com.br  | t&RNur4A$6t4 | carlos   |
      | invalidtiago@gmail.com      | ^tkUMX4kCvnE | tiago    |
      | invalidpedro@outlook.com    | W^bI^#OBDYK^ | pedro    |
      | invalidjose@yahoo.com.br    | qV^3s3@32r9D | jose     |

  Scenario Outline: Login válido e senha inválida
    When eu digitar o <usuario>
    And a <senha>
    Then deve aparecer a mensagem "Usuário ou senha inválidos"

    Examples:
      | usuario              | senha       |
      | adriano@gmail.com    | 123@invalid |
      | fernando@hotmail.com | 123@invalid |
      | carlos@yahoo.com.br  | 123@invalid |
      | tiago@gmail.com      | 123@invalid |
      | pedro@outlook.com    | 123@invalid |
      | jose@yahoo.com.br    | 123@invalid |

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
    And digitar <e-mail>
    Then deve aparecer a mensagem "Deseja finalizar a compra?"

    Examples:
      | nome          | sobrenome | país   | endereço              | cidade     | cep       | telefone       | e-mail                       |
      | Adriano Pedro | Aluizi    | Brasil | Avenida 3, 568        | Itirapina  | 13530-000 | (19) 3575-3287 | aaluizi@gmail.com            |
      | Fernando Jose | Silva     | Brasil | Rua Dom Pedro II, 736 | São Carlos | 13530-360 | (16) 3415-6607 | fernandosilva@outlook.com.br |
      | Pedro         | Camargo   | Brasil | Avenida 13, 895       | São carlos | 1380-970  | (16) 3376-4176 | pedrocarmago-1990@bol.com    |
      | Carlos Tiago  | Dregui    | Brasil | Rua 5, 662            | Itirapina  | 13530-000 | (19) 3575-9365 | carlos_dregui@hotmail.com.br |
      | Jose Ricardo  | Maia      | Brasil | Avenida 7, 895        | São Carlos | 14589-970 | (16) 3724-2356 | jr_maia@vslab.ag             |

  Scenario Outline: Campo nome incorreto
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <pais>
    And digitar <endereco>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <e-mail>
    Then deve aparecer a mensagem "O campo Nome é de preenchimento obrigatório. Deve conter apenas letras e espaço."

    Examples:
      | nome            | sobrenome | pais   | endereço              | cidade     | cep       | telefone       | e-mail                       |
      | Adriano Pedro+  | Aluizi    | Brasil | Avenida 3, 568        | Itirapina  | 13530-000 | (19) 3575-3287 | aaluizi@gmail.com            |
      | Fernando_Jose   | Silva     | Brasil | Rua Dom Pedro II, 736 | São Carlos | 13530-360 | (16) 3415-6607 | fernandosilva@outlook.com.br |
      | null            | Camargo   | Brasil | Avenida 13, 895       | São carlos | 1380-970  | (16) 3376-4176 | pedrocarmago-1990@bol.com    |
      | Carlos Tiago123 | Dregui    | Brasil | Rua 5, 662            | Itirapina  | 13530-000 | (19) 3575-9365 | carlos_dregui@hotmail.com.br |
      | Jose Ricardo @  | Maia      | Brasil | Avenida 7, 895        | São Carlos | 14589-970 | (16) 3724-2356 | jr_maia@vslab.ag             |

  Scenario Outline: Campo sobrenome incorreto
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <pais>
    And digitar <endereco>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <e-mail>
    Then deve aparecer a mensagem "O campo Sobrenome é de preenchimento obrigatório. Deve conter apenas letras e espaço."

    Examples:
      | nome          | sobrenome  | pais   | endereço              | cidade     | cep       | telefone       | e-mail                       |
      | Adriano Pedro | Aluizi_    | Brasil | Avenida 3, 568        | Itirapina  | 13530-000 | (19) 3575-3287 | aaluizi@gmail.com            |
      | Fernando Jose | Silva@     | Brasil | Rua Dom Pedro II, 736 | São Carlos | 13530-360 | (16) 3415-6607 | fernandosilva@outlook.com.br |
      | Pedro         | Camargo123 | Brasil | Avenida 13, 895       | São carlos | 1380-970  | (16) 3376-4176 | pedrocarmago-1990@bol.com    |
      | Carlos Tiago  | Dregui++   | Brasil | Rua 5, 662            | Itirapina  | 13530-000 | (19) 3575-9365 | carlos_dregui@hotmail.com.br |
      | Jose Ricardo  | Maia()     | Brasil | Avenida 7, 895        | São Carlos | 14589-970 | (16) 3724-2356 | jr_maia@vslab.ag             |


  Scenario Outline: Campo país sem informação
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <pais>
    And digitar <endereco>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <e-mail>
    Then deve aparecer a mensagem "Favor selecionar um país."

    Examples:
      | nome          | sobrenome | pais | endereço              | cidade     | cep       | telefone       | e-mail                       |
      | Adriano Pedro | Aluizi    | null | Avenida 3, 568        | Itirapina  | 13530-000 | (19) 3575-3287 | aaluizi@gmail.com            |
      | Fernando Jose | Silva     | null | Rua Dom Pedro II, 736 | São Carlos | 13530-360 | (16) 3415-6607 | fernandosilva@outlook.com.br |
      | Pedro         | Camargo   | null | Avenida 13, 895       | São carlos | 1380-970  | (16) 3376-4176 | pedrocarmago-1990@bol.com    |
      | Carlos Tiago  | Dregui    | null | Rua 5, 662            | Itirapina  | 13530-000 | (19) 3575-9365 | carlos_dregui@hotmail.com.br |
      | Jose Ricardo  | Maia      | null | Avenida 7, 895        | São Carlos | 14589-970 | (16) 3724-2356 | jr_maia@vslab.ag             |

  Scenario Outline: Campo endereço incorreto
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <pais>
    And digitar <endereco>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <e-mail>
    Then deve aparecer a mensagem "O campo Endereço é de preenchimento obrigatório. Não deve conter caracteres especiais."

    Examples:
      | nome          | sobrenome | pais   | endereço            | cidade     | cep       | telefone       | e-mail                       |
      | Adriano Pedro | Aluizi    | Brasil | Avenida 3, 568  *   | Itirapina  | 13530-000 | (19) 3575-3287 | aaluizi@gmail.com            |
      | Fernando Jose | Silva     | Brasil | Rua Dom Pedro II    | São Carlos | 13530-360 | (16) 3415-6607 | fernandosilva@outlook.com.br |
      | Pedro         | Camargo   | Brasil | Avenida 13, 895 *() | São carlos | 1380-970  | (16) 3376-4176 | pedrocarmago-1990@bol.com    |
      | Carlos Tiago  | Dregui    | Brasil | null                | Itirapina  | 13530-000 | (19) 3575-9365 | carlos_dregui@hotmail.com.br |
      | Jose Ricardo  | Maia      | Brasil | null                | São Carlos | 14589-970 | (16) 3724-2356 | jr_maia@vslab.ag             |

  Scenario Outline: Campo cidade incorreto
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <pais>
    And digitar <endereco>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <e-mail>
    Then deve aparecer a mensagem "O campo Cidade é de preenchimento obrigatório. Deve conter apenas letras e espaços."

    Examples:
      | nome          | sobrenome | pais   | endereço              | cidade         | cep       | telefone       | e-mail                       |
      | Adriano Pedro | Aluizi    | Brasil | Avenida 3, 568        | null           | 13530-000 | (19) 3575-3287 | aaluizi@gmail.com            |
      | Fernando Jose | Silva     | Brasil | Rua Dom Pedro II, 736 | São Carlos@#$  | 13530-360 | (16) 3415-6607 | fernandosilva@outlook.com.br |
      | Pedro         | Camargo   | Brasil | Avenida 13, 895       | São carlos 234 | 1380-970  | (16) 3376-4176 | pedrocarmago-1990@bol.com    |
      | Carlos Tiago  | Dregui    | Brasil | Rua 5, 662            | Itirapina__    | 13530-000 | (19) 3575-9365 | carlos_dregui@hotmail.com.br |
      | Jose Ricardo  | Maia      | Brasil | Avenida 7, 895        | São Carlos (   | 14589-970 | (16) 3724-2356 | jr_maia@vslab.ag             |

  Scenario Outline: Campo cep incorreto
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <pais>
    And digitar <endereco>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <e-mail>
    Then deve aparecer a mensagem "O campo CEP é de preenchimento obrigatório. Deve conter apenas números."

    Examples:
      | nome          | sobrenome | pais   | endereço              | cidade     | cep         | telefone       | e-mail                       |
      | Adriano Pedro | Aluizi    | Brasil | Avenida 3, 568        | Itirapina  | 13530-00098 | (19) 3575-3287 | aaluizi@gmail.com            |
      | Fernando Jose | Silva     | Brasil | Rua Dom Pedro II, 736 | São Carlos | 13530-360$% | (16) 3415-6607 | fernandosilva@outlook.com.br |
      | Pedro         | Camargo   | Brasil | Avenida 13, 895       | São carlos | 1380-970äsd | (16) 3376-4176 | pedrocarmago-1990@bol.com    |
      | Carlos Tiago  | Dregui    | Brasil | Rua 5, 662            | Itirapina  | null        | (19) 3575-9365 | carlos_dregui@hotmail.com.br |
      | Jose Ricardo  | Maia      | Brasil | Avenida 7, 895        | São Carlos | cep         | (16) 3724-2356 | jr_maia@vslab.ag             |

  Scenario Outline: Campo telefone incorreto
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <pais>
    And digitar <endereco>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <e-mail>
    Then deve aparecer a mensagem "O campo Telefone é de preenchimento obrigatório. Favor informar telefone com DDD."

    Examples:
      | nome          | sobrenome | pais   | endereço              | cidade     | cep       | telefone           | e-mail                       |
      | Adriano Pedro | Aluizi    | Brasil | Avenida 3, 568        | Itirapina  | 13530-000 | () 3575-3287       | aaluizi@gmail.com            |
      | Fernando Jose | Silva     | Brasil | Rua Dom Pedro II, 736 | São Carlos | 13530-360 | (16) 2343415-6607  | fernandosilva@outlook.com.br |
      | Pedro         | Camargo   | Brasil | Avenida 13, 895       | São carlos | 1380-970  | telefone 376-4176  | pedrocarmago-1990@bol.com    |
      | Carlos Tiago  | Dregui    | Brasil | Rua 5, 662            | Itirapina  | 13530-000 | (19) @!#$3575-9365 | carlos_dregui@hotmail.com.br |
      | Jose Ricardo  | Maia      | Brasil | Avenida 7, 895        | São Carlos | 14589-970 | null               | jr_maia@vslab.ag             |

  Scenario Outline: Campo e-mail incorreto
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <pais>
    And digitar <endereco>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <e-mail>
    Then deve aparecer a mensagem "O campo e-mail é de preenchimento obrigatório. Favor informar e-mail válido."

    Examples:
      | nome          | sobrenome | pais   | endereço              | cidade     | cep       | telefone       | e-mail                             |
      | Adriano Pedro | Aluizi    | Brasil | Avenida 3, 568        | Itirapina  | 13530-000 | (19) 3575-3287 | aaluizi@gmail.com asdasdasd        |
      | Fernando Jose | Silva     | Brasil | Rua Dom Pedro II, 736 | São Carlos | 13530-360 | (16) 3415-6607 | fernandosilva@outlook.com.br___907 |
      | Pedro         | Camargo   | Brasil | Avenida 13, 895       | São carlos | 1380-970  | (16) 3376-4176 | pedrocarmago-1990@bol.com1234      |
      | Carlos Tiago  | Dregui    | Brasil | Rua 5, 662            | Itirapina  | 13530-000 | (19) 3575-9365 | carlos_dregui@hotmasdasail.com.br  |
      | Jose Ricardo  | Maia      | Brasil | Avenida 7, 895        | São Carlos | 14589-970 | (16) 3724-2356 | null                               |
