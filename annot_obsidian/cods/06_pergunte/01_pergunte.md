## 1 - Exercício
```prw
#Include 'TOTVS.CH'

/*/{Protheus.doc} U_PERGUNTE
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao do comando PERGUNTE
    @see        https://tdn.totvs.com/pages/releaseview.action?pageId=6814979
/*/


User Function Pergunte()    

    Pergunte("MATR030", .T.)

    If MV_PAR01 == 1
        ApMsgInfo("Opção escolhida foi a 1")

    Else    
        ApMsgInfo("Opção escolhida foi a 2")

    EndIf
    

Return
```


---

### 📌 Cabeçalho

```advpl
#Include 'TOTVS.CH'
```

- Inclui o arquivo de definições padrão do Protheus (constantes, funções, macros etc.).
    

---

### 📌 Documentação

```advpl
/*/{Protheus.doc} U_PERGUNTE
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao do comando PERGUNTE
    @see        https://tdn.totvs.com/pages/releaseview.action?pageId=6814979
/*/
```

- É a documentação padrão para identificar a função dentro do Protheus.
    
- Mostra autor, data, versão, retorno e um link para a documentação oficial.
    

---

### 📌 Implementação

```advpl
User Function Pergunte()     

    Pergunte("MATR030", .T.) 

    If MV_PAR01 == 1
        ApMsgInfo("Opção escolhida foi a 1")
    Else    
        ApMsgInfo("Opção escolhida foi a 2")
    EndIf

Return 
```

#### 🔎 O que acontece aqui:

1. **`Pergunte("MATR030", .T.)`**
    
    - O comando `Pergunte` abre um **formulário de parâmetros** definido previamente (no caso, a pergunta chamada `MATR030`).
        
    - O `.T.` significa que ele vai **forçar a exibição da janela**, mesmo que já tenha valores preenchidos em memória.
        
    
    ⚠ Essas perguntas (`MATR030`) são configuradas via **dicionário de dados SX1**.  
    Cada “Pergunte” pode ter até 10 parâmetros (`MV_PAR01` a `MV_PAR10`).
    
2. **`MV_PAR01`**
    
    - Após o usuário responder, o valor da primeira pergunta fica armazenado em **MV_PAR01**.
        
    - Aqui ele verifica se o usuário escolheu `1` ou não.
        
3. **`ApMsgInfo("texto")`**
    
    - Exibe uma mensagem na tela informando a escolha do usuário.
        

---

### 📌 Resumindo

Esse código cria uma função chamada `U_Pergunte` que:

1. Exibe uma tela de parâmetros definida no SX1 (`MATR030`).
    
2. Lê a resposta do usuário no `MV_PAR01`.
    
3. Mostra uma mensagem diferente dependendo da escolha.
    

---

### 💡 Exemplo prático

Imagine que você configurou no SX1 a pergunta `MATR030` com:

- **MV_PAR01 = Opção (1=Sim, 2=Não)**
    

Quando executar `U_Pergunte()`:

- Se escolher **1**, aparece → “Opção escolhida foi a 1”.
    
- Se escolher **2**, aparece → “Opção escolhida foi a 2”.
    

---

