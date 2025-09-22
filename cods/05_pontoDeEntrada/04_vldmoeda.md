## 4 - Exercício
```prw
#Include 'TOTVS.CH'

/*/{Protheus.doc} U_VldMoeda
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao de VldMoeda
    @see        https://tdn.totvs.com/display/public/PROT/VldMoeda
/*/


/*

    Ponto de entrada executado na aÃ§Ã£o de confirmaÃ§Ã£o  quando
    Ã© informado a taxa da moeda. Permite ao usuÃ¡rio   validar
    se as taxas informadas sÃ£o vÃ¡lidaas de acordo com a regra
    jÃ¡ definida.
*/

  

User Function VldMoeda()

    Local aValores  := ParamIxb[1]
    Local cModule   := ParamIxb[2]
    Local lValido   := .F.

    lValido := MsgYesNo("A moeda estÃ¡ certa ?")

Return lValido
```


---

### **1. Cabeçalho**

```advpl
#Include 'TOTVS.CH'
```

- Importa a biblioteca de constantes e funções padrão do Protheus.
    

---

### **2. Documentação do Ponto de Entrada**

```advpl
/*/{Protheus.doc} U_VldMoeda
    @type		Function
    @author		Milton J.dos Santos
    @since		01/03/2020
    @version	1.0.0
    @param		Nenhum
    @return		Vazio (nil)
    @example    Exemplo da utilizacao de VldMoeda
    @see		https://tdn.totvs.com/display/public/PROT/VldMoeda
/*/
```

- Esse bloco é padrão de **documentação do Protheus**.
    
- Informa: autor, versão, parâmetros, retorno, exemplo e até link para a documentação oficial no **TDN da TOTVS**.
    

---

### **3. Descrição Funcional**

```advpl
/*
	Ponto de entrada executado na ação de confirmação quando
	é informado a taxa da moeda. Permite ao usuário validar
	se as taxas informadas são válidas de acordo com a regra
	já definida.
*/
```

- Esse trecho explica que a função é um **ponto de entrada**:
    
    - Ele é disparado no **momento em que o usuário confirma a taxa de uma moeda** no sistema.
        
    - Serve para validar (ou rejeitar) a taxa informada, conforme alguma regra de negócio.
        

---

### **4. Implementação**

```advpl
User Function VldMoeda()
    Local aValores	:= ParamIxb[1]
    Local cModule	:= ParamIxb[2]
    Local lValido	:= .F.

    lValido := MsgYesNo("A moeda está certa ?")

Return lValido
```

- **`User Function VldMoeda()`** → define a função de usuário chamada pelo Protheus.
    
- **`ParamIxb[1]`** → contém os **valores da moeda** (ex.: cotação, data, etc.).
    
- **`ParamIxb[2]`** → contém o **módulo** de onde a função foi chamada (ex.: SIGAFIN, SIGACOM, etc.).
    
- **`lValido := .F.`** → inicia como "falso" (não validado).
    
- **`MsgYesNo("A moeda está certa ?")`** → abre uma caixinha de **confirmação para o usuário**.
    
    - Se ele clicar **Sim**, retorna `.T.` (verdadeiro).
        
    - Se clicar **Não**, retorna `.F.`.
        
- **`Return lValido`** → devolve o resultado para o Protheus (se a taxa da moeda foi aceita ou não).
    

---

### **Resumindo**

Esse código é um **ponto de entrada do Protheus (VldMoeda)** que permite ao usuário **validar a taxa da moeda** informada.  
Na versão apresentada, ele só pergunta: _"A moeda está certa?"_.  
Dependendo da resposta do usuário:

- **Sim → continua o processo**
    
- **Não → cancela a operação**
    

---

👉 Na prática, você pode substituir esse `MsgYesNo` por regras mais complexas (ex.: validar se a taxa está dentro de um intervalo, se não está muito defasada, etc.).

---


