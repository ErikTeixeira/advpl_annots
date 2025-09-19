## 4 - Exercicio
```prw
#Include "totvs.ch"

/*/ {Protheus.doc} User Function MessageBox
    (Exemplos de funcoes de alerta)
    @type   Function
    @author   Milton J.dos Santos
    @since    01/03/2020
    @version  1.0.0
    @param    Nenhum
    @return   Vazio (nil)
    @example    (examples)
    @see        (https://tdn.totvs.com/display/tec/MessageBox)
/*/

// A função MSGBOX foi descontinuada, em seu lugar entrou a MessageBox

// https://centraldeatendimento.totvs.com/hc/pt-br/articles/360018231932-Cross-Segmentos-TOTVS-Backoffice-Linha-Protheus-ADVPL-Fun%C3%A7%C3%A3o-msgbox

// Opções do MessageBox
#define MB_OK                       0
#define MB_OKCANCEL                 1
#define MB_YESNO                    4
#define MB_ICONHAND                 16
#define MB_ICONQUESTION             32
#define MB_ICONEXCLAMATION          48
#define MB_ICONASTERISK             64

// Retornos possíveis do MessageBox
#define IDOK          1
#define IDCANCEL      2
#define IDYES         6
#define IDNO          7

User Function MessageBox()
  // Executa os MessageBox e aguarda os valores de retorno

  nRet1 := MessageBox("MB_OK","",MB_OK)

  nRet2 := MessageBox("MB_OKCANCEL","",MB_OKCANCEL)

  nRet3 := MessageBox("MB_YESNO","",MB_YESNO)

  nRet4 := MessageBox("MB_ICONHAND","",MB_ICONHAND)

  nRet5 := MessageBox("MB_ICONQUESTION","",MB_ICONQUESTION)

  nRet6 := MessageBox("MB_ICONEXCLAMATION","",MB_ICONEXCLAMATION)

  nRet7 := MessageBox("MB_ICONASTERISK","",MB_ICONASTERISK)

Return
```

### O que é `MessageBox()`?

É uma função que exibe uma **caixa de diálogo (pop-up)** para o usuário, com **botões de interação e ícones visuais**.  
➡️ A diferença para `MsgAlert()`, `MsgInfo()`, etc., é que ela é **mais genérica e padronizada** (funciona como no Windows API).

---
### Estrutura
```prw
MessageBox(<cMensagem>, <cTitulo>, <nOpcoes>)
```
- `<cMensagem>` → Texto mostrado na caixa.
- `<cTitulo>` → Texto do título da janela.
- `<nOpcoes>` → Número que indica quais botões e ícones devem aparecer.

---
### As opções (`#define`) no código:
Essas constantes tornam o código mais legível (em vez de usar números “mágicos”).
- **Botões:**
    - `MB_OK` → Apenas o botão **OK**.
    - `MB_OKCANCEL` → Botões **OK** e **Cancelar**.
    - `MB_YESNO` → Botões **Sim** e **Não**.
- **Ícones:**
    - `MB_ICONHAND` → Ícone de “mão/erro grave”.
    - `MB_ICONQUESTION` → Ícone de interrogação (pergunta).
    - `MB_ICONEXCLAMATION` → Ícone de exclamação (atenção).
    - `MB_ICONASTERISK` → Ícone de informação (um “i”).
---
### 📌 Os retornos possíveis:
A função retorna um número que indica **qual botão o usuário clicou**:
- `IDOK` → Usuário clicou em **OK**.
- `IDCANCEL` → Usuário clicou em **Cancelar**.
- `IDYES` → Usuário clicou em **Sim**.
- `IDNO` → Usuário clicou em **Não**.
---
### O que o código faz:

`nRet1 := MessageBox("MB_OK","",MB_OK)`

> ➡️ Mostra uma caixa só com **OK**, e guarda o retorno em `nRet1`.

`nRet2 := MessageBox("MB_OKCANCEL","",MB_OKCANCEL)`

> ➡️ Mostra com **OK/Cancelar** e guarda o que o usuário escolheu.

E assim por diante, testando todos os tipos de botões e ícones.

---
- `MessageBox()` substituiu `MsgBox()`.
- Permite exibir mensagens com botões e ícones diferentes.
- Usa **constantes (#define)** para facilitar a leitura do código.
- Retorna o valor do botão que o usuário escolheu (`OK`, `Cancelar`, `Sim`, `Não`).





