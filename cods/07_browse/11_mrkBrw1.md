## 11 - Exercício
```prw
#Include 'TOTVS.CH'

#Include 'FWMVCDef.ch'

  

/*/{Protheus.doc} U_MrkBrw1

    @type       Function

    @author     Milton J.dos Santos

    @since      01/03/2020

    @version    1.0.0

    @param      Nenhum

    @return     Vazio (nil)

    @example    Exemplo da utilizacao de MarkBrow

    @see        https://tdn.totvs.com/display/public/framework/MarkBrow

/*/

/*

    O componente visual MarkBrow permite que os elementos de um browser sejam marcados ou desmarcados.

  

    Exemplos de tabelas que tem o campo OK para testar essa rotina

        SA2 - A2_OK

        SA6 - A6_OK

        SB1 - B1_OK

        SB7 - B7_OK

        SC9 - C9_OK

        SF1 - F1_OK

        SD1 - D1_OK

        SF2 - F2_OK

        SD2 - D2_OK

        SE1 - E1_OK

        SE2 - E2_OK

*/

  

User Function MrkBrw1()

Private aRotina := MenuDef()

MarkBrow("SE1","E1_OK",,,.T.,GetMark())


Return


Static Function MenuDef()

Local aRotina := {}

  

//ADD OPTION aRotina TITLE "Pesquisar"        ACTION 'PesqBrw'    OPERATION 1 ACCESS 0

//ADD OPTION aRotina Title 'Visualizar'       Action 'AxVisual'   OPERATION 2 ACCESS 0

//ADD OPTION aRotina Title 'Incluir'          Action 'AxInclui'   OPERATION 3 ACCESS 0

//ADD OPTION aRotina Title 'Alterar'          Action 'AxAltera'   OPERATION 4 ACCESS 0

//ADD OPTION aRotina Title 'Excluir'          Action 'AxDeleta'   OPERATION 5 ACCESS 0

ADD OPTION aRotina Title 'Rotina Browser'   Action 'U_Posic()'  OPERATION 2 ACCESS 0

  
Return aRotina

  

User Function Posic()

oObjMBrw:= GetMarkBrow()
oObjMBrw:oBrowse:GoTop()
oObjMBrw:oBrowse:Refresh()


Return
```

Esse código serve para **abrir um browser no Protheus com a função MarkBrow, permitindo marcar e desmarcar registros de uma tabela (ex.: SE1 – Contas a Receber)**

---

### **1. Includes (importações de cabeçalhos)**

```advpl
#Include 'TOTVS.CH'
#Include 'FWMVCDef.ch'
```

- `TOTVS.CH`: contém definições e constantes gerais do ambiente Protheus.
    
- `FWMVCDef.ch`: contém definições relacionadas ao **framework MVC** do Protheus (usado em rotinas visuais).
    

---

### **2. Documentação**

```advpl
/*/{Protheus.doc} U_MrkBrw1
    @type      Function
    @author    Milton J.dos Santos
    @since     01/03/2020
    @version   1.0.0
    @param     Nenhum
    @return    Vazio (nil)
    @example   Exemplo da utilizacao de MarkBrow
    @see       https://tdn.totvs.com/display/public/framework/MarkBrow
/*/
```

- Esse bloco é um **padrão de documentação TOTVS**.
    
- Identifica a função, autor, data, versão, exemplo e link de referência.
    

---

### **3. Comentário explicativo**

```advpl
/*
    O componente visual MarkBrow permite que os elementos de um browser sejam marcados ou desmarcados.

    Exemplos de tabelas que tem o campo OK para testar essa rotina
        SA2 - A2_OK
        SA6 - A6_OK
        SB1 - B1_OK
        SB7 - B7_OK
        SC9 - C9_OK
        SF1 - F1_OK
        SD1 - D1_OK
        SF2 - F2_OK
        SD2 - D2_OK
        SE1 - E1_OK
        SE2 - E2_OK
*/
```

- Explica o objetivo: **MarkBrow** é um componente visual que permite **marcar/desmarcar registros em um browse**.
    
- Lista tabelas de exemplo que já possuem o campo `OK` para testes.
    

---

### **4. Função principal**

```advpl
User Function MrkBrw1()
```

- Função **pública**, ou seja, pode ser executada diretamente no ambiente Protheus.
    
- Esse é o ponto de entrada da rotina.
    

---

### **5. Definição do menu da rotina**

```advpl
Private aRotina := MenuDef()
```

- Chama a função `MenuDef()` para criar as opções de menu da rotina.
    
- `aRotina` é uma **array com as opções** que aparecem no menu do browse.
    

---

### **6. Criação do MarkBrow**

```advpl
MarkBrow("SE1","E1_OK",,,.T.,GetMark())
```

- Cria e exibe o **MarkBrow**.
    
- Parâmetros:
    
    - `"SE1"` → tabela utilizada (documentos de entrada de nota fiscal).
        
    - `"E1_OK"` → campo de marcação da tabela.
        
    - Os parâmetros intermediários estão vazios `,,` → não foram usados.
        
    - `.T.` → indica que é para habilitar a marcação.
        
    - `GetMark()` → define o valor que será gravado no campo quando o registro for marcado.
        

---

### **7. Final da função principal**

```advpl
Return
```

- Encerra a função `MrkBrw1()`.
    

---

### **8. Função auxiliar para criar menu**

```advpl
Static Function MenuDef()
Local aRotina := {}
```

- Define a função estática `MenuDef()`.
    
- `aRotina` é inicializado como array vazio.
    

---

### **9. Opções de menu**

```advpl
//ADD OPTION aRotina TITLE "Pesquisar"        ACTION 'PesqBrw'    OPERATION 1 ACCESS 0 
//ADD OPTION aRotina Title 'Visualizar'       Action 'AxVisual'   OPERATION 2 ACCESS 0
//ADD OPTION aRotina Title 'Incluir'          Action 'AxInclui'   OPERATION 3 ACCESS 0
//ADD OPTION aRotina Title 'Alterar'          Action 'AxAltera'   OPERATION 4 ACCESS 0
//ADD OPTION aRotina Title 'Excluir'          Action 'AxDeleta'   OPERATION 5 ACCESS 0
ADD OPTION aRotina Title 'Rotina Browser'   Action 'U_Posic()'  OPERATION 2 ACCESS 0
```

- Essas linhas adicionam opções ao menu da rotina.
    
- As primeiras estão **comentadas** (não entram no código).
    
- A linha ativa é:
    
    - `"Rotina Browser"`: título da opção.
        
    - `Action 'U_Posic()'`: ao selecionar, executa a função `Posic`.
        
    - `OPERATION 2`: código da operação (normalmente ligado a visualizar).
        
    - `ACCESS 0`: nível de acesso (0 = sem restrição).
        

---

### **10. Retorno do menu**

```advpl
Return aRotina
```

- Retorna o array de opções para ser usado no `MarkBrow`.
    

---

### **11. Função auxiliar Posic**

```advpl
User Function Posic()

oObjMBrw:= GetMarkBrow()
oObjMBrw:oBrowse:GoTop()
oObjMBrw:oBrowse:Refresh()

Return
```

- Função chamada pelo menu `"Rotina Browser"`.
    
- `GetMarkBrow()` → recupera o objeto atual do MarkBrowse.
    
- `oObjMBrw:oBrowse:GoTop()` → posiciona o cursor no primeiro registro.
    
- `oObjMBrw:oBrowse:Refresh()` → atualiza a tela do browse.
    

---

## **Resumo do funcionamento**

1. A função `MrkBrw1()` abre um **MarkBrow** da tabela `SE1`, permitindo marcar registros no campo `E1_OK`.
    
2. O menu da rotina é definido pela função `MenuDef()`, que cria a opção `"Rotina Browser"`.
    
3. Quando essa opção é escolhida, a função `Posic()` é chamada, reposicionando o browse no primeiro registro e atualizando a tela.
    

---

