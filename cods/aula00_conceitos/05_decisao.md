## 5 - Exercício
```prw
#Include "TOTVS.CH"

/*
   Programa.: Desicao.PRW
   Funcao...: U_If, U_IfElse, U_ElseIf, U_Case
   Autor....: Milton J.dos Santos
   Data.....: 01/01/2020
   Descricao: Exemplo do uso de IF-ENDIF CASE-ENDCASE
*/

/*/
    Exemplo de Decisao mostrando um alerta
/*/

User Function If()

   Local nX := 10

   If nX > 5
      MsgAlert("Maior")
   EndIf

Return


User Function IfElse()

   Local nX := 10
   Local cMsg

   If nX < 5
      cMsg := "Maior"
   Else
      cMsg := "Menor"
   EndIf

   MsgAlert(cMsg)

Return


User Function ElseIf()

   Local cRegiao := "NE"
   Local nICMS

   If cRegiao == "SE"
      nICMS := 18
   ElseIf cRegiao == "NE"
      nICMS := 7
   Else
      nICMS := 12
   EndIf

   MsgAlert(nICMS)

Return

User Function Case()

   Local nOpc := 2

   Do Case
      Case nOpc == 1
         MsgAlert("Opcao 1 selecionada")
      Case nOpc == 2
         MsgAlert("Opcao 2 selecionada")
      Case nOpc == 3
         MsgAlert("Opcao 3 selecionada")
      Otherwise
         MsgAlert("Nenhuma opcao selecionada")
   EndCase

Return
```

### **1. `#Include "TOTVS.CH`**
- Inclui a biblioteca padrão do Protheus, necessária para usar funções como `MsgAlert()`.
---
	
### **2. `User Function If()`**
- Declara uma função chamada no Protheus como `U_IF()`.
- Cria uma variável `nX = 10`.
- Estrutura `IF ... ENDIF`:
    - Se `nX > 5`, exibe `"Maior"`.
        
- Como `10 > 5`, aparece o alerta **Maior**.
---

### **3. `User Function IfElse()`**
- Variável `nX = 10`.
- Usa `IF ... ELSE ... ENDIF`:
    - Se `nX < 5`, define `cMsg = "Maior"`.
    - Caso contrário, define `cMsg = "Menor"`.
        
- Mostra o valor de `cMsg` → resultado: **Menor**.
---

### **4. `User Function ElseIf()`**
- Variável `cRegiao = "NE"`.
- Usa `IF ... ELSEIF ... ELSE ... ENDIF`:
    - Se for `"SE"`, define `nICMS = 18`.
    - Se for `"NE"`, define `nICMS = 7`.
    - Caso contrário, `nICMS = 12`.

- Mostra o valor → resultado: **7**.
---

### **5. `User Function Case()`**
- Variável `nOpc = 2`
- Usa `DO CASE ... ENDCASE`:
    - Se `nOpc == 1` → mostra `"Opcao 1 selecionada"`.
    - Se `nOpc == 2` → mostra `"Opcao 2 selecionada"`.
    - Se `nOpc == 3` → mostra `"Opcao 3 selecionada"`.
    - Se nenhum caso atender → executa `Otherwise`.

- Como `nOpc = 2`, o alerta exibido é: **Opcao 2 selecionada**.
