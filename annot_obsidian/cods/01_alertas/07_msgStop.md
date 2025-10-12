## 7 - Exercício
```prw
#INCLUDE "TOTVS.CH"

/*/ {Protheus.doc} User Function MsgStop
    (Exemplos de funcoes de alerta)
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    (examples)
    @see        (https://tdn.totvs.com/pages/viewpage.action?pageId=24346998)
/*/

  
User Function MsgStop()

    // Pop-Up que indica uma mensagem de atenção ao usuário,
    // pode ser utilizada para indicar alguma ação errada do usuário
    // que gerou erro, semelhante ao Alert() mas este PERMITE TÍTULO PARA A TELA

    // Sintaxe
    // MsgStop( <cTexto>, <cTitulo> )


    MsgStop( 'Advertencia', 'Exemplo' )

Return( Nil )
```

### O que é `MsgStop()`?
- É uma função que exibe uma **caixa de mensagem de advertência/erro**.
- Muito usada para avisar o usuário de que algo **não pôde ser feito** ou que ocorreu **um erro**.
- Diferente do `Alert()`, ela **permite informar um título** na janela.
---

### ⚙️ Sintaxe
`MsgStop( <cTexto>, <cTitulo> )`

- **`<cTexto>`** → mensagem que será exibida (corpo).
- **`<cTitulo>`** → título da janela (explicando o tipo de erro ou contexto).
---

### 📌 O que o código faz
`MsgStop( 'Advertencia', 'Exemplo' )`

1. Abre uma caixa de mensagem com:
    - **Título:** "Exemplo"
    - **Mensagem:** "Advertencia"
    - Ícone de alerta/stop (aquele "X" vermelho clássico).
---

### ✅ Para que serve?
- Mostrar **mensagens de erro ou advertência**.
- Exemplo prático:
    - Usuário tenta salvar um pedido sem cliente → `MsgStop("Informe o cliente!", "Erro")`
    - Usuário insere um código inválido → `MsgStop("Produto inexistente!", "Validação")`

Assim, o usuário sabe que houve um problema e precisa corrigir antes de continuar.

---

👉 Resumindo:  
`MsgStop()` é como um **Alert mais elaborado**, usado para indicar **erros ou ações inválidas**, permitindo **um título personalizado** na janela.

