```prw
///////////////////////////////////////////////////////////////////////////////////
//+-----------------------------------------------------------------------------+//
//| PROGRAMA  | Relatorio_DBF.prw    | AUTOR | Robson Luiz  | DATA | 18/01/2004 |//
//+-----------------------------------------------------------------------------+//
//| DESCRICAO | Funcao - u_Rel_DBF()                                            |//
//|           | Fonte utilizado no curso oficina de programacao.                |//
//|           | Funcao que demonstra a criacao de relatorio com a utilizacao    |//
//|           | das funcoes padroes                                             |//
//+-----------------------------------------------------------------------------+//
//| MANUTENCAO DESDE SUA CRIACAO                                                |//
//+-----------------------------------------------------------------------------+//
//| DATA     | AUTOR                | DESCRICAO                                 |//
//+-----------------------------------------------------------------------------+//
//|          |                      |                                           |//
//+-----------------------------------------------------------------------------+//
///////////////////////////////////////////////////////////////////////////////////

/*Lay-Out do Relatorio -> DBF
---------------------------------------------------------------------------------------------------------------------------------
| PREFIXO | TITULO | PARCELA | TIP | EMISSAO | VENCTO | VENCTO REAL |     VLR. ORIGINAL |              PAGO |             SALDO |
---------------------------------------------------------------------------------------------------------------------------------
| Cod/Loj/Nome: 999999-99 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX                                                                        |
|   UNI   | 999999 |    A    | NFX |99/999/99|99/99/99|   99/99/99  | 99,999,999,999.99 | 99,999,999,999.99 | 99,999,999,999.99 |
|   UNI   | 999999 |    A    | NFX |99/999/99|99/99/99|   99/99/99  | 99,999,999,999.99 | 99,999,999,999.99 | 99,999,999,999.99 |
|   UNI   | 999999 |    A    | NFX |99/999/99|99/99/99|   99/99/99  | 99,999,999,999.99 | 99,999,999,999.99 | 99,999,999,999.99 |
---------------------------------------------------------------------------------------------------------------------------------
| TOTAL.....
---------------------------------------------------------------------------------------------------------------------------------
012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678
1         2         3         4         5         6         7         8         9        10        11        12
*/

User Function Rel_DBF()

//+-------------------------------------------------------------------------------
//| Declaracoes de variaveis
//+-------------------------------------------------------------------------------

Local cDesc1  := "Este relatorio ira imprimir informacoes do contas a pagar conforme"
Local cDesc2  := "parametros informado. Será gerado um arquivo no diretório "
Local cDesc3  := "Spool - INFORM_????.XLS, onde ???? e o nome do usuario."

Private cString  := "SE2"
Private Tamanho  := "M"
Private aReturn  := { "Zebrado",2,"Administracao",2,2,1,"",1 }
Private wnrel    := "RELDBF"
Private NomeProg := "RELDBF"
Private nLastKey := 0
Private Limite   := 132
Private Titulo   := "Titulo a Pagar - Ordem de "
Private cPerg    := "RELDBF"
Private nTipo    := 0
Private cbCont   := 0
Private cbTxt    := "registro(s) lido(s)"
Private Li       := 80
Private m_pag    := 1
Private aOrd     := {}
Private Cabec1   := "  PREFIXO   TITULO   PARCELA   TIP   EMISSAO   VENCTO   VENCTO REAL       VLR. ORIGINAL                PAGO               SALDO  "
Private Cabec2   := ""

/*+----------------------
| Parametros do aReturn
+----------------------
aReturn - Preenchido pelo SetPrint()
aReturn[1] - Reservado para formulario
aReturn[2] - Reservado para numero de vias
aReturn[3] - Destinatario
aReturn[4] - Formato 1=Paisagem 2=Retrato
aReturn[5] - Midia 1-Disco 2=Impressora
aReturn[6] - Prota ou arquivo 1-Lpt1... 4-Com1...
aReturn[7] - Expressao do filtro
aReturn[8] - Ordem a ser selecionada
aReturn[9] [10] [n] - Campos a processar se houver
*/

aAdd( aOrd, "Fornecedor"   )
aAdd( aOrd, "Titulo"       )
aAdd( aOrd, "Emissão"      )
aAdd( aOrd, "Vencimento"   )
aAdd( aOrd, "Vencto. Real" )

//Parametros de perguntas para o relatorio
//+-------------------------------------------------------------+
//| mv_par01 - Fornecedor de      ? 999999                      |
//| mv_par02 - Fornecedor ate     ? 999999                      |
//| mv_par03 - Tipo de            ? XXX                         |
//| mv_par04 - Tipo ate           ? XXX                         |
//| mv_par05 - Vencimento de      ? 99/99/99                    |
//| mv_par06 - Vencimento ate     ? 99/99/99                    |
//| mv_par07 - Aglut.Fornecedor   ? Sim/Nao                     |
//+-------------------------------------------------------------+
CriaSx1()

//+-------------------------------------------------------------------------------
//| Disponibiliza para usuario digitar os parametros
//+-------------------------------------------------------------------------------
Pergunte(cPerg,.F.)

//+-------------------------------------------------------------------------------
//| Solicita ao usuario a parametrizacao do relatorio.
//+-------------------------------------------------------------------------------
wnrel := SetPrint(cString,wnrel,cPerg,@Titulo,cDesc1,cDesc2,cDesc3,.F.,aOrd,.F.,Tamanho,.F.,.F.)
//SetPrint(cAlias,cNome,cPerg,cDesc,cCnt1,cCnt2,cCnt3,lDic,aOrd,lCompres,;
//cSize,aFilter,lFiltro,lCrystal,cNameDrv,lNoAsk,lServer,cPortToPrint)

//+-------------------------------------------------------------------------------
//| Se teclar ESC, sair
//+-------------------------------------------------------------------------------
If nLastKey == 27
	Return
Endif

//+-------------------------------------------------------------------------------
//| Estabelece os padroes para impressao, conforme escolha do usuario
//+-------------------------------------------------------------------------------
SetDefault(aReturn,cString)

//+-------------------------------------------------------------------------------
//| Verificar se sera reduzido ou normal
//+-------------------------------------------------------------------------------
nTipo := Iif(aReturn[4] == 1, 15, 18)

//+-------------------------------------------------------------------------------
//| Se teclar ESC, sair
//+-------------------------------------------------------------------------------
If nLastKey == 27
	Return
Endif

//+-------------------------------------------------------------------------------
//| Chama funcao que processa os dados
//+-------------------------------------------------------------------------------
RptStatus({|lEnd| RelDbfImp(@lEnd) }, Titulo, "Processando e imprimindo dados, aguarde...", .T. )

Return

///////////////////////////////////////////////////////////////////////////////////
//+-----------------------------------------------------------------------------+//
//| PROGRAMA  | Relatorio_DBF.prw    | AUTOR | Robson Luiz  | DATA | 18/01/2004 |//
//+-----------------------------------------------------------------------------+//
//| DESCRICAO | Funcao - RelDbfImp()                                            |//
//|           | Fonte utilizado no curso oficina de programacao.                |//
//|           | Funcao de impressao                                             |//
//+-----------------------------------------------------------------------------+//
///////////////////////////////////////////////////////////////////////////////////
Static Function RelDbfImp(lEnd)

Local nIndice   := 0
Local cArq   := ""
Local cIndice   := ""
Local cFiltro   := ""
Local aCol      := {}
Local cFornec   := ""
Local nValor    := 0
Local nPago     := 0
Local nSaldo    := 0
Local nT_Valor  := 0
Local nT_Pago   := 0
Local nT_Saldo  := 0
Local cArqExcel := ""

Titulo += aOrd[aReturn[8]]

cFiltro := "E2_FILIAL == '"+xFilial("SE2")+"' "
cFiltro += ".And. E2_FORNECE >= '"+mv_par01+"' "
cFiltro += ".And. E2_FORNECE <= '"+mv_par02+"' "
cFiltro += ".And. E2_TIPO >= '"+mv_par03+"' "
cFiltro += ".And. E2_TIPO <= '"+mv_par04+"' "
cFiltro += ".And. Dtos(E2_VENCTO) >= '"+Dtos(mv_par05)+"' "
cFiltro += ".And. Dtos(E2_VENCTO) <= '"+Dtos(mv_par06)+"' "

If aReturn[8] == 1 //Fornecedor
	cIndice := "E2_FORNECE+E2_LOJA+E2_NUM"
Elseif aReturn[8] == 2 //Titulo
	cIndice := "E2_NUM+E2_FORNECE+E2_LOJA"
Elseif aReturn[8] == 3 //Emissao
	cIndice := "Dtos(E2_EMISSAO)+E2_FORNECE+E2_LOJA"
Elseif aReturn[8] == 4 //Vencimento
	cIndice := "Dtos(E2_VENCTO)+E2_FORNECE+E2_LOJA"
Elseif aReturn[8] == 5 //Vencimento Real
	cIndice := "Dtos(E2_VENCREA)+E2_FORNECE+E2_LOJA"
Endif

cArq := CriaTrab(NIL,.F.)
dbSelectArea("SE2")
IndRegua("SE2",cArq,cIndice,,cFiltro)
nIndice := RetIndex()
nIndice := nIndice + 1
dbSetIndex(cArq+OrdBagExt())
dbSetOrder(nIndice)

dbGoTop()
SetRegua(0)

//+--------------------
//| Coluna de impressao
//+--------------------
aAdd( aCol, 004 ) //Prefixo
aAdd( aCol, 012 ) //Titulo
aAdd( aCol, 024 ) //Parcela
aAdd( aCol, 031 ) //Tipo
aAdd( aCol, 036 ) //Emissao
aAdd( aCol, 046 ) //Vencimento
aAdd( aCol, 058 ) //Vencimento Real
aAdd( aCol, 070 ) //Valor Original
aAdd( aCol, 090 ) //Pago
aAdd( aCol, 110 ) //Saldo

cFornec := SE2->E2_FORNECE+SE2->E2_LOJA

While !Eof() .And. !lEnd
	
	If Li > 55
		Cabec(Titulo,Cabec1,Cabec2,NomeProg,Tamanho,nTipo)
	Endif
	
	@ Li, aCol[1] PSay "Cod/Loj/Nome: "+SE2->E2_FORNECE+"-"+SE2->E2_LOJA+" "+SE2->E2_NOMFOR
	Li ++
	
	While !Eof() .And. !lEnd .And. SE2->E2_FORNECE+SE2->E2_LOJA == cFornec
		
		IncRegua()
		
		If Li > 55
			Cabec(Titulo,Cabec1,Cabec2,NomeProg,Tamanho,nTipo)
		Endif
		
		If mv_par07 == 2
			@ Li, aCol[1]  PSay SE2->E2_PREFIXO
			@ Li, aCol[2]  PSay SE2->E2_NUM
			@ Li, aCol[3]  PSay SE2->E2_PARCELA
			@ Li, aCol[4]  PSay SE2->E2_TIPO
			@ Li, aCol[5]  PSay SE2->E2_EMISSAO
			@ Li, aCol[6]  PSay SE2->E2_VENCTO
			@ Li, aCol[7]  PSay SE2->E2_VENCREA
			@ Li, aCol[8]  PSay SE2->E2_VALOR PICTURE "@E 99,999,999,999.99"
			@ Li, aCol[9]  PSay SE2->E2_VALOR - SE2->E2_SALDO PICTURE "@E 99,999,999,999.99"
			@ Li, aCol[10] PSay SE2->E2_SALDO PICTURE "@E 99,999,999,999.99"
			Li ++
		Endif
		
		nValor += SE2->E2_VALOR
		nPago  += (SE2->E2_VALOR-SE2->E2_SALDO)
		nSaldo += SE2->E2_SALDO
		
		nT_Valor += SE2->E2_VALOR
		nT_Pago  += (SE2->E2_VALOR-SE2->E2_SALDO)
		nT_Saldo += SE2->E2_SALDO
		
		dbSkip()
	End
	
	@ Li, 000 PSay Replicate("-",Limite)
	Li ++
	@ Li, aCol[1]  PSay "TOTAL....."
	@ Li, aCol[8]  PSay nValor PICTURE "@E 99,999,999,999.99"
	@ Li, aCol[9]  PSay nPago  PICTURE "@E 99,999,999,999.99"
	@ Li, aCol[10] PSay nSaldo PICTURE "@E 99,999,999,999.99"
	Li +=2
	
	cFornec := SE2->E2_FORNECE+SE2->E2_LOJA
	nValor  := 0
	nPago   := 0
	nSaldo  := 0
	
End

If lEnd
	@ Li, aCol[1] PSay cCancel
	Return
Endif

@ Li, 000 PSay Replicate("=",Limite)
Li ++
@ Li, aCol[1]  PSay "TOTAL GERAL....."
@ Li, aCol[8]  PSay nT_Valor PICTURE "@E 99,999,999,999.99"
@ Li, aCol[9]  PSay nT_Pago  PICTURE "@E 99,999,999,999.99"
@ Li, aCol[10] PSay nT_Saldo PICTURE "@E 99,999,999,999.99"

If Li <> 80
	Roda(cbCont,cbTxt,Tamanho)
Endif

//+-------------------------------------------------------------------------------
//| Gera arquivo do tipo .DBF com extensao .XLS p/ usuario abrir no Excel.
//+-------------------------------------------------------------------------------
cArqExcel := __RELDIR+NomeProg+"_"+Substr(cUsuario,7,4)+".XLS"
Copy To &cArqExcel

dbSelectArea("SE2")
RetIndex("SE2")
Set Filter To
dbSetOrder(1)
dbGoTop()

If aReturn[5] == 1
	Set Printer TO
	dbCommitAll()
	OurSpool(wnrel)
EndIf

Ms_Flush()

Return

///////////////////////////////////////////////////////////////////////////////////
//+-----------------------------------------------------------------------------+//
//| PROGRAMA  | Relatorio_DBF.prw    | AUTOR | Robson Luiz  | DATA | 18/01/2004 |//
//+-----------------------------------------------------------------------------+//
//| DESCRICAO | Funcao - CriaSX1()                                              |//
//|           | Fonte utilizado no curso oficina de programacao.                |//
//|           | Funcao que cria o grupo de perguntas se necessario              |//
//+-----------------------------------------------------------------------------+//
///////////////////////////////////////////////////////////////////////////////////
Static Function CriaSx1()
Local aP := {}
Local i := 0
Local cSeq
Local cMvCh
Local cMvPar
Local aHelp := {}

/******
Parametros da funcao padrao
---------------------------
PutSX1(cGrupo,;
cOrdem,;
cPergunt,cPerSpa,cPerEng,;
cVar,;
cTipo,;
nTamanho,;
nDecimal,;
nPresel,;
cGSC,;
cValid,;
cF3,;
cGrpSxg,;
cPyme,;
cVar01,;
cDef01,cDefSpa1,cDefEng1,;
cCnt01,;
cDef02,cDefSpa2,cDefEng2,;
cDef03,cDefSpa3,cDefEng3,;
cDef04,cDefSpa4,cDefEng4,;
cDef05,cDefSpa5,cDefEng5,;
aHelpPor,aHelpEng,aHelpSpa,;
cHelp)

Característica do vetor p/ utilização da função SX1
---------------------------------------------------
[n,1] --> texto da pergunta
[n,2] --> tipo do dado
[n,3] --> tamanho
[n,4] --> decimal
[n,5] --> objeto G=get ou C=choice
[n,6] --> validacao
[n,7] --> F3
[n,8] --> definicao 1
[n,9] --> definicao 2
[n,10] -> definicao 3
[n,11] -> definicao 4
[n,12] -> definicao 5
***/
aAdd(aP,{"Fornecedor de"             ,"C",6,0,"G",""                    ,"SA2",""   ,""   ,"","",""})
aAdd(aP,{"Fornecedor ate"            ,"C",6,0,"G","(mv_par02>=mv_par01)","SA2",""   ,""   ,"","",""})
aAdd(aP,{"Tipo de"                   ,"C",3,0,"G",""                    ,"05" ,""   ,""   ,"","",""})
aAdd(aP,{"Tipo ate"                  ,"C",3,0,"G","(mv_par04>=mv_par03)","05" ,""   ,""   ,"","",""})
aAdd(aP,{"Vencimento de"             ,"D",8,0,"G",""                    ,""   ,""   ,""   ,"","",""})
aAdd(aP,{"Vencimento ate"            ,"D",8,0,"G","(mv_par06>=mv_par05)",""   ,""   ,""   ,"","",""})
aAdd(aP,{"Aglutinar pagto.de fornec.","N",1,0,"C",""                    ,""   ,"Sim","Nao","","",""})

aAdd(aHelp,{"Informe o código do fornecedor.","inicial."})
aAdd(aHelp,{"Informe o código do fornecedor.","final."})
aAdd(aHelp,{"Tipo de título inicial."})
aAdd(aHelp,{"Tipo de título final."})
aAdd(aHelp,{"Digite a data do vencimento incial."})
aAdd(aHelp,{"Digite a data do vencimento final."})
aAdd(aHelp,{"Aglutinar os títulos do mesmo forne-","cedor totalizando seus valores."})

For i:=1 To Len(aP)
	cSeq   := StrZero(i,2,0)
	cMvPar := "mv_par"+cSeq
	cMvCh  := "mv_ch"+IIF(i<=9,Chr(i+48),Chr(i+87))
	
	PutSx1(cPerg,;
	cSeq,;
	aP[i,1],aP[i,1],aP[i,1],;
	cMvCh,;
	aP[i,2],;
	aP[i,3],;
	aP[i,4],;
	0,;
	aP[i,5],;
	aP[i,6],;
	aP[i,7],;
	"",;
	"",;
	cMvPar,;
	aP[i,8],aP[i,8],aP[i,8],;
	"",;
	aP[i,9],aP[i,9],aP[i,9],;
	aP[i,10],aP[i,10],aP[i,10],;
	aP[i,11],aP[i,11],aP[i,11],;
	aP[i,12],aP[i,12],aP[i,12],;
	aHelp[i],;
	{},;
	{},;
	"")
Next i

Return

```

Esse código é escrito em **ADVPL/Protheus**, usado no ERP TOTVS, e cria um **relatório de contas a pagar em DBF/Excel**.

---

## **1. Cabeçalho do programa**

```advpl
///////////////////////////////////////////////////////////////////////////////////
//+-----------------------------------------------------------------------------+//
//| PROGRAMA  | Relatorio_DBF.prw    | AUTOR | Robson Luiz  | DATA | 18/01/2004 |//
//+-----------------------------------------------------------------------------+//
//| DESCRICAO | Funcao - u_Rel_DBF()                                            |//
//|           | Fonte utilizado no curso oficina de programacao.                |//
//|           | Funcao que demonstra a criacao de relatorio com a utilizacao    |//
//|           | das funcoes padroes                                             |//
//+-----------------------------------------------------------------------------+//
```

**O que significa:**

* Define o **programa**: `Relatorio_DBF.prw`.
* Autor e data de criação.
* Descrição: é uma função que gera um **relatório de contas a pagar** usando funções padrão do TOTVS.

> Serve como documentação inicial para o usuário e para desenvolvedores que forem manter o código.

---

## **2. Layout do relatório**

```advpl
/*Lay-Out do Relatorio -> DBF
---------------------------------------------------------------------------------------------------------------------------------
| PREFIXO | TITULO | PARCELA | TIP | EMISSAO | VENCTO | VENCTO REAL |     VLR. ORIGINAL |              PAGO |             SALDO |
...
*/
```

**O que significa:**

* Descreve **como o relatório será impresso**, colunas, títulos e formato dos dados.
* Útil para **entender a estrutura dos dados** que serão exibidos.

---

## **3. Função principal `Rel_DBF()`**

```advpl
User Function Rel_DBF()
```

* Início da função principal.
* Serve como **ponto de entrada do relatório**.

---

### **3.1 Declaração de variáveis**

```advpl
Local cDesc1  := "Este relatorio ira imprimir informacoes do contas a pagar conforme"
Local cDesc2  := "parametros informado. Será gerado um arquivo no diretório "
Local cDesc3  := "Spool - INFORM_????.XLS, onde ???? e o nome do usuario."

Private cString  := "SE2"
Private Tamanho  := "M"
Private aReturn  := { "Zebrado",2,"Administracao",2,2,1,"",1 }
Private wnrel    := "RELDBF"
Private NomeProg := "RELDBF"
Private nLastKey := 0
Private Limite   := 132
Private Titulo   := "Titulo a Pagar - Ordem de "
Private cPerg    := "RELDBF"
Private nTipo    := 0
Private cbCont   := 0
Private cbTxt    := "registro(s) lido(s)"
Private Li       := 80
Private m_pag    := 1
Private aOrd     := {}
Private Cabec1   := "  PREFIXO   TITULO   PARCELA   TIP   EMISSAO   VENCTO   VENCTO REAL       VLR. ORIGINAL                PAGO               SALDO  "
Private Cabec2   := ""
```

**O que significa:**

* Variáveis para **descrição do relatório** (`cDesc1`, `cDesc2`, `cDesc3`).
* `cString`: alias do DBF.
* `aReturn`: vetor usado para configurar impressão, formato, mídia, filtros, etc.
* `wnrel`, `NomeProg`: nomes do relatório e do programa.
* `Limite`: largura máxima do relatório (em caracteres).
* `Titulo`: título do relatório.
* `aOrd`: campos de ordenação (fornecedor, título, emissão…).
* `Cabec1`: cabeçalho do relatório para impressão.

> Serve para **armazenar todas as configurações iniciais do relatório**.

---

### **3.2 Configuração de campos para ordenação**

```advpl
aAdd( aOrd, "Fornecedor"   )
aAdd( aOrd, "Titulo"       )
aAdd( aOrd, "Emissão"      )
aAdd( aOrd, "Vencimento"   )
aAdd( aOrd, "Vencto. Real" )
```

**O que significa:**

* Define os **campos que podem ser usados para ordenar o relatório**.

---

### **3.3 Criação das perguntas (parâmetros do relatório)**

```advpl
CriaSx1()
Pergunte(cPerg,.F.)
```

* `CriaSx1()` → cria o **formulário de perguntas** para o usuário (período, fornecedor, tipo de título).
* `Pergunte()` → exibe essas perguntas na tela e permite o preenchimento pelo usuário.

> Serve para **parametrizar o relatório**, garantindo que o usuário informe filtros antes de gerar os dados.

---

### **3.4 Configuração da impressão**

```advpl
wnrel := SetPrint(cString,wnrel,cPerg,@Titulo,cDesc1,cDesc2,cDesc3,.F.,aOrd,.F.,Tamanho,.F.,.F.)
```

* `SetPrint()` → função que **configura impressora ou arquivo de saída**.
* Parâmetros: alias do DBF, título, descrição, campos de ordenação, tamanho, etc.

---

### **3.5 Validação do usuário (ESC)**

```advpl
If nLastKey == 27
	Return
Endif
```

* Verifica se o usuário **pressionou ESC** para cancelar.
* `27` é o código ASCII do ESC.

---

### **3.6 Padrões de impressão e tipo de página**

```advpl
SetDefault(aReturn,cString)
nTipo := Iif(aReturn[4] == 1, 15, 18)
```

* `SetDefault()` → aplica **configurações padrão** de impressão.
* `nTipo` → define **tamanho de fonte** ou tipo de impressão (paisagem x retrato).

---

### **3.7 Processamento do relatório**

```advpl
RptStatus({|lEnd| RelDbfImp(@lEnd) }, Titulo, "Processando e imprimindo dados, aguarde...", .T. )
```

* Chama `RelDbfImp()` → função que **lê os dados do DBF e imprime o relatório**.
* Mostra uma **mensagem de status** ao usuário enquanto o relatório está sendo gerado.

---

## **4. Função `RelDbfImp(lEnd)`**

```advpl
Static Function RelDbfImp(lEnd)
```

* Função **responsável por gerar o relatório**, processar os dados e criar o arquivo Excel/DBF.

---

### **4.1 Declaração de variáveis**

```advpl
Local nIndice   := 0
Local cArq   := ""
Local cIndice   := ""
Local cFiltro   := ""
Local aCol      := {}
Local cFornec   := ""
Local nValor    := 0
Local nPago     := 0
Local nSaldo    := 0
Local nT_Valor  := 0
Local nT_Pago   := 0
Local nT_Saldo  := 0
Local cArqExcel := ""
```

* Variáveis para **controle de índices, filtros, colunas, totais e arquivo Excel**.

---

### **4.2 Configuração do filtro de seleção**

```advpl
cFiltro := "E2_FILIAL == '"+xFilial("SE2")+"' "
cFiltro += ".And. E2_FORNECE >= '"+mv_par01+"' "
cFiltro += ".And. E2_FORNECE <= '"+mv_par02+"' "
...
```

* Monta o **filtro de dados** baseado nos parâmetros informados pelo usuário.
* Serve para **selecionar apenas os registros desejados**.

---

### **4.3 Ordenação dos dados**

```advpl
If aReturn[8] == 1 //Fornecedor
	cIndice := "E2_FORNECE+E2_LOJA+E2_NUM"
...
Endif
```

* Define **qual campo será usado para ordenar os dados**, dependendo da escolha do usuário.

---

### **4.4 Preparação do DBF para impressão**

```advpl
cArq := CriaTrab(NIL,.F.)
dbSelectArea("SE2")
IndRegua("SE2",cArq,cIndice,,cFiltro)
...
```

* Cria uma **área de trabalho temporária** (`CriaTrab`) para imprimir.
* `IndRegua` → seleciona os registros do DBF e aplica o filtro.

> Serve para organizar os dados antes da impressão.

---

### **4.5 Impressão do relatório linha a linha**

```advpl
While !Eof() .And. !lEnd
...
End
```

* Loop principal que percorre os registros do DBF.
* `PSay` → imprime cada coluna na posição correta.
* Soma os **valores totais** (`nValor`, `nPago`, `nSaldo`) por fornecedor.
* Exibe **totais parciais e totais gerais**.

---

### **4.6 Geração do arquivo Excel**

```advpl
cArqExcel := __RELDIR+NomeProg+"_"+Substr(cUsuario,7,4)+".XLS"
Copy To &cArqExcel
```

* Cria um arquivo `.XLS` no diretório do relatório.
* Permite que o usuário abra o relatório no **Excel**.

---

### **4.7 Finalização**

```advpl
Ms_Flush()
Return
```

* `Ms_Flush()` → garante que todos os dados sejam **gravados e enviados para a saída**.
* `Return` → encerra a função.

---

## **5. Função `CriaSx1()`**

```advpl
Static Function CriaSx1()
```

* Cria o **grupo de perguntas** que serão exibidas para o usuário.

### **5.1 Parâmetros**

```advpl
aAdd(aP,{"Fornecedor de","C",6,0,"G","" ...})
...
```

* Define perguntas como: fornecedor inicial/final, tipo de título, período de vencimento, etc.
* Serve para **montar dinamicamente o formulário de entrada de dados**.

---

### **5.2 Help e validações**

```advpl
aAdd(aHelp,{"Informe o código do fornecedor.","inicial."})
...
```

* Define mensagens de ajuda para cada pergunta.
* Validações garantem **integridade dos dados digitados pelo usuário**.

---

### **5.3 Loop para criar perguntas**

```advpl
For i:=1 To Len(aP)
	PutSx1(cPerg,...)
Next i
```

* Loop que envia **cada pergunta para o formulário SX1**.
* `PutSx1()` → função padrão do TOTVS para criar campos de entrada.

---

## **✅ Resumo geral do código**

* **Objetivo:** gerar um **relatório de contas a pagar**, com filtros por fornecedor, tipo e vencimento, e imprimir ou gerar arquivo Excel/DBF.

* **Fluxo:**

  1. Configura variáveis e layout.
  2. Pergunta ao usuário os parâmetros (fornecedor, tipo, período).
  3. Configura impressão e filtros.
  4. Lê registros do DBF e imprime linha a linha, com totais.
  5. Gera arquivo Excel para o usuário.
  6. Permite ESC para cancelar em qualquer momento.

* **Funções principais:**

  * `Rel_DBF()` → função principal.
  * `RelDbfImp()` → processa e imprime os dados.
  * `CriaSx1()` → cria formulário de perguntas ao usuário.

---

