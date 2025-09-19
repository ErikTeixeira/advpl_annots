## 3 - Exercício
```prw
#INCLUDE "TOTVS.CH"


/*/ {Protheus.doc} User Function MsgAlert
    (Exemplos de funcoes de alerta)
    @type  Function
    @author Milton J.dos Santos
    @since 01/03/2020
    @version 1.0.0
    @param Nenhum
    @return Vazio (nil)
    @example
    (examples)
    @see (https://tdn.totvs.com/pages/)
/*/


User Function MsgAlert()
    // É um Pop-Up com o icone de Exclamação, que o objetivo de alertar o usuário
    // sobre um ponto de atenção, sobre algo importante
    // Permite a inclusão de um título
    // Sintaxe
    // MsgAlert( <cTexto>, <cTitulo> )
    // ApMsgAlert - Mensagem de alerta


    MsgAlert( 'Alerta', 'Exemplo' )

Return( Nil )

#Include "Protheus.ch"

User Function TestAlert()

    Local cMsg      := "Alerta que será mostrado na caixa de diálogo."
    Local cCaption  := "Teste do ApMsgAlert"

    ApMsgAlert(cMsg, cCaption)

Return
```


### 📌 O que é `MsgAlert()`?
- É uma **caixa de mensagem (Pop-Up)** que mostra um **ícone de exclamação** ⚠️.
    
- Serve para **alertar o usuário** sobre algo importante, normalmente um ponto de atenção.
    
- Além da mensagem, você pode passar também um **título** para a janela.

📖 **Sintaxe**:
```
MsgAlert( <cTexto>, <cTitulo> )
```
- `<cTexto>` → mensagem principal que será exibida.
- `<cTitulo>` → título da janela (opcional).

---
### que é `ApMsgAlert()`?
- É praticamente o mesmo que `MsgAlert()`, mas é da **família "Ap"** (Application Messages).
    
- A diferença principal:
    - `MsgAlert` → mais **genérica**, usada em rotinas normais.
    - `ApMsgAlert` → usada em **rotinas internas do sistema (aplicações Protheus)**, mantendo o padrão visual e integração com as mensagens do sistema.
    
📖 **Exemplo no código**:
```
User Function TestAlert()
    Local cMsg     := "Alerta que será mostrado na caixa de diálogo."
    Local cCaption := "Teste do ApMsgAlert"

    ApMsgAlert(cMsg, cCaption)
Return
```
---
### Diferença prática entre `MsgAlert` e `ApMsgAlert`
- **`MsgAlert`** → uso mais comum, quando você precisa apenas alertar o usuário em uma rotina sua.
    
- **`ApMsgAlert`** → mantém consistência visual e de comportamento com alertas do **próprio Protheus**, mais indicado em rotinas que interagem diretamente com o sistema padrão.
---
### Quando usar?
- Use `MsgAlert` para avisos rápidos dentro de suas funções customizadas.
    
- Use `ApMsgAlert` quando quiser que a mensagem siga o padrão do Protheus (por exemplo, numa customização de tela do sistema).
---
- `MsgAlert()` → alerta genérico com ícone ⚠️.
    
- `ApMsgAlert()` → alerta no mesmo padrão das mensagens do sistema.
