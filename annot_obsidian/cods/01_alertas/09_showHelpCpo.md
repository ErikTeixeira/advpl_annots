## 9 - Exercício
```prw
#INCLUDE "TOTVS.CH"

  
/*/ {Protheus.doc} User Function SHD
    (Exemplos de funcoes de alerta)
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    (examples)
    @see        (https://tdn.totvs.com/display/tec/ShowHelpCpo)
/*/

  

User Function SHC()     // ShowHelpCpo()

    Local aAjuda := {}

    Local aValid := {}

    aAdd( aAjuda, 'Ajuda 01' )

    aAdd( aAjuda, 'Ajuda 02' )

    aAdd( aAjuda, 'Ajuda 03' )

    aAdd( aAjuda, 'Ajuda 04' )

    aAdd( aAjuda, 'Ajuda 05' )

    aAdd( aValid, 'Validação 01' )

    aAdd( aValid, 'Validação 02' )

    aAdd( aValid, 'Validação 03' )

    aAdd( aValid, 'Validação 04' )

    aAdd( aValid, 'Validação 05' )

    ShowHelpCpo( 'Exemplo', aAjuda, , aValid, )

    // OU

    ShowHelpCpo( 'Exemplo', { 'Ajuda 01', 'Ajuda 02', 'Ajuda 03' }, , {'Validação 01'}, )

    //Apresenta a mensagem de ajuda do campo.

    //Sintaxe

    //ShowHelpCpo ( [ cCabec], [ aAjuda], [ nLinAjuda], [ aValid], [ nLinValid] ) --> Nil

  

    //Parâmetros/Elementos

    /*----------*----------*-------------------------------------------------------------------------------*

    | Nome      | Tipo     | Descrição                                                                     |

    *----------+----------+-------------------------------------------------------------------------------*

    | cCabec    | Caracter | Indica o título da janela que será apresentada.                               |

    | aAjuda    | Vetor    | Indica o array que contêm o texto com a mensagem de ajuda do campo.           |

    | nLinAjuda| Numérico | Indica o número de linhas para apresentar a mensagem de ajuda do campo.    |    

    | aValid    | Vetor    | Indica o array que contêm o texto com a mensagem das validações do campo.     |    

    | nLinValid| Nulo      | Indica o número de linhas para apresentar a mensagem das validações do campo. |

    *----------*----------*-------------------------------------------------------------------------------*/

  

Return( Nil )
```

## Tem que rodar no SmartClient
## Quando Rodar
> **Pressione a tecla Esc no seu teclado.** Esta é a forma padrão de fechar janelas modais simples no Protheus.

## 📌 O que é o `ShowHelpCpo()`?

É uma função que abre uma **caixa de diálogo estruturada** contendo:
- Um **título** (cCabec).
- Um ou mais textos de **ajuda** (aAjuda).
- Um ou mais textos de **validação** (aValid).
- E ainda permite limitar o **número de linhas exibidas** tanto na ajuda quanto na validação.

Ou seja, é usada para **explicar o que o campo significa e quais regras devem ser respeitadas**

---

## ⚙️ Sintaxe

`ShowHelpCpo( [ cCabec ], [ aAjuda ], [ nLinAjuda ], [ aValid ], [ nLinValid ] ) --> Nil`

### 🔹 Parâmetros:
- **`cCabec`** → título da janela de ajuda (string).
- **`aAjuda`** → array de strings com os textos de ajuda.
- **`nLinAjuda`** → número de linhas para exibir a ajuda (opcional).
- **`aValid`** → array de strings com os textos de validação.
- **`nLinValid`** → número de linhas para exibir a validação (opcional).

---
## 📌 O que o código faz?
### Primeiro exemplo:
```
Local aAjuda := {}
Local aValid := {}

aAdd( aAjuda, 'Ajuda 01' )
aAdd( aAjuda, 'Ajuda 02' )
...
aAdd( aValid, 'Validação 01' )
aAdd( aValid, 'Validação 02' )

ShowHelpCpo( 'Exemplo', aAjuda, , aValid, )
```

🔎 Aqui ele:
- Monta dois arrays:
    - **aAjuda** → com 5 mensagens de ajuda.
    - **aValid** → com 5 mensagens de validação.
- Chama o `ShowHelpCpo`, que exibe a janela com:
    - Título: **"Exemplo"**.
    - Lista de ajudas.
    - Lista de validações.

---
### Segundo exemplo (forma resumida):

`ShowHelpCpo( 'Exemplo', { 'Ajuda 01', 'Ajuda 02', 'Ajuda 03' }, , { 'Validação 01' }, )`

Aqui ele passa os arrays **direto no parâmetro**, sem precisar criar `aAjuda` e `aValid`.

---
## ✅ Para que serve na prática?

Imagine que o usuário está preenchendo um campo de cadastro, como **"CNPJ"**.  
Você pode usar `ShowHelpCpo` para exibir:
- **Ajuda:**
    - "Digite apenas números."
    - "O campo deve ter 14 dígitos."
        
- **Validações:**
    - "Verifica se o CNPJ é válido."
    - "Verifica se já existe no sistema."
        

Assim, o usuário entende **como preencher** e **quais regras são aplicadas**.

---

👉 Em resumo:  
`ShowHelpCpo()` é uma **janela de ajuda/validação para campos**, permitindo organizar melhor as orientações ao usuário. É mais elegante e estruturado do que usar apenas `MsgInfo` ou `Alert`.
