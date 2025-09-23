## 9 - Exercício
```prw
#INCLUDE "PROTHEUS.CH"

#INCLUDE "FWMVCDEF.CH"

  

/*/{Protheus.doc} MarkPar

    @type       Function

    @author     Milton J.dos Santos

    @since      01/03/2020

    @version    1.0.0

    @param      Nenhum

    @return     Vazio (nil)

    @example    Exemplo da utilizacao de FWMarkBrowse

    @see        https://tdn.totvs.com/display/public/framework/MarkBrow

/*/

  

User Function MarkPar(cArquivo)

    Local aHeader := {}

  

    Private oBrowse

    Private cAliasPar

  

    CriaTab(aHeader)

  

    If CarregaDados(cArquivo,cAliasPar)

  

        oBrowse := FWMarkBrowse():New()

        oBrowse:SetTemporary(.T.)

        oBrowse:SetAlias(cAliasPar)

        oBrowse:SetFields(aHeader)

        oBrowse:SetFieldMark("X6_MARK")

        oBrowse:SetCustomMarkRec({|| GFES002MRK(.F.)})

        oBrowse:SetAllMark({|| GFES002MRK(.T.)})

        oBrowse:SetMenuDef("GFES002B")

        oBrowse:SetDescription("Parâmetros do Sistema")

        oBrowse:SetAmbiente(.F.)

        oBrowse:SetWalkThru(.F.)

        oBrowse:AddLegend("(cAliasPar)->X6_CONTARQ==(cAliasPar)->X6_CONTLOC","GREEN","Conteúdo Igual")

        oBrowse:AddLegend("(cAliasPar)->X6_CONTARQ!=(cAliasPar)->X6_CONTLOC","RED"  ,"Conteúdo Divergente")

        oBrowse:Activate()

  

    EndIf

  

Return

  

//-------------------------------------------------------------------

// Função MenuDef

//-------------------------------------------------------------------

Static Function MenuDef()

    Local aRotina := {}

  

    ADD OPTION aRotina TITLE "Importar" ACTION "StaticCall(GFES002B,GFES002IMP)" OPERATION 3  ACCESS 0 //Monitor

  

Return aRotina

  

//-------------------------------------------------------------------

/*/{Protheus.doc} CriaTab

Função que cria a estrutura da tabela temporária utilizada para

apresentação dos dados

  

@author  Guilherme A. Metzger

@since   23/07/2015

@version 1.0

/*/

//-------------------------------------------------------------------

Static Function CriaTab(aHeader)

    Local aStruct    := {}

    Local nTamFilial := Len(xFilial("SX6"))

  

    aHeader := {{"Filial"          ,"(cAliasPar)->X6_FIL"    ,"C",nTamFilial,0,"@!"},;

                {"Parâmetro"       ,"(cAliasPar)->X6_VAR"    ,"C",10        ,0,"@!"},;

                {"Tipo"            ,"(cAliasPar)->X6_TIPO"   ,"C",1         ,0,"@!"},;

                {"Descrição"       ,"(cAliasPar)->X6_DESCRIC","C",150       ,0,"@X"},;

                {"Conteúdo Arquivo","(cAliasPar)->X6_CONTARQ","C",300       ,0,"@X"},;

                {"Conteúdo Local"  ,"(cAliasPar)->X6_CONTLOC","C",300       ,0,"@X"}}

  

    aStruct := {{"X6_MARK"   ,"C",2         ,0},;

                {"X6_FIL"    ,"C",nTamFilial,0},;

                {"X6_VAR"    ,"C",10        ,0},;

                {"X6_TIPO"   ,"C",1         ,0},;

                {"X6_DESCRIC","C",150       ,0},;

                {"X6_CONTARQ","C",300       ,0},;

                {"X6_CONTLOC","C",300       ,0}}

  

    cAliasPar := GFECriaTab({aStruct,{"X6_VAR"}})

  

Return

  

//-------------------------------------------------------------------

/*/{Protheus.doc} CarregaDados

Lê o arquivo e carrega os dados na tabela temporária

  

@author  Guilherme A. Metzger

@since   23/07/2015

@version 1.0

/*/

//-------------------------------------------------------------------

Static Function CarregaDados(cArquivo,cAliasPar)

    Local nHandle    := 0

    Local cLine      := ""

    Local cFil       := ""

    Local cParametro := ""

    Local cTipo      := ""

    Local cDescricao := ""

    Local cContArq   := ""

    Local cFilSX6    := xFilial("SX6")

    Local cFilVaz    := Space(Len(cFilSX6))

    Local nInc       := 0

  

    // Abre o arquivo

    nHandle := FT_FUse(cArquivo)

  

    // Se houver erro de abertura abandona processamento

    If nHandle < 0

        MsgStop("Erro na abertura do arquivo!","Carregamento dos Dados")

        Return .F.

    EndIf

  

    nInc := CpoFilArq()

  

    // Posiciona na primeria linha

    FT_FGoTop()

  

    ProcRegua(FT_FLastRec())

  

    SX6->(DbSetOrder(1))

  

    //Percorre todo o arquivo

    While !FT_FEOF()

  

        IncProc()

  

        cLine  := FT_FReadLn() // Retorna a linha corrente

  

        If !( "|" $ cLine )

            FT_FSKIP()

            Loop

        EndIf

  

        cFil       := SubStr(cLine, 1       , nInc)

        cParametro := SubStr(cLine, nInc+4  , 10  )

        cTipo      := SubStr(cLine, nInc+17 , 1   )

        cDescricao := SubStr(cLine, nInc+21 , 150 )

        cContArq   := SubStr(cLine, nInc+174, 300 )

  

        // Grava dados na tabela temporária

        RecLock((cAliasPar),.T.)

        (cAliasPar)->X6_FIL     := Iif(Empty(cFil),cFilVaz,cFilSX6) // Deve importar de acordo com a filial corrente

        (cAliasPar)->X6_VAR     := cParametro

        (cAliasPar)->X6_TIPO    := cTipo

        (cAliasPar)->X6_DESCRIC := cDescricao

        (cAliasPar)->X6_CONTARQ := cContArq

        (cAliasPar)->X6_CONTLOC := cValToChar(SuperGetMV(cParametro,.F.,""))

        (cAliasPar)->(MsUnlock())

  

        // Pula para próxima linha

        FT_FSKIP()

  

    EndDo

  

    // Fecha o arquivo

    FT_FUSE()

  

Return .T.

  

//-------------------------------------------------------------------

/*/{Protheus.doc} Importar

Importa os parâmetros marcados para o sistema

  

@author  Guilherme A. Metzger

@since   23/07/2015

@version 1.0

/*/

//-------------------------------------------------------------------

Static Function GFES002IMP()

  

    Processa({|| Importacao()},"Importação de Parâmetros do Sistema","Aguarde...")

  

Return

  

//-------------------------------------------------------------------

/*/{Protheus.doc} Importar

Importa os parâmetros marcados para o sistema

  

@author  Guilherme A. Metzger

@since   23/07/2015

@version 1.0

/*/

//-------------------------------------------------------------------

Static Function Importacao()

  

    (cAliasPar)->(DbGoTop())

  

    ProcRegua((cAliasPar)->(LastRec()))

  

    SX6->(DbSetOrder(1)) //X6_FIL+X6_VAR

  

    While (cAliasPar)->(!Eof())

        //Incrementa régua de progressão

        IncProc()

        //Importa apenas os registros marcados

        If !Empty((cAliasPar)->X6_MARK)

            //Se o parâmetro não existir, cria

            If !SX6->(DbSeek((cAliasPar)->X6_FIL+(cAliasPar)->X6_VAR))

                RecLock('SX6',.T.)

                SX6->X6_FIL     := (cAliasPar)->X6_FIL

                SX6->X6_VAR     := (cAliasPar)->X6_VAR

                SX6->X6_TIPO    := (cAliasPar)->X6_TIPO

                SX6->X6_DESCRIC := SubStr((cAliasPar)->X6_DESCRIC, 1  , 50)

                SX6->X6_DESC1   := SubStr((cAliasPar)->X6_DESCRIC, 51 , 50)

                SX6->X6_DESC2   := SubStr((cAliasPar)->X6_DESCRIC, 101, 50)

            //Senão só altera o conteúdo

            Else

                RecLock('SX6',.F.)

            EndIf

            SX6->X6_CONTEUDO := (cAliasPar)->X6_CONTARQ

            SX6->(MsUnlock())

        EndIf

        (cAliasPar)->(DbSkip())

    EndDo

  

    MsgInfo("Importação finalizada!")

  

Return

  

//-------------------------------------------------------------------

/*/{Protheus.doc} GFES002MRK

Função de marcação dos registros

  

@author  Guilherme A. Metzger

@since   24/07/2015

@version 1.0

/*/

//-------------------------------------------------------------------

Static Function GFES002MRK(lAllMark)

    Local cMark := Iif(oBrowse:IsMark(oBrowse:Mark()),"  ",oBrowse:Mark())

  

    //Marca todos os registros

    If lAllMark

        (cAliasPar)->(DbGoTop())

        While (cAliasPar)->(!Eof())

            RecLock((cAliasPar),.F.)

            (cAliasPar)->X6_MARK := cMark

            (cAliasPar)->(MsUnlock())

            (cAliasPar)->(DbSkip())

        EndDo

        (cAliasPar)->(DbGoTop())

        oBrowse:GoTop()

    //Marca apenas um registro

    Else

        RecLock((cAliasPar),.F.)

        (cAliasPar)->X6_MARK := cMark

        (cAliasPar)->(MsUnlock())

    EndIf

  

    oBrowse:Refresh()

  

Return .T.

  

//-------------------------------------------------------------------

/*/{Protheus.doc} CpoFilArq

Descobre o tamanho do campo Filial no arquivo de importação

  

@author  Guilherme A. Metzger

@since   30/11/2015

@obs     Para os casos em que os ambientes de exportação e importação

         possuírem tamanho de filial diferentes

@version 1.0

/*/

//-------------------------------------------------------------------

Static Function CpoFilArq()

    Local nRet := 0

  

    FT_FGoTop()

  

    //Percorre todo o arquivo

    While !FT_FEOF()

  

        cLine := FT_FReadLn() // Retorna a linha corrente

  

        If !( "|" $ cLine )

            FT_FSKIP()

            Loop

        Else

            nRet := (At("|",cLine) - 2)

            Exit

        EndIf

  

    EndDo

  

Return nRet
```

**Uso do `FWMarkBrowse` com legenda** no Protheus.  

---

## 1. Includes

```advpl
#INCLUDE "PROTHEUS.CH"
#INCLUDE "FWMVCDEF.CH"
```

- Carrega definições e constantes do Protheus.  
- `FWMVCDEF.CH` traz recursos de Framework/MVC e do **MarkBrowse**.

---

## 2. Documentação e início da função principal

```advpl
/*/{Protheus.doc} MarkPar
...
User Function MarkPar(cArquivo)
	Local aHeader := {}
```

- Cria a função `MarkPar`, ponto de entrada que será chamada.  
- Recebe como parâmetro `cArquivo` (um arquivo texto de parâmetros).  
- Declara `aHeader`, que será a configuração das colunas do browse.

---

## 3. Variáveis privadas e chamada de criação de tabela

```advpl
	Private oBrowse
	Private cAliasPar

	CriaTab(aHeader)
```

- `oBrowse` será o objeto `FWMarkBrowse`.  
- `cAliasPar` é o alias da tabela temporária.  
- `CriaTab(aHeader)` → cria a estrutura da tabela e define colunas.

---

## 4. Carregamento de dados

```advpl
	If CarregaDados(cArquivo,cAliasPar)
```

- Se os dados do arquivo foram carregados com sucesso → continua.  

---

## 5. Configuração do Browse

```advpl
		oBrowse := FWMarkBrowse():New()
		oBrowse:SetTemporary(.T.)              // É uma tabela temporária
		oBrowse:SetAlias(cAliasPar)            // Define a tabela
		oBrowse:SetFields(aHeader)             // Define as colunas
		oBrowse:SetFieldMark("X6_MARK")        // Campo de marcação
		oBrowse:SetCustomMarkRec({|| GFES002MRK(.F.)}) // Marca um registro
		oBrowse:SetAllMark({|| GFES002MRK(.T.)})       // Marca todos
		oBrowse:SetMenuDef("GFES002B")         // Menu associado
		oBrowse:SetDescription("Parâmetros do Sistema") 
		oBrowse:SetAmbiente(.F.)               // Não é ambiente MVC
		oBrowse:SetWalkThru(.F.)               // Não percorre registros
		oBrowse:AddLegend("(cAliasPar)->X6_CONTARQ==(cAliasPar)->X6_CONTLOC","GREEN","Conteúdo Igual")
		oBrowse:AddLegend("(cAliasPar)->X6_CONTARQ!=(cAliasPar)->X6_CONTLOC","RED"  ,"Conteúdo Divergente")
		oBrowse:Activate()
```

👉 Aqui é onde acontece o que você relatou:  
Quando você **clica no registro**, o Protheus procura a função de clique → mas não tem.  
Esse Browse está preparado para marcar registros, comparar arquivo x banco, e importar.

---

## 6. Função de Menu

```advpl
Static Function MenuDef()
	Local aRotina := {}

	ADD OPTION aRotina TITLE "Importar" ACTION "StaticCall(GFES002B,GFES002IMP)" OPERATION 3  ACCESS 0
Return aRotina
```

- Define o menu que aparece no Browse.  
- Aqui só tem uma opção: **Importar**, que chama `GFES002IMP`.

---

## 7. Criação da tabela temporária

```advpl
Static Function CriaTab(aHeader)
	Local aStruct    := {}
	Local nTamFilial := Len(xFilial("SX6"))
```

- Monta `aHeader` (colunas do browse).  
- Monta `aStruct` (estrutura física da tabela temporária).  
- Usa `GFECriaTab` para criar a tabela temporária no RPO.  
- Retorna em `cAliasPar`.

---

## 8. Carregamento de dados do arquivo

```advpl
Static Function CarregaDados(cArquivo,cAliasPar)
```

- Abre o arquivo (`FT_FUse`).  
- Percorre linha a linha (`FT_FReadLn`).  
- Para cada registro, monta os campos (`X6_FIL`, `X6_VAR`, etc).  
- Grava na tabela temporária.  
- Fecha o arquivo.  

---

## 9. Importação

```advpl
Static Function GFES002IMP()
	Processa({|| Importacao()},"Importação de Parâmetros do Sistema","Aguarde...")
Return
```

- Apenas chama `Importacao()` dentro de uma tela de processamento.

---

### 10. Função Importacao()

- Vai na tabela temporária e percorre registros.  
- Se marcado (`X6_MARK`), grava ou atualiza na SX6.  
- No fim, exibe `MsgInfo("Importação finalizada!")`.

---

### 11. Função GFES002MRK()

- Responsável por **marcar registros** (um ou todos).  
- Atualiza o campo `X6_MARK`.  
- Dá `Refresh()` no browse.

---

### 12. Função CpoFilArq()

- Descobre o tamanho do campo filial no arquivo.  
- Usa o primeiro `|` encontrado para calcular posição.  
- Retorna o tamanho para uso em `CarregaDados`.

---

## 🔑 Em resumo
- `MarkPar` = ponto de entrada principal (abre o Browse).  
- `CriaTab` = cria tabela temporária e colunas.  
- `CarregaDados` = lê o arquivo e preenche a tabela.  
- `FWMarkBrowse` = exibe tela com colunas e legenda.  
- `MenuDef` = adiciona a opção "Importar".  
- `Importacao` = grava os parâmetros no SX6.  
- `GFES002MRK` = marca registros.  
- `CpoFilArq` = ajusta tamanho do campo filial.  

---


