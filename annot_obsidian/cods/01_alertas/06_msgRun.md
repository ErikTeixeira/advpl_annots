## 6 - Exercício
```prw
#INCLUDE "TOTVS.CH"

/*/ {Protheus.doc} User Function MsgRun
    (Exemplos de funcoes de alerta)
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    (examples)
    @see        (https://tdn.totvs.com/display/tec/MsgRun)
/*/


User Function MsgRun

    MsgRun("MsgRun","Processando",{|| Alert("Processamento...") })

Return
```

### 📌 O que é `MsgRun()`?
- É uma função que exibe uma **janela de processamento** com um título e mensagem.
    
- Enquanto a janela está aberta, **executa um bloco de código** passado como parâmetro.
    
- Serve para avisar ao usuário que um processo está em andamento (ex.: cálculos, importações, consultas demoradas).
---

### ⚙️ Sintaxe
`MsgRun( <cTitulo>, <cTexto>, <bBloco> )`

- **`<cTitulo>`** → título da janela.
- **`<cTexto>`** → mensagem exibida (geralmente “Processando…”).
- **`<bBloco>`** → código a ser executado enquanto a janela aparece (bloco de código, `{|| ... }`).
---

### 📌 O que o código faz
`MsgRun("MsgRun","Processando",{|| Alert("Processamento...") })`

1. Abre uma janela com:
    - **Título:** "MsgRun"
    - **Mensagem:** "Processando"
        
2. Enquanto a janela está aberta, executa o bloco `{|| Alert("Processamento...") }`.  
    ➝ Esse bloco só mostra um alerta simples com a frase "Processamento...".
    
> ⚠️ Em sistemas reais, no lugar do `Alert()` geralmente ficam **rotinas demoradas** (ex.: cálculos de relatórios, carga de dados).

---

### ✅ Para que serve?
- Melhorar a experiência do usuário: ele **sabe que o sistema não travou**, mas está processando.
- Dá **feedback visual** enquanto alguma ação é executada
- Evita que o usuário pense que o sistema parou de responder.

