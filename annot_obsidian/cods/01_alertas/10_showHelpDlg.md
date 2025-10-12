## 10 - Exercício
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
    @see        (https://tdn.totvs.com/display/tec/ShowHelpDlg)
/*/

  

User Function SHD

    Local aProblema := {}
    Local aSolucao  := {}


    aAdd( aProblema, 'Problema 01' )
    aAdd( aProblema, 'Problema 02' )
    aAdd( aProblema, 'Problema 03' )
    aAdd( aProblema, 'Problema 04' )
    aAdd( aProblema, 'Problema 05' )
    
    aAdd( aSolucao, 'Solução 01' )
    aAdd( aSolucao, 'Solução 02' )
    aAdd( aSolucao, 'Solução 03' )
    aAdd( aSolucao, 'Solução 04' )
    aAdd( aSolucao, 'Solução 05' )

    ShowHelpDlg( 'Exemplo', aProblema, , aSolucao, )

    //OU

    ShowHelpDlg( 'Exemplo', { 'Problema 01', 'Problema 02', 'Problema 03' }, , {'Solução 01'}, )

  
    //Apresenta a mensagem de ajuda do sistema.
    //Sintaxe
    //ShowHelpDlg ( [ cCabec], [ aProbl], [ nLinProbl], [ aSolucao], [ nLinSoluc] ) --> Nil

  
    //Parâmetros/Elementos
    /*----------*----------*-------------------------------------------------------------------------------*

    | Nome      | Tipo     | Descrição                                                                     |
    *----------+----------+-------------------------------------------------------------------------------*

    | cCabec    | Caracter | Indica o título da janela que será apresentada.                               |

    | aProbl    | Vetor    | Indica o array que contêm o texto com a mensagem de problema.                 |    

    | nLinProbl| Numérico | Indica o número de linhas para apresentar a mensagem de problema.             |

    |          |          | Observação: O número máximo permitido são 5 linhas.                        |

    | aSolucao  | Vetor    | Indica o array que contêm o texto com a mensagem de solução.                  |    

    | nLinSoluc| Nulo      | Indica o número de linhas para apresentar a mensagem de solução.              |

    |          |          | Observação: O número máximo permitido são 5 linhas.                        |

    *----------*----------*-------------------------------------------------------------------------------*/

  
Return( Nil )
```

## O que é o `ShowHelpDlg()`?

É uma função que exibe uma **janela de ajuda do sistema**, onde você pode listar:

- **Problemas** (aProbl) → mensagens que explicam o que deu errado ou o que pode dar errado.
    
- **Soluções** (aSolucao) → mensagens com possíveis ações ou formas de resolver o problema.
    

Assim, você consegue entregar **diagnósticos + soluções sugeridas** direto na interface do usuário.

---

## ⚙️ Sintaxe

`ShowHelpDlg( [ cCabec ], [ aProbl ], [ nLinProbl ], [ aSolucao ], [ nLinSoluc ] ) --> Nil`

### 🔹 Parâmetros:

- **cCabec** → título da janela exibida (string).
    
- **aProbl** → array de strings com os problemas.
    
- **nLinProbl** → número máximo de linhas de problema (até 5).
    
- **aSolucao** → array de strings com soluções.
    
- **nLinSoluc** → número máximo de linhas de solução (até 5).
    

---

## 📌 O que o código faz?

### Primeiro exemplo:
```
Local aProblema := {}
Local aSolucao  := {}

aAdd( aProblema, 'Problema 01' )
aAdd( aProblema, 'Problema 02' )
...
aAdd( aSolucao, 'Solução 01' )
aAdd( aSolucao, 'Solução 02' )

ShowHelpDlg( 'Exemplo', aProblema, , aSolucao, )
```

Isso abre uma janela com:
- Título: **"Exemplo"**.
- Lista de problemas (5 itens).
- Lista de soluções (5 itens).
---

### Segundo exemplo (forma resumida):

`ShowHelpDlg( 'Exemplo', { 'Problema 01', 'Problema 02', 'Problema 03' }, , {'Solução 01'}, )`

Aqui ele passa os arrays **direto no parâmetro**, sem precisar montar `aProblema` e `aSolucao` antes.

---

## ✅ Para que serve na prática?

Imagine que o usuário tenta **gerar um pedido de venda** e o sistema não deixa.  
Você pode exibir algo assim:

- **Problemas:**
    - "Cliente não possui limite de crédito."
    - "Produto sem saldo em estoque."
        
- **Soluções:**
    - "Aumente o limite de crédito do cliente no cadastro."
    - "Verifique a disponibilidade no estoque e ajuste a quantidade."
        

Dessa forma, o usuário entende **o que está errado** e **como corrigir** sem precisar abrir manual ou chamar suporte.

---

👉 Em resumo:  
O `ShowHelpDlg()` é usado para **mostrar problemas e soluções** em uma janela amigável, guiando o usuário de forma clara.  
É mais didático que um simples `MsgStop()` ou `MsgInfo()`, porque oferece **causa + resolução**.