## 13 - Exercício
```prw
#INCLUDE "TOTVS.CH"

#INCLUDE "FWMVCDEF.CH"

  

/*/{Protheus.doc} MrkBrw3

    @type       Function

    @author     Milton J.dos Santos

    @since      01/03/2020

    @version    1.0.0

    @param      Nenhum

    @return     Vazio (nil)

    @example    Exemplo da utilizacao de FWMrkBrw

    @see        https://tdn.totvs.com/display/public/framework/MarkBrow

/*/

  

User Function MrkBrw3()

Private oBrowse

Private aRotina := MenuDef()

  

    oBrowse := FWMarkBrowse():New()

    oBrowse:SetAlias("GXI")                         // Alias da tabela utilizada

    oBrowse:SetMenuDef("GFEA116")                   // Nome do fonte onde esta a função MenuDef

    oBrowse:SetFieldMark("GXI_MARKBR")

    oBrowse:SetDescription("Recebimento de Fatura de Frete")        // Descrição do browse      //"Recebimento de Fatura de Frete"

    oBrowse:SetAllMark({|| GFEA116MARK()})

    oBrowse:AddLegend("GXI_EDISIT == '1'", "BLUE"  , "Importado" ) //Legenda do Browser //"Importado"

    oBrowse:AddLegend("GXI_EDISIT == '2'", "YELLOW", "Importado com erro") //"Criado"

    oBrowse:AddLegend("GXI_EDISIT == '3'", "RED"   , "Rejeitado" ) //"Rejeitado"

    oBrowse:AddLegend("GXI_EDISIT == '4'", "GREEN" , "Processado")

    oBrowse:Activate()                                      

  

Return(Nil)

  

//-------------------------------------------------------

//  MenuDef

//-------------------------------------------------------

Static Function MenuDef()

Local aRotina := {}

    ADD OPTION aRotina TITLE "Pesquisar"        ACTION "AxPesqui"        OPERATION 1 ACCESS 0   // "Pesquisar"

    ADD OPTION aRotina TITLE "Visualizar"       ACTION "VIEWDEF.GFEA116" OPERATION 2 ACCESS 0   // "Visualizar"

    ADD OPTION aRotina TITLE "Importar"         ACTION "GFEA116IMP()"    OPERATION 3 ACCESS 0   // "Importar"

    ADD OPTION aRotina TITLE "Alterar"          ACTION "VIEWDEF.GFEA116" OPERATION 4 ACCESS 0   // "Alterar"

    ADD OPTION aRotina TITLE "Processar"        ACTION "GFEA116PRO()"    OPERATION 6 ACCESS 0   // "Processar"

    ADD OPTION aRotina TITLE "Excluir Sel."     ACTION "GFEA116EXC()"    OPERATION 5 ACCESS 0   // "Excluir Todos"

    ADD OPTION aRotina TITLE "Selecionar Todos" ACTION "GFEA116MKT()"    OPERATION 5 ACCESS 0   // "Selecionar Todos"

    ADD OPTION aRotina TITLE "Imprimir"         ACTION "VIEWDEF.GFEA116" OPERATION 8 ACCESS 0   // "Imprimir"

Return aRotina
```
 **FWMarkBrowse** (a versão mais moderna do `MarkBrow`).  

1. **Resumo:**  
    Esse código cria um **browser no Protheus** para a tabela `GXI`, permitindo marcar/desmarcar registros, aplicar legenda colorida, e executar ações de menu (Pesquisar, Visualizar, Importar, Processar etc).

---

```advpl
#INCLUDE "TOTVS.CH"
#INCLUDE "FWMVCDEF.CH"
```

- Inclui bibliotecas do Protheus.
    
    - `TOTVS.CH`: definições globais (constantes, funções do ERP).
        
    - `FWMVCDEF.CH`: macros/defines para MVC e FWMarkBrowse.
        

---

```advpl
/*/{Protheus.doc} MrkBrw3
...
/*/
```

- Cabeçalho de documentação TOTVS DOC, descreve a função (nome, autor, versão, uso).
    

---

```advpl
User Function MrkBrw3()
```

- Declara a função principal `U_MrkBrw3`, que pode ser executada pelo usuário no Protheus.
    

---

```advpl
Private oBrowse
Private aRotina := MenuDef()
```

- `oBrowse`: objeto que representará o browser.
    
- `aRotina`: recebe as opções de menu criadas na função `MenuDef`.
    

---

```advpl
oBrowse := FWMarkBrowse():New()
```

- Cria uma instância da classe `FWMarkBrowse`, que controla o browser com marcação.
    

---

```advpl
oBrowse:SetAlias("GXI")
```

- Define o alias (tabela) que será exibida no browser → neste caso, **tabela GXI**.
    

---

```advpl
oBrowse:SetMenuDef("GFEA116")
```

- Define a fonte (programa) que contém a função `MenuDef` para construir o menu.
    
- Aqui está associado ao fonte `"GFEA116"`.
    

---

```advpl
oBrowse:SetFieldMark("GXI_MARKBR")
```

- Define qual campo da tabela será usado para guardar a marcação (`X`, vazio etc).
    
- Neste caso, o campo `GXI_MARKBR`.
    

---

```advpl
oBrowse:SetDescription("Recebimento de Fatura de Frete")
```

- Define a descrição (título) do browser exibido para o usuário.
    

---

```advpl
oBrowse:SetAllMark({|| GFEA116MARK()})
```

- Define a função que será chamada quando o usuário selecionar "Marcar todos".
    
- Aqui chama a `GFEA116MARK()`.
    

---

```advpl
oBrowse:AddLegend("GXI_EDISIT == '1'", "BLUE"  , "Importado")
oBrowse:AddLegend("GXI_EDISIT == '2'", "YELLOW", "Importado com erro")
oBrowse:AddLegend("GXI_EDISIT == '3'", "RED"   , "Rejeitado")
oBrowse:AddLegend("GXI_EDISIT == '4'", "GREEN" , "Processado")
```

- Define as **legendas (cores e descrições)** para o browser:
    
    - Se `GXI_EDISIT == '1'` → azul → “Importado”.
        
    - Se `GXI_EDISIT == '2'` → amarelo → “Importado com erro”.
        
    - Se `GXI_EDISIT == '3'` → vermelho → “Rejeitado”.
        
    - Se `GXI_EDISIT == '4'` → verde → “Processado”.
        

---

```advpl
oBrowse:Activate()
```

- Ativa o browser, exibindo-o na tela para o usuário.
    

---

```advpl
Return(Nil)
```

- Finaliza a função principal.
    

---

### Função auxiliar: MenuDef

```advpl
Static Function MenuDef()
Local aRotina := {}
```

- Cria uma função estática que define as opções de menu que aparecerão no browser.
    
- `aRotina` guarda essas opções.
    

---

```advpl
ADD OPTION aRotina TITLE "Pesquisar"        ACTION "AxPesqui"        OPERATION 1 ACCESS 0
ADD OPTION aRotina TITLE "Visualizar"       ACTION "VIEWDEF.GFEA116" OPERATION 2 ACCESS 0
ADD OPTION aRotina TITLE "Importar"         ACTION "GFEA116IMP()"    OPERATION 3 ACCESS 0
ADD OPTION aRotina TITLE "Alterar"          ACTION "VIEWDEF.GFEA116" OPERATION 4 ACCESS 0
ADD OPTION aRotina TITLE "Processar"        ACTION "GFEA116PRO()"    OPERATION 6 ACCESS 0
ADD OPTION aRotina TITLE "Excluir Sel."     ACTION "GFEA116EXC()"    OPERATION 5 ACCESS 0
ADD OPTION aRotina TITLE "Selecionar Todos" ACTION "GFEA116MKT()"    OPERATION 5 ACCESS 0
ADD OPTION aRotina TITLE "Imprimir"         ACTION "VIEWDEF.GFEA116" OPERATION 8 ACCESS 0
```

- Adiciona opções no menu do browser:
    
    - Pesquisar (`AxPesqui`)
        
    - Visualizar (`VIEWDEF.GFEA116`)
        
    - Importar (`GFEA116IMP()`)
        
    - Alterar (`VIEWDEF.GFEA116`)
        
    - Processar (`GFEA116PRO()`)
        
    - Excluir selecionados (`GFEA116EXC()`)
        
    - Selecionar todos (`GFEA116MKT()`)
        
    - Imprimir (`VIEWDEF.GFEA116`)
        

---

```advpl
Return aRotina
```

- Retorna o array com as opções de menu para ser usado pelo browser.
    

---

✅ **Resumo final:**  
Esse código monta um **FWMarkBrowse para a tabela GXI**, com cores, menu de ações e marcação de registros, servindo para controlar o processo de **Recebimento de Fatura de Frete**.

---