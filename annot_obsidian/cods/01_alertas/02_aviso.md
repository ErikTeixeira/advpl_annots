## 2 - Exercício
```prw
#INCLUDE "TOTVS.CH"

/*/ {Protheus.doc} User Function Aviso
    (Exemplos de funcoes de alerta)
    @type  Function
    @author Milton J.dos Santos
    @since 01/03/2020
    @version 1.0.0
    @param Nenhum
    @return Vazio (nil)
    @example
    (examples)
    @see (https://tdn.totvs.com/pages/viewpage.action?pageId=23889130)
/*/

User Function Aviso()
Local nOpc  := 0
// Sintaxe
// Aviso( <cTitulo>, <cTexto>, <aBotões>, <nTamanho> )  


nOpc := Aviso( "Exemplo", 'Mensagem', { "Sim", "Não", "Sim - Todos", "Não - Todos" }, 3, "Titulo da Descrição",, 'ENGRENAGEM', .F., 5000 )

If nOpc == 1
    MsgInfo( 'Sim', 'Exemplo' )

ElseIf nOpc == 2
    MsgInfo( 'Não', 'Exemplo' )

ElseIf nOpc == 3
    MsgInfo( 'Sim - Todos', 'Exemplo' )

ElseIf nOpc == 4
    MsgInfo( 'Não - Todos', 'Exemplo' )

Endif

Return( Nil )
```



### 📌 O que é a função `Aviso()`?
- A função **`Aviso()`** exibe uma **janela de mensagem com botões de escolha** (personalizados).
    
- Diferente de um `Alert()` ou `MsgAlert()` que só mostram a mensagem e esperam um **OK**, o `Aviso()` permite ao usuário **tomar decisões** dentro do sistema.

- Ele retorna um **número inteiro** correspondente ao botão escolhido pelo usuário.
---

📌 Sintaxe usada no código
```
Aviso( <cTitulo>, <cTexto>, <aBotoes>, <nTamanho>, <cSubTitulo>, <nOpc>, <cIcone>, <lModal>, <nTempo> )
```

No exemplo:
```
nOpc := Aviso( "Exemplo", 'Mensagem', { "Sim", "Não", "Sim - Todos", "Não - Todos" }, 3, "Titulo da Descrição",, 'ENGRENAGEM', .F., 5000 )
```

🔎 Parâmetros explicados:
1. `"Exemplo"` → título da janela.
    
2. `'Mensagem'` → texto que aparece na caixa.
    
3. `{ "Sim", "Não", "Sim - Todos", "Não - Todos" }` → **array de botões** exibidos.
    
4. `3` → tamanho da janela (quanto maior o número, maior a janela).
    
5. `"Titulo da Descrição"` → subtítulo da janela.
    
6. `,` → parâmetro opcional não usado.
    
7. `'ENGRENAGEM'` → ícone exibido na janela (padrão do sistema, pode ser trocado).
    
8. `.F.` → indica se a janela será modal (`.T.` = trava o resto do sistema até responder).
    
9. `5000` → tempo limite em milissegundos (5 segundos).

----
### O retorno (`nOpc`)
- A variável `nOpc` recebe o valor do botão escolhido pelo usuário.
- Como temos 4 botões, o retorno pode ser:
    - `1` → "Sim"
    - `2` → "Não"
    - `3` → "Sim - Todos"
    - `4` → "Não - Todos"


