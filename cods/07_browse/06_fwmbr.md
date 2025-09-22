## 6 - Exercício
```prw
#Include "TOTVS.CH"
#Include "TopConn.ch"
#Include "FWMVCDef.ch"
#Include 'parmtype.ch'


// Define dos modos das rotinas

#DEFINE VISUALIZAR  2

//#DEFINE INCLUIR       3

#DEFINE ALTERAR     4

#DEFINE EXCLUIR     5

#DEFINE OK          1

#DEFINE CANCELA     2

#DEFINE ENTER       Chr(13)+Chr(10)

  

/*/{Protheus.doc} U_FWMBr1

    @type       Function

    @author     Milton J.dos Santos

    @since      01/03/2020

    @version    1.0.0

    @param      Nenhum

    @return     Vazio (nil)

    @example    Exemplo da utilizacao do FWMBrowse, cria um objeto do tipo grid, botões laterais e detalhes das

                colunas baseado no dicionário de dados

    @see        https://tdn.totvs.com/pages/releaseview.action?pageId=62390842

/*/

  

User Function FWMBr1()

  

    Local cFiltro   := ""

    Local oDlgMrk   := Nil

  

    Private cCadastro   := "Dados do Cliente"

    Private cAlias      := "SA1"

    //Private aRotina   := MenuDef()

    //Private aColumns  := {}

  

    cFiltro := ""       //  "SA1->A1_MSBLQL <> '1'"

  

    dbSelectArea(cAlias)

    (cAlias)->(dbSetOrder(1)) // A1_FILIAL + A1_COD

    (cAlias)->(dbGotop())

  

    dbSelectArea(cAlias)

    oBrowse := FWMBrowse():New()

    oBrowse:SetAlias( cAlias )

    oBrowse:SetDescription( cCadastro )

    oBrowse:SetFilterDefault( cFiltro )  

    oBrowse:SetSizeBrowse(100)

  

    // Legendas para o browse

    oBrowse:AddLegend('A1_MSBLQL == "1"', 'BR_VERMELHO' , 'Bloqueado'   )

    oBrowse:AddLegend('A1_MSBLQL == "2"', 'BR_VERDE'    , 'Ativo'       )

    oBrowse:AddLegend('A1_MSBLQL == " "', 'BR_AMARELO'  , 'Indefinido'  )

  

    cAliasMrk := "SA1"

  

    oMrkBrowse:SetFieldMark("A1_MSBLQL")

    oMrkBrowse:SetOwner(oDlgMrk)

    oMrkBrowse:SetAlias(cAliasMrk)

    oMrkBrowse:SetMenuDef("ATFA012")

    oMrkBrowse:bMark    := {|| AF012Mark(cAlias )}

    oMrkBrowse:bAllMark := {|| AF012Inv( cAlias ) }

    oMrkBrowse:SetDescription("")

    //oMrkBrowse:SetColumns(aColumns)

  

    oBrowse:Activate()

  

Return
```

ADVPL (linguagem usada no Protheus da TOTVS)**, e está construindo uma rotina FWMBrowse** (um grid para navegação de dados, com filtros, legendas e marcações). Vou detalhar linha a linha para você entender bem:

---

### **Cabeçalho de Includes**

```advpl
#Include "TOTVS.CH"
#Include "TopConn.ch"
#Include "FWMVCDef.ch"
#Include 'parmtype.ch'
```

- `TOTVS.CH` → contém definições e constantes do ambiente TOTVS/Protheus.
    
- `TopConn.ch` → usado para recursos de banco de dados via TopConnect.
    
- `FWMVCDef.ch` → traz definições do Framework MVC (camadas do Protheus).
    
- `parmtype.ch` → traz tipos de parâmetros usados em funções do Protheus.
    

---

### **Definições de constantes**

```advpl
#DEFINE VISUALIZAR 2
//#DEFINE INCLUIR   3
#DEFINE ALTERAR    4
#DEFINE EXCLUIR    5
#DEFINE OK         1
#DEFINE CANCELA    2
#DEFINE ENTER      Chr(13)+Chr(10)
```

- Constantes que representam ações ou valores fixos.
    
- Exemplo: `VISUALIZAR = 2`, `ALTERAR = 4`, etc.
    
- `ENTER` → combinação de **carriage return + line feed**.
    

---

### **Documentação da Função**

```advpl
/*/{Protheus.doc} U_FWMBr1
    @type      Function
    @author    Milton J.dos Santos
    @since     01/03/2020
    @version   1.0.0
    @param     Nenhum
    @return    Vazio (nil)
    @example   Exemplo da utilizacao do FWMBrowse, cria um objeto do tipo grid...
    @see       https://tdn.totvs.com/pages/releaseview.action?pageId=62390842
/*/
```

- Documentação no padrão Protheus Doc.
    
- Explica finalidade da função `U_FWMBr1`: criar um **FWMBrowse** com grid e botões laterais.
    
- `@see` → link para documentação oficial da TOTVS.
    

---

### **Início da função**

```advpl
User Function FWMBr1()

    Local cFiltro   := ""
    Local oDlgMrk   := Nil

    Private cCadastro := "Dados do Cliente"
    Private cAlias    := "SA1"
```

- `User Function FWMBr1()` → cria a função customizada **U_FWMBr1**, que pode ser chamada dentro do Protheus.
    
- `Local` → variáveis locais da função.
    
    - `cFiltro` = condição de filtro.
        
    - `oDlgMrk` = referência a uma janela de marcação (inicialmente vazia).
        
- `Private` → variáveis globais para a execução da função.
    
    - `cCadastro` = título da tela (“Dados do Cliente”).
        
    - `cAlias` = tabela **SA1** (Cadastro de Clientes).
        

---

### **Filtro e Seleção da Tabela**

```advpl
    cFiltro := ""      // "SA1->A1_MSBLQL <> '1'"

    dbSelectArea(cAlias)
    (cAlias)->(dbSetOrder(1)) // ordena pelo índice 1 (A1_FILIAL + A1_COD)
    (cAlias)->(dbGotop())
```

- Define filtro (vazio por enquanto).
    
- Seleciona a área/tabela `SA1`.
    
- Ordena pela chave primária do índice 1.
    
- `dbGotop()` → posiciona no primeiro registro.
    

---

### **Criação do Browse**

```advpl
    dbSelectArea(cAlias)
    oBrowse := FWMBrowse():New()
    oBrowse:SetAlias( cAlias )
    oBrowse:SetDescription( cCadastro ) 
    oBrowse:SetFilterDefault( cFiltro )  
    oBrowse:SetSizeBrowse(100)
```

- Cria o objeto `FWMBrowse` (grid).
    
- Define:
    
    - `Alias` → tabela que vai alimentar o browse (`SA1`).
        
    - `Description` → título da tela ("Dados do Cliente").
        
    - `FilterDefault` → filtro aplicado (ainda vazio).
        
    - `SizeBrowse(100)` → tamanho do grid.
        

---

### **Legendas do Browse**

```advpl
    oBrowse:AddLegend('A1_MSBLQL == "1"', 'BR_VERMELHO' , 'Bloqueado' )
    oBrowse:AddLegend('A1_MSBLQL == "2"', 'BR_VERDE'    , 'Ativo'     )
    oBrowse:AddLegend('A1_MSBLQL == " "', 'BR_AMARELO'  , 'Indefinido')
```

- Adiciona cores e legendas de status, baseadas no campo `A1_MSBLQL`.
    
    - Se for `"1"` → vermelho = **Bloqueado**.
        
    - Se for `"2"` → verde = **Ativo**.
        
    - Se vazio `" "` → amarelo = **Indefinido**.
        

---

### **Configuração de marcações**

```advpl
    cAliasMrk := "SA1"

    oMrkBrowse:SetFieldMark("A1_MSBLQL")
    oMrkBrowse:SetOwner(oDlgMrk)
    oMrkBrowse:SetAlias(cAliasMrk)
    oMrkBrowse:SetMenuDef("ATFA012") 
    oMrkBrowse:bMark    := {|| AF012Mark(cAlias )}
    oMrkBrowse:bAllMark := {|| AF012Inv( cAlias ) }
    oMrkBrowse:SetDescription("")
    //oMrkBrowse:SetColumns(aColumns)
```

- Configura **marcações de registros** no browse.
    
- `SetFieldMark("A1_MSBLQL")` → campo que indica se está marcado.
    
- `SetOwner(oDlgMrk)` → associa ao diálogo de marcação.
    
- `SetAlias(cAliasMrk)` → usa `SA1`.
    
- `SetMenuDef("ATFA012")` → associa menu padrão da rotina.
    
- `bMark` → bloco de código para marcar registros.
    
- `bAllMark` → bloco para marcar todos/desmarcar todos.
    
- `SetDescription("")` → sem descrição extra.
    
- `SetColumns(aColumns)` → comentado, mas seria para personalizar colunas.
    

---

### **Ativação**

```advpl
    oBrowse:Activate()
```

- Exibe o **grid** na tela para o usuário interagir.
    

---

### **Final**

```advpl
Return
```

- Finaliza a função retornando `Nil` (vazio).
    

---

📌 **Resumo do que esse código faz:**  
Ele cria uma **tela de browse (grid)** no Protheus, mostrando os **clientes (SA1)**.

- Aplica filtro (vazio no exemplo).
    
- Mostra legenda colorida (Bloqueado, Ativo, Indefinido).
    
- Configura opções de marcação de registros.
    
- Abre a tela com `oBrowse:Activate()`.
    

---

Quer que eu refaça esse código com comentários embutidos linha a linha, tipo um **código anotado**, para ficar mais fácil estudar?

