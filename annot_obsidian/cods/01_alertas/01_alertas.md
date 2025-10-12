## 1 - Exercício
```prw
#INCLUDE "TOTVS.CH"

/*/ {Protheus.doc} User Function Alertas
    (Exemplos de funcoes de alerta)
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    (Examplos)
    @see (https://tdn.totvs.com/pages/)
/*/


User Function Alertas

    // Alertas
    Alert("Funcao Alert()")
    MsgAlert("Mensagem","MsgAlert()")
    ApMsgAlert("Mensagem", "ApMsgAlert" )

    // Avisos com escolha
    Aviso("Aviso()","Mensagem",{"Confirmar","Cancelar"},1,"Sub-Titulo")

    // Informativos
    MsgInfo("Mensagem","MsgInfo()")
    ApMsgInfo("Mensagem", "ApMsgInfo()")

    // Alertas com parada no processo
    MsgStop("Mensagem","MsgStop()")
    ApMsgStop("Mensagem","ApMsgStop()")

    // Ajuda
    Help("",1,"RECNO")

    // Escolha Sim ou NÃ£o
    MsgYesNo("Mensagem","MsgYesNo()")
    ApMsgYesNo("Mensagem","ApMsgYesNo()")
    MsgNoYes("Mensagem","MsgNoYes()")
    ApMsgNoYes("Mensagem","ApMsgNoYes()")
    MsgYesNoTimer("Mensagem","MsgYesNoTimer()",10000,2)

    // Falhas
    MsgRetryCal("Mensagem","MsgRetryCal()")
    MsgRetryCancel("Mensagem","MsgRetryCancel()")

Return
```

## 🔸 **1. Alertas básicos**
```prw
Alert("Funcao Alert()")
MsgAlert("Mensagem","MsgAlert()")
ApMsgAlert("Mensagem", "ApMsgAlert" )
```
- **`Alert()`** → mostra uma caixa simples com um texto. Mais usado para testes rápidos.
- **`MsgAlert()`** → mostra uma mensagem com **título e conteúdo** (mais informativo que `Alert`).
- **`ApMsgAlert()`** → mesma ideia, mas no **padrão do ambiente Application Server (Ap)**.

📌 **Quando usar:**
- Mensagens rápidas de informação ou aviso.
- Mostrar o resultado de uma variável ou cálculo durante testes.
---

## 🔸 **2. Avisos com opções**
```prw
Aviso("Aviso()","Mensagem",{"Confirmar","Cancelar"},1,"Sub-Titulo")
```

- Mostra uma caixa com **botões personalizados** (`Confirmar` e `Cancelar`).
- O número `1` indica o **botão padrão**.
- `"Sub-Titulo"` aparece como informação extra.

📌 **Quando usar:**
- Quando precisa que o usuário **escolha uma ação** (exemplo: salvar ou cancelar).
---

## 🔸 **3. Mensagens informativas**
```prw
MsgInfo("Mensagem","MsgInfo()")
ApMsgInfo("Mensagem", "ApMsgInfo()")
```
- **`MsgInfo()`** → mostra apenas uma informação simples com título.
- **`ApMsgInfo()`** → versão para o Application Server.

📌 **Quando usar:**
- Para **notificar o usuário** de algo importante, mas que **não interrompe o fluxo**.
- Exemplo: "Processo concluído com sucesso".
---

## 🔸 **4. Mensagens que param o processo**
```prw
MsgStop("Mensagem","MsgStop()")
ApMsgStop("Mensagem","ApMsgStop()")
```
- Diferente do `MsgInfo`, aqui o sistema **fica parado até o usuário clicar em OK**.
- Garante que o usuário leu a mensagem antes de continuar.

📌 **Quando usar:**
- Mensagens críticas que exigem **atenção obrigatória**.
- Exemplo: "Não foi possível gravar o registro!".
---

## 🔸 **5. Ajuda**
```prw
Help("",1,"RECNO")
```

- Abre a janela de **ajuda do Protheus**, com base em parâmetros.
- Nesse exemplo:
    - `""` → módulo atual.
    - `1` → tipo de ajuda.
    - `"RECNO"` → tópico da ajuda.
📌 **Quando usar:**
- Para abrir a documentação de um recurso diretamente para o usuário.
---

## 🔸 **6. Escolha Sim ou Não**
```prw 
MsgYesNo("Mensagem","MsgYesNo()")
ApMsgYesNo("Mensagem","ApMsgYesNo()") 
MsgNoYes("Mensagem","MsgNoYes()")
ApMsgNoYes("Mensagem","ApMsgNoYes()")
MsgYesNoTimer("Mensagem","MsgYesNoTimer()",10000,2)
```
- **`MsgYesNo()`** → exibe botões **Sim e Não**.
- **`ApMsgYesNo()`** → mesma coisa, versão Application Server.
- **`MsgNoYes()`** → igual, mas a ordem dos botões muda (**Não/Sim**).
- **`MsgYesNoTimer()`** → igual ao `MsgYesNo`, mas com **tempo limite (10 segundos no exemplo)**, que seleciona automaticamente a opção `2` (No).

📌 **Quando usar:**
- Situações que exigem **confirmação do usuário**.
- O `Timer` é útil quando não pode esperar indefinidamente pela resposta.
---

## 🔸 **7. Mensagens de falha ou repetição**
```prw
MsgRetryCal("Mensagem","MsgRetryCal()")
MsgRetryCancel("Mensagem","MsgRetryCancel()")
```
- **`MsgRetryCal()`** → exibe opções de **Repetir ou Cancelar**.
- **`MsgRetryCancel()`** → idem (nomes podem variar conforme versão).

📌 **Quando usar:**
- Em **erros temporários**, onde vale a pena tentar de novo.
	- Exemplo: falha em uma conexão, mas pode repetir a operação.


