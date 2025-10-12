## 2 - Exercício
```prw
#Include 'TOTVS.CH'

/*/{Protheus.doc} U_MBRWBTN
    @type       Ponto de Entrada
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao de MBRWBTN
    @see        https://tdn.totvs.com/pages/releaseview.action?pageId=6815197
/*/

// Este ponto de entrada tem por finalidade, validar se a rotina selecionada

// na MBrowse serÃ¡ executada ou nÃ£o a partir do retorno lÃ³gico do ponto de entrada.

User Function MBRWBTN()

    Local cText := ""
    Local lRet  := .T.

    cText := "Alias [ " + PARAMIXB[1]               + " ]" + CRLF
    cText += "Recno [ " + AllTrim(Str(PARAMIXB[2])) + " ]" + CRLF
    cText += "Recno [ " + AllTrim(Str(PARAMIXB[3])) + " ]" + CRLF
    cText += "Recno [ " + PARAMIXB[4]               + " ]" + CRLF


    lRet := MsgYesNo(cText,"Deseja Executar?")

Return lRet
```

**Ponto de Entrada** do Protheus, chamado **MBRWBTN**. Ele serve para **interceptar a execução de rotinas disparadas a partir de um Browse (MBrowse)** e permitir que você **valide ou bloqueie a execução**, dependendo do retorno lógico que você definir.  

Vou quebrar por partes:  

---

### 📌 Cabeçalho
```advpl
#Include 'TOTVS.CH'

/*/{Protheus.doc} U_MBRWBTN
    @type       Ponto de Entrada
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao de MBRWBTN
    @see        https://tdn.totvs.com/pages/releaseview.action?pageId=6815197
/*/
```
- Inclui o arquivo `TOTVS.CH` com definições globais.  
- Documentação do ponto de entrada, para que ele apareça no **Protheus.doc**.  
- Esse **PE (Ponto de Entrada)** é chamado quando o usuário clica em algum **botão de execução dentro de um Browse (MBrowse)**.  

---

### 📌 Propósito
```advpl
// Este ponto de entrada tem por finalidade, validar se a rotina selecionada 
// na MBrowse será executada ou não a partir do retorno lógico do ponto de entrada.
```
- Em resumo: o sistema consulta **essa função** para saber se a ação do botão pode ou não continuar.  
- O retorno (`.T.` ou `.F.`) **permite ou bloqueia a execução** da rotina.  

---

### 📌 Corpo da função
```advpl
User Function MBRWBTN()
    Local cText := ""
    Local lRet  := .T.
```
- `cText` será o texto da mensagem exibida.  
- `lRet` é a variável booleana que decide se a execução vai ou não continuar (`.T.` = sim, `.F.` = não).  

---

### 📌 Montagem da mensagem
```advpl
    cText := "Alias [ " + PARAMIXB[1]                + " ]" + CRLF
    cText += "Recno [ " + AllTrim(Str(PARAMIXB[2]))  + " ]" + CRLF
    cText += "Recno [ " + AllTrim(Str(PARAMIXB[3]))  + " ]" + CRLF
    cText += "Recno [ " + PARAMIXB[4]                + " ]" + CRLF
```
- `PARAMIXB` contém os parâmetros recebidos pelo ponto de entrada:  
  - `PARAMIXB[1]` → **Alias** da tabela em uso (ex: `SA1`, `SB1`).  
  - `PARAMIXB[2]` → **Número do registro corrente** (`RECNO()`).  
  - `PARAMIXB[3]` → **Número do registro selecionado**.  
  - `PARAMIXB[4]` → **Botão pressionado** ou informação adicional do contexto.  
  - `CRLF` → Quebra de linha

- Ele monta uma mensagem com esses dados, exemplo:  

```
Alias [ SA1 ]
Recno [ 15 ]
Recno [ 15 ]
Recno [ BTN001 ]
```

---

### 📌 Confirmação com o usuário
```advpl
    lRet := MsgYesNo(cText,"Deseja Executar?")
```
- Abre uma **caixa de confirmação** com a mensagem `cText`.  
- O usuário escolhe **Sim** (`.T.`) ou **Não** (`.F.`).  
- O valor é armazenado em `lRet`.  

---

### 📌 Retorno
```advpl
Return lRet
```
- O retorno (`.T.` ou `.F.`) decide se o Protheus **executa** ou **bloqueia** a ação do botão na MBrowse.  

---

✅ **Resumo**:  
Esse ponto de entrada intercepta o clique em um botão dentro de um Browse do Protheus, mostra os dados do registro e pergunta ao usuário: *“Deseja executar?”*.  
Se ele clicar em **Sim**, a execução continua; se clicar em **Não**, a execução é bloqueada.  

---

