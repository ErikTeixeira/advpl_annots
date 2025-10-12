## 14 - Exercício
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
Cria uma interface gráfica tipo **explorador de arquivos**, com **botões customizados, árvore de itens com subitens**, e exibe **mensagens específicas em cada painel** quando cada item é selecionado.

---



```advpl
#INCLUDE "PROTHEUS.CH"
```

Inclui o arquivo de cabeçalho padrão do Protheus, necessário para acessar funções e constantes do sistema.

---

```advpl
User Function MsExplorer()
```

Declara uma função de usuário chamada `MsExplorer`.

---

```advpl
Local oDlg := Nil
Local oExpl := Nil
Local aPanels := {}
```

- `oDlg` → variável para referência a um diálogo (aqui inicializada como `Nil`).
    
- `oExpl` → variável que vai armazenar o objeto MsExplorer.
    
- `aPanels` → array que vai armazenar os painéis de cada item da árvore.
    

---

```advpl
oExpl := MsExplorer():New("Titulo da MsExplorer",10,10,400,700,oDlg,/*lToolBar*/,/*lAddressBar*/,/*lDefBar*/,/*oTreeFont*/,/*cBitmap*/,/*nBmpWidth*/,/*oParent*/)
```

Cria uma **instância do objeto MsExplorer** com título `"Titulo da MsExplorer"` e dimensões 400x700 na posição 10,10, associando ao diálogo `oDlg`. Outros parâmetros opcionais estão comentados.

---

```advpl
oExpl:AddDefButton("CLIPS","ToolTip 01",{|| MsgInfo("Botao ZeroUm","Titulo") },/*cDefaultAct*/,/*bWhen*/,/*nWidth*/,"Botao Zero Um - 01")
```

Adiciona um botão chamado **CLIPS** com tooltip `"ToolTip 01"`. Ao ser clicado, exibe a mensagem `"Botao ZeroUm"`.  
As próximas linhas adicionam outros botões com nomes, tooltips e ações diferentes:

```advpl
oExpl:AddDefButton("CLIENTE","ToolTip 02",{|| MsgInfo("Botao ZeroDois","Titulo") },/*cDefaultAct*/,/*bWhen*/,/*nWidth*/,"Botao Zero Um - 02")
oExpl:AddDefButton("CHAT","ToolTip 03",{|| MsgInfo("Botao ZeroTres","Titulo") },/*cDefaultAct*/,/*bWhen*/,/*nWidth*/,"Botao Zero Um - 03")
oExpl:AddDefButton("COMSOM","ToolTip 04",{|| MsgInfo("Botao ZeroQuatro","Titulo") },/*cDefaultAct*/,/*bWhen*/,/*nWidth*/,"Botao Zero Um - 04")
oExpl:AddDefButton("CARGA","ToolTip 04",{|| MsgInfo("Botao ZeroCinco","Titulo") },/*cDefaultAct*/,/*bWhen*/,/*nWidth*/,"Botao Zero Um - 05")
```

---

```advpl
aAdd(aPanels, oExpl:AddTree("Item01","BR_LARANJA","BR_VERDE","#1000",.T.))
```

Cria um **item principal da árvore** chamado `"Item01"` com cores de fundo e texto definidas e adiciona o painel retornado ao array `aPanels`.

---

```advpl
aAdd(aPanels, oExpl:AddItem("S1.1","BR_ROXO","#1100",.T.))
aAdd(aPanels, oExpl:AddItem("S1.2","BR_ROXO","#1200",.T.))
```

Adiciona **subitens** `"S1.1"` e `"S1.2"` ao item `"Item01"` e armazena seus painéis no array `aPanels`.

---

```advpl
aAdd(aPanels, oExpl:AddTree("S1.3","BR_PRETO","BR_BRANCO","#1300",.T.))
aAdd(aPanels, oExpl:AddItem("S1.3.1","BR_ROXO","#1310",.T.))
aAdd(aPanels, oExpl:AddItem("S1.3.2","BR_ROXO","#1320",.T.))
aAdd(aPanels, oExpl:AddItem("S1.3.3","BR_ROXO","#1330",.T.))
```

Cria um **subitem composto** `"S1.3"` e adiciona subitens a ele (`S1.3.1`, `S1.3.2`, `S1.3.3`).

---

```advpl
oExpl:EndTree() // Fecha subitem
oExpl:EndTree() // Fecha item
```

Finaliza o item composto (`S1.3`) e depois o item principal (`Item01`).

---

```advpl
aAdd(aPanels, oExpl:AddTree("Item02","BR_LARANJA","BR_VERDE","#2000",.T.))
aAdd(aPanels, oExpl:AddItem("S2.1","BR_ROXO","#2100",.T.))
aAdd(aPanels, oExpl:AddItem("S2.2","BR_ROXO","#2200",.T.))
oExpl:EndTree() //Fecha Item
```

Cria um **segundo item da árvore** (`Item02`) com dois subitens (`S2.1` e `S2.2`) e finaliza o item.

---

```advpl
@50,50 SAY "SELECIONOU A OPCAO: Item01" PIXEL SIZE 150,25 OF oExpl:GetPanel(aPanels[ 1])
```

Escreve a mensagem `"SELECIONOU A OPCAO: Item01"` no **painel do item 1**, usando coordenadas e tamanho de texto pixelizado.  
As linhas seguintes fazem o mesmo para todos os subitens:

```advpl
@50,50 SAY "SELECIONOU A OPCAO: S1.1" PIXEL SIZE 150,25 OF oExpl:GetPanel(aPanels[ 2])
...
@50,50 SAY "SELECIONOU A OPCAO: S2.2" PIXEL SIZE 150,25 OF oExpl:GetPanel(aPanels[10])
```

---

```advpl
oExpl:Activate(.T.)
```

Ativa a interface gráfica, mostrando a MsExplorer para o usuário.

---

```advpl
Return ""
```

Encerra a função retornando uma string vazia.

---

✅ **Resumo geral:**  
O código cria uma **interface tipo Explorer**, com **botões customizados** e **árvore de itens com subitens**, exibindo mensagens específicas em cada painel quando selecionados.

---

