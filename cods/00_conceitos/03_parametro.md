## 3 - Exercício

```
#INCLUDE "TOTVS.CH"


/*/
    Programa.: Parametro.PRW
    Autor....: Milton J.dos Santos
    Data.....: 01/01/2020


    Parametros sao muito usados para enviar informacopes ( variaveis) para outro bloco processar

    Nos exemplos abaixo temos:

    - U_Parametros()   que nao espera parametro e nao envia parametro
    - DefaultExample() que nao espera parametro e nao envia parametro e depois envia parametro
    - OldFunction()    que espera parametro, se nao recebe-lo usa um valor padrao, se rebecer o-utiliza

/*/

  

User Function Parametros
	// Rotina nao esta enviando parametro
	DefaultExample()
RETURN

  
// Funcao nao espera parametro

Static Function DefaultExample()

		//  Rotina sem paramentro
    Alert( OldFunction() )      
		//  Rotina com paramentro
    Alert( OldFunction(33) )
Return

  

// Rotina espera um parametro nNewPar

Static Function OldFunction( nNewPar )
	Local nRet      := 0

	// Caso o parametro nNewPar esteja vazio, utiliza o valor padrao 10
	Default nNewPar := 10

     // Uso o nNewPar sem problema
     nRet := 10 * nNewPar

// Variavel de Retorno "nRet"
Return nRet
```

### **1. `#INCLUDE "TOTVS.CH"`**
- Inclui a biblioteca principal do Protheus.
- Necessário para usar funções como `Alert()`.
---

### **2. `User Function Parametros`**
- Função de entrada do programa (chamada como `U_PARAMETROS()`).
- Aqui ela só chama a `DefaultExample()`, sem passar parâmetro.
---

### **3. `Static Function DefaultExample()`**
- Função auxiliar, **não espera parâmetros**.
- Dentro dela:
    - Primeira linha: `Alert( OldFunction() )` → chama a função `OldFunction` sem parâmetro.
    - Segunda linha: `Alert( OldFunction(33) )` → chama a mesma função, mas agora passando o valor `33`.
---

### **4. `Static Function OldFunction( nNewPar )`**
- Função que **espera um parâmetro** (`nNewPar`).
- Se não receber nada, usa um valor padrão graças ao comando:
    `Default nNewPar := 10`
    👉 Ou seja, se o parâmetro vier vazio, `nNewPar` recebe 10.
- Depois calcula `nRet := 10 * nNewPar`.
- Retorna esse valor.
---

### **5. Fluxo de execução**
1. Você executa `U_PARAMETROS()`.
2. Ele chama `DefaultExample()`.
3. Dentro dela:

    - `Alert( OldFunction() )` → como não passa parâmetro, `nNewPar = 10` (default). Resultado: `10 * 10 = 100`.
        
    - `Alert( OldFunction(33) )` → agora passa `33`. Resultado: `10 * 33 = 330`.
4. O usuário vê dois alerts: **100** e **330**.



