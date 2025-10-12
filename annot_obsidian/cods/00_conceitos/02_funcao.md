## 2 - Exercício
```prw
#INCLUDE "TOTVS.CH"

/*/
 
    Programa.: Funcao.PRW
    Funcao...: U_Funcao()
    Autor....: Milton J.dos Santos
    Data.....: 01/01/2020

    Regras na criação de funcoes:
    - USER FUNCTION   = Funcao criada pelo Usuario
    - FUNCTION        = Funcao criada pela TOTVS
    - STATIC FUNCTION = Funcao criada pelo Usuario e pela TOTVS, porém só vista pelas funcoes do PRW ATUAL

/*/



// Esta funcao e chamada como U_FUNCAO()

User Function FUNCAO
	Alert("User Function = U_FUNCAO")

	FUNCAO()        // <-- chama a Static Function
RETURN

// Esta funcao e chamada como FUNCAO()

Static Function FUNCAO
	Alert("Static Function = FUNCAO")
RETURN


```

- **User Function** → É a que você chama no Protheus (com `U_` no nome).
- **Function** → Funções internas da TOTVS, já prontas no sistema.
- **Static Function** → Auxiliares, só funcionam dentro do mesmo programa `.PRW`.
	- Isso significa que **outras funções dentro do mesmo arquivo** podem chamá-la, mas se você tentar usar essa função em **outro arquivo `.PRW`**, vai dar erro (ela não existe fora dali).

---

### **1. `#INCLUDE "TOTVS.CH"`**
- Inclui a biblioteca padrão do Protheus.
- Necessária para usar funções como `Alert()`.
---

### **2. `User Function FUNCAO`**
- Declara uma **função de usuário** chamada `FUNCAO`.
- Pode ser chamada no Protheus como `U_FUNCAO()`.
---

### **3. `Alert("User Function = U_FUNCAO")`**
- Mostra uma mensagem na tela.
- Aqui exibe: **User Function = U_FUNCAO**.
---

### **4. `FUNCAO()`**
- Chama a função `FUNCAO()` declarada mais abaixo no código.
- Como ela é **Static Function**, só pode ser chamada dentro deste mesmo arquivo `.PRW`.
---

### **5. `RETURN` (da User Function)**
- Finaliza a execução da `User Function FUNCAO`.
---

### **6. `Static Function FUNCAO`**
- Declara uma **função estática**.
- Diferente da `User Function`, só pode ser usada dentro do próprio arquivo `.PRW`.
- Não pode ser chamada diretamente no Protheus.
---

### **7. `Alert("Static Function = FUNCAO")`**
- Exibe a mensagem: **Static Function = FUNCAO**.
---

### **8. `RETURN` (da Static Function)**
- Finaliza a execução da `Static Function FUNCAO`.

---

|Tipo de Função|Como é chamada|Onde pode ser usada|Quem cria normalmente|Observações|
|---|---|---|---|---|
|**User Function**|`U_NomeFuncao()` (prefixo **U_**)|Em qualquer lugar do Protheus|Usuário (desenvolvedor)|Serve como “porta de entrada” para executar códigos customizados no Protheus.|
|**Function**|`NomeFuncao()` (sem U_)|Em qualquer lugar do Protheus|TOTVS|Geralmente funções padrão do sistema (nativas). Não usamos para customização.|
|**Static Function**|`NomeFuncao()`|Apenas dentro do mesmo arquivo `.PRW`|Usuário ou TOTVS|Usada como função auxiliar. Não aparece como `U_`, não pode ser chamada diretamente pelo Protheus.|