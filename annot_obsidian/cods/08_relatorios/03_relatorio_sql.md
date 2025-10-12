## 3 - Exercício
```prw
///////////////////////////////////////////////////////////////////////////////////

//+-----------------------------------------------------------------------------+//

//| PROGRAMA  | Relatorio_SQL.prw    | AUTOR | Robson Luiz  | DATA | 18/01/2004 |//

//+-----------------------------------------------------------------------------+//

//| DESCRICAO | Funcao - u_Rel_SQL()                                            |//

//|           | Fonte utilizado no curso oficina de programacao.                |//

//|           | Programa que demonstra a utiliacao das funcao para SQL          |//

//+-----------------------------------------------------------------------------+//

//| MANUTENCAO DESDE SUA CRIACAO                                                |//

//+-----------------------------------------------------------------------------+//

//| DATA     | AUTOR                | DESCRICAO                                 |//

//+-----------------------------------------------------------------------------+//

//|          |                      |                                           |//

//+-----------------------------------------------------------------------------+//

///////////////////////////////////////////////////////////////////////////////////

  

/*Lay-Out do Relatorio -> SQL

---------------------------------------------------------------------------------------------------------------------------------

| PREFIXO | TITULO | PARCELA | TIP | EMISSAO | VENCTO | VENCTO REAL |     VLR. ORIGINAL |              PAGO |             SALDO |

---------------------------------------------------------------------------------------------------------------------------------

| Cod/Loj/Nome: 999999-99 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX                                                                        |

|   UNI   | 999999 |    A    | NFX |99/999/99|99/99/99|   99/99/99  | 99,999,999,999.99 | 99,999,999,999.99 | 99,999,999,999.99 |

|   UNI   | 999999 |    A    | NFX |99/999/99|99/99/99|   99/99/99  | 99,999,999,999.99 | 99,999,999,999.99 | 99,999,999,999.99 |

|   UNI   | 999999 |    A    | NFX |99/999/99|99/99/99|   99/99/99  | 99,999,999,999.99 | 99,999,999,999.99 | 99,999,999,999.99 |

---------------------------------------------------------------------------------------------------------------------------------

| TOTAL.....

---------------------------------------------------------------------------------------------------------------------------------

012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678

          1         2         3         4         5         6         7         8         9        10        11        12

*/

  

User Function Rel_SQL()

  

//+-------------------------------------------------------------------------------

//| Declaracoes de variaveis

//+-------------------------------------------------------------------------------

  

Local cDesc1  := "Este relatorio ira imprimir informacoes do contas a pagar conforme"        

Local cDesc2  := "parametros informado."

Local cDesc3  := "Ser  gerado um arquivo no Spool - REL_DBF????.XLS, onde ???? e o usuario."

  

Private cString  := "SE2"

Private Tamanho  := "M"

Private aReturn  := { "Zebrado",1,"Administracao",2,2,1,"",1 }

Private wnrel    := "RELSQL"

Private NomeProg := "RELSQL"

Private nLastKey := 0

Private Limite   := 132

Private Titulo   := "Titulo a Pagar - Ordem de "

Private cPerg    := "RELSQL"

Private nTipo    := 0

Private cbCont   := 0

Private cbTxt    := "registro(s) lido(s)"

Private Li       := 80

Private m_pag    := 1

Private aOrd     := {}

Private Cabec1   := "  PREFIXO   TITULO   PARCELA   TIP   EMISSAO   VENCTO   VENCTO REAL       VLR. ORIGINAL                PAGO               SALDO  "

Private Cabec2   := ""

  

#IFNDEF TOP

   MsgInfo("N o   poss vel executar este programa, est  base de dados n o   TopConnect","Incompatibilidade")

   RETURN

#ENDIF

  

/*+----------------------

  | Parametros do aReturn

  +----------------------

aReturn - Preenchido pelo SetPrint()

aReturn[1] - Reservado para formulario

aReturn[2] - Reservado para numero de vias

aReturn[3] - Destinatario

aReturn[4] - Formato 1=Comprimido 2=Normal

aReturn[5] - Midia 1-Disco 2=Impressora

aReturn[6] - Prota ou arquivo 1-Lpt1... 4-Com1...

CReturn[7] - Expressao do filtro

aReturn[8] - Ordem a ser selecionada

aReturn[9] [10] [n] - Campos a processar se houver

*/

  

aAdd( aOrd, "Fornecedor"   )

aAdd( aOrd, "Titulo"       )

aAdd( aOrd, "Emiss o"      )

aAdd( aOrd, "Vencimento"   )

aAdd( aOrd, "Vencto. Real" )

  

//Parametros de perguntas para o relatorio

//+-------------------------------------------------------------+

//| mv_par01 - Fornecedor de      ? 999999                      |

//| mv_par02 - Fornecedor ate     ? 999999                      |

//| mv_par03 - Tipo de            ? XXX                         |

//| mv_par04 - Tipo ate           ? XXX                         |

//| mv_par05 - Vencimento de      ? 99/99/99                    |

//| mv_par06 - Vencimento ate     ? 99/99/99                    |

//| mv_par07 - Aglut.Fornecedor   ? Ativados/Nao Ativados Ambos |

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

RptStatus({|lEnd| RelSQLImp(@lEnd, wnrel, cString) }, "Aguarde...", "Processando registros...", .T. )

  

Return

  

///////////////////////////////////////////////////////////////////////////////////

//+-----------------------------------------------------------------------------+//

//| PROGRAMA  | Relatorio_SQL.prw    | AUTOR | Robson Luiz  | DATA | 18/01/2004 |//

//+-----------------------------------------------------------------------------+//

//| DESCRICAO | Funcao - u_RelSQLImp()                                          |//

//|           | Fonte utilizado no curso oficina de programacao.                |//

//|           | Funcao de impressao                                             |//

//+-----------------------------------------------------------------------------+//

///////////////////////////////////////////////////////////////////////////////////

Static Function RelSQLImp(lEnd,wnrel,cString)

Local cFilSE2   := xFilial(cString)

Local cQuery    := ""

Local aCol      := {}

Local cFornec   := ""

Local nValor    := 0

Local nPago     := 0

Local nSaldo    := 0

Local nT_Valor  := 0

Local nT_Pago   := 0

Local nT_Saldo  := 0

Local cArqExcel := ""

  
  

// *** VALIDAÇÃO DAS DATAS ***

Local cDataDe := "19000101"  // Data mínima padrão

Local cDataAte := "21991231" // Data máxima padrão

  

If ValType(mv_par05) == "D" .and. !Empty(mv_par05)

    cDataDe := Dtos(mv_par05)

EndIf

  

If ValType(mv_par06) == "D" .and. !Empty(mv_par06)

    cDataAte := Dtos(mv_par06)

EndIf

  

//+-----------------------

//| Cria filtro temporario

//+-----------------------

cQuery := "SELECT "

cQuery += "E2_PREFIXO, E2_NUM, E2_PARCELA, E2_TIPO, E2_FORNECE, E2_LOJA, E2_NOMFOR, "

cQuery += "E2_EMISSAO, E2_VENCTO, E2_VENCREA, E2_VALOR, E2_SALDO "

cQuery += "FROM "+RetSqlName("SE2")+" "

cQuery += "WHERE E2_FILIAL = '"+cFilSE2+"' "

cQuery += "AND E2_FORNECE >= '"+mv_par01+"' "

cQuery += "AND E2_FORNECE <= '"+mv_par02+"' "

cQuery += "AND E2_TIPO >= '"+mv_par03+"' "

cQuery += "AND E2_TIPO <= '"+mv_par04+"' "

cQuery += "AND E2_VENCTO >= '"+cDataDe+"' "  // *** USAR VARIÁVEIS VALIDADAS ***

cQuery += "AND E2_VENCTO <= '"+cDataAte+"' " // *** USAR VARIÁVEIS VALIDADAS ***

cQuery += "AND D_E_L_E_T_ <> '*' "

cQuery += "ORDER BY "

//+-----------------------

//| Cria indice temporario

//+-----------------------

If aReturn[8] == 1            //Fornecedor

   cQuery += "E2_FORNECE,E2_LOJA,E2_NUM"

Elseif aReturn[8] == 2        //Titulo

   cQuery += "E2_NUM,E2_FORNECE,E2_LOJA"

Elseif aReturn[8] == 3        //Emissao

   cQuery += "E2_EMISSAO,E2_FORNECE,E2_LOJA"

Elseif aReturn[8] == 4        //Vencimento

   cQuery += "E2_VENCTO,E2_FORNECE,E2_LOJA"

Elseif aReturn[8] == 5        //Vencimento Real

   cQuery += "E2_VENCREA,E2_FORNECE,E2_LOJA"

Endif

  

Titulo += aOrd[aReturn[8]]

  

//+-----------------------

//| Cria uma view no banco

//+-----------------------

dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRB", .T., .F. )

dbSelectArea("TRB")

dbGoTop()

SetRegua( RecCount() )

  

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

  

cFornec := TRB->E2_FORNECE+TRB->E2_LOJA

  

While !Eof() .And. !lEnd

   If Li > 55

      Cabec(Titulo,Cabec1,Cabec2,NomeProg,Tamanho,nTipo)

   Endif

   @ Li, aCol[1] PSay "Cod/Loj/Nome: "+TRB->E2_FORNECE+"-"+TRB->E2_LOJA+" "+TRB->E2_NOMFOR

   Li ++

   While !Eof() .And. !lEnd .And. TRB->E2_FORNECE+TRB->E2_LOJA == cFornec

      IncRegua()

      If Li > 55

         Cabec(Titulo,Cabec1,Cabec2,NomeProg,Tamanho,nTipo)

      Endif

      If mv_par07 == 2

         @ Li, aCol[1]  PSay TRB->E2_PREFIXO

         @ Li, aCol[2]  PSay TRB->E2_NUM

         @ Li, aCol[3]  PSay TRB->E2_PARCELA

         @ Li, aCol[4]  PSay TRB->E2_TIPO

         @ Li, aCol[5]  PSay TRB->E2_EMISSAO

         @ Li, aCol[6]  PSay TRB->E2_VENCTO

         @ Li, aCol[7]  PSay TRB->E2_VENCREA

         @ Li, aCol[8]  PSay TRB->E2_VALOR               PICTURE "@E 99,999,999,999.99"

         @ Li, aCol[9]  PSay TRB->E2_VALOR-TRB->E2_SALDO PICTURE "@E 99,999,999,999.99"

         @ Li, aCol[10] PSay TRB->E2_SALDO               PICTURE "@E 99,999,999,999.99"

         Li ++

      Endif

      nValor += TRB->E2_VALOR

      nPago  += (TRB->E2_VALOR-TRB->E2_SALDO)

      nSaldo += TRB->E2_SALDO

      nT_Valor += TRB->E2_VALOR

      nT_Pago  += (TRB->E2_VALOR-TRB->E2_SALDO)

      nT_Saldo += TRB->E2_SALDO

  

      dbSkip()

   End

   @ Li, 000 PSay Replicate("-",Limite)

   Li ++

   @ Li, aCol[1]  PSay "TOTAL....."

   @ Li, aCol[8]  PSay nValor PICTURE "@E 99,999,999,999.99"

   @ Li, aCol[9]  PSay nPago  PICTURE "@E 99,999,999,999.99"

   @ Li, aCol[10] PSay nSaldo PICTURE "@E 99,999,999,999.99"

   Li +=2

   cFornec := TRB->E2_FORNECE+TRB->E2_LOJA

   nValor  := 0

   nPago   := 0

   nSaldo  := 0

End

  

If lEnd

   @ Li, aCol[1] PSay cCancel

   Return

Endif

  

@ Li, 000 PSay Replicate("=",Limite)

Li ++

@ Li, aCol[1]  PSay "TOTAL GERAL....."

@ Li, aCol[8]  PSay nT_Valor PICTURE "@E 99,999,999,999.99"

@ Li, aCol[9]  PSay nT_Pago  PICTURE "@E 99,999,999,999.99"

@ Li, aCol[10] PSay nT_Saldo PICTURE "@E 99,999,999,999.99"

If Li <> 80

   Roda(cbCont,cbTxt,Tamanho)

Endif

  

//+-------------------------------------------------------------------------------

//| Gera arquivo do tipo .DBF com extensao .XLS p/ usuario abrir no Excel.

//+-------------------------------------------------------------------------------

cArqExcel := __RELDIR+NomeProg+Substr(cUsuario,7,4)+".XLS"

Copy To &cArqExcel

  

dbSelectArea("TRB")

dbCloseArea()

  

If aReturn[5] == 1

   Set Printer TO

   dbCommitAll()

   Ourspool(wnrel)

EndIf

  

Ms_Flush()

  

Return

  

///////////////////////////////////////////////////////////////////////////////////

//+-----------------------------------------------------------------------------+//

//| PROGRAMA  | Relatorio_SQL.prw    | AUTOR | Robson Luiz  | DATA | 18/01/2004 |//

//+-----------------------------------------------------------------------------+//

//| DESCRICAO | Funcao - CriaSX1()                                              |//

//|           | Fonte utilizado no curso oficina de programacao.                |//

//|           | Funcao que cria o grupo de perguntas se caso nao existir        |//

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

  

Caracter stica do vetor p/ utiliza  o da fun  o SX1

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

aAdd(aP,{"Fornecedor de"             ,"C",6,0,"G",""                    ,"SA2",""   ,""   ,"","",""})

aAdd(aP,{"Fornecedor ate"            ,"C",6,0,"G","(mv_par02>=mv_par01)","SA2",""   ,""   ,"","",""})

aAdd(aP,{"Tipo de"                   ,"C",3,0,"G",""                    ,"05" ,""   ,""   ,"","",""})

aAdd(aP,{"Tipo ate"                  ,"C",3,0,"G","(mv_par04>=mv_par03)","05" ,""   ,""   ,"","",""})

aAdd(aP,{"Vencimento de"             ,"D",8,0,"G",""                    ,""   ,""   ,""   ,"","",""})

aAdd(aP,{"Vencimento ate"            ,"D",8,0,"G","(mv_par06>=mv_par05)",""   ,""   ,""   ,"","",""})

aAdd(aP,{"Aglutinar pagto.de fornec.","N",1,0,"C",""                    ,""   ,"Sim","Nao","","",""})

  

aAdd(aHelp,{"Informe o c digo do fornecedor.","inicial."})

aAdd(aHelp,{"Informe o c digo do fornecedor.","final."})

aAdd(aHelp,{"Tipo de t tulo inicial."})

aAdd(aHelp,{"Tipo de t tulo final."})

aAdd(aHelp,{"Digite a data do vencimento incial."})

aAdd(aHelp,{"Digite a data do vencimento final."})

aAdd(aHelp,{"Aglutinar os t tulos do mesmo forne-","cedor totalizando seus valores."})

  

For i:=1 To Len(aP)

   cSeq   := StrZero(i,2,0)

   cMvPar := "mv_par"+cSeq

   cMvCh  := "mv_ch"+IIF(i<=9,Chr(i+48),Chr(i+87))

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

---

1. **Cabeçalho de comentários (linhas iniciais)**
    

- Bloco com `///////////////////////////////////////////////////////////////////////////////////` e comentários do tipo:
    
    - Identifica o programa (`Relatorio_SQL.prw`), autor (`Robson Luiz`), data, descrição e histórico de manutenção.
        
    - **Função:** documentação para quem for manter o código (propósito, versão, autor).
        
    - **Observação:** útil e obrigatório em ambientes corporativos; não afeta execução.
        

---

2. **Comentário `Lay-Out do Relatorio -> SQL`**
    

- Mostra o layout esperado do relatório (colunas, largura, exemplo de linhas).
    
- Uma régua numérica (0..123) ajuda a posicionar colunas por caractere.
    
- **Função:** guia visual para alinhar `@ linha, coluna PSay` e `aCol` com as colunas do relatório.
    

---

3. **Declaração da função principal: `User Function Rel_SQL()`**
    

- Início do procedimento (função pública) que controla a captura de parâmetros, configuração de impressão e dispara a geração do relatório.
    
- Tudo o que vem depois (até `Return`) é o corpo desse fluxo principal.
    

---

4. **Declaração de variáveis (`Local` e `Private`)**
    

- Várias variáveis são inicializadas; vou explicar as mais importantes:
    
    - `cDesc1`, `cDesc2`, `cDesc3`  
        Textos descritivos exibidos ao usuário sobre o relatório (explicação do que será gerado).
        
    - `cString := "SE2"`  
        Identificador/alias da tabela usada (provavelmente tabela `SE2` — contas a pagar).
        
    - `Tamanho := "M"`  
        Tamanho/fonte para impressão (M = médio). Usado por funções de formatação.
        
    - `aReturn := { "Zebrado",1,"Administracao",2,2,1,"",1 }`  
        Vetor padrão de retorno/parametros de impressão preenchido pelo `SetPrint()` (segue comentário explicativo mais abaixo).  
        O comentário no código descreve o significado dos índices de `aReturn` (ex.: aReturn[4] = formato, aReturn[5] = mídia, aReturn[8] = ordem).
        
    - `wnrel := "RELSQL"`, `NomeProg := "RELSQL"`  
        Nome do spool/relatório e do programa (usado para arquivos, spool, etc).
        
    - `nLastKey := 0`  
        Guarda tecla de escape/última tecla; verificado para sair (ESC = 27).
        
    - `Limite := 132`  
        Largura em caracteres do cabeçalho/linha de separador (usado em `Replicate("-", Limite)`).
        
    - `Titulo := "Titulo a Pagar - Ordem de "`  
        Parte fixa do título; mais tarde é concatenado com a ordem escolhida.
        
    - `cPerg := "RELSQL"`  
        Nome do grupo de perguntas (SX1) que será criado/consultado.
        
    - `nTipo := 0`  
        Tipo de impressão (linhas/altura), setado depois conforme `aReturn`.
        
    - `cbCont := 0`, `cbTxt := "registro(s) lido(s)"`  
        Controle de contadores/textos para fluxo de impressão.
        
    - `Li := 80`  
        **Linha corrente** para impressão no buffer/página. Começa em 80 para forçar impressão do cabeçalho logo no início (explicarei abaixo).
        
    - `m_pag := 1`  
        Número da página.
        
    - `aOrd := {}`  
        Vetor que receberá nomes das ordens de agrupamento (fornecedor, título, etc).
        
    - `Cabec1` e `Cabec2`  
        Strings que representam cabeçalho e sub-cabeçalho do relatório (Cabec1 tem o título das colunas).
        

---

5. **Verificação de dependência: `#IFNDEF TOP`**
    

- `#IFNDEF TOP ... RETURN` — checa se o ambiente TopConnect (biblioteca / macro) está definido.
    
- Se não houver suporte (`TOP` não definido), mostra `MsgInfo(...)` e retorna.
    
- **Função:** evita tentar rodar funções que dependem do TopConnect; proteção inicial.
    

---

6. **Comentário explicando `aReturn` (mapa do vetor)**
    

- O trecho explica o que cada posição do vetor retornado por `SetPrint()` significa. Muito útil para entender `aReturn[4]`, `aReturn[5]`, `aReturn[8]`, etc.
    

---

7. **Preenchendo opções de ordenação: `aAdd(aOrd, "...")`**
    

- `aOrd` recebe:
    
    - `"Fornecedor"`, `"Titulo"`, `"Emiss o"`, `"Vencimento"`, `"Vencto. Real"`
        
- Esses rótulos serão usados para montar o título final (`Titulo += aOrd[aReturn[8]]`) e para definir o `ORDER BY` do SQL via `aReturn[8]` (escolha do usuário).
    

---

8. **CriaSx1() — criação do grupo de perguntas**
    

- `CriaSx1()` é chamada para criar (se necessário) o grupo de parâmetros `cPerg` utilizado para entrada de parâmetros do relatório.
    
- Veja função `CriaSx1()` mais abaixo (explicada em detalhe), ela cadastra perguntas como fornecedor inicial/final, tipo inicial/final, vencimento inicial/final e opção de aglutinar.
    

---

9. **Exibição/leitura de parâmetros: `Pergunte(cPerg,.F.)`**
    

- Chama rotina que apresenta ao usuário as perguntas (SX1) definidas em `CriaSx1()` para que ele preencha as variáveis `mv_par01`, `mv_par02`, ..., `mv_par07`.
    
- `.F.` provavelmente significa sem exibir ajuda extra — depende da implementação.
    

---

10. **Chamada para parametrizar impressão: `SetPrint(...)`**
    

- `wnrel := SetPrint(cString,wnrel,cPerg,@Titulo,cDesc1,cDesc2,cDesc3,.F.,aOrd,.F.,Tamanho,.F.,.F.)`
    
    - `SetPrint` abre diálogo de opções de impressão (formato, mídia, número de vias, compressão, ordem, etc).
        
    - Retorna `aReturn` preenchido (o `aReturn` inicial é apenas padrão).
        
    - Parâmetros passados: alias, nome rel, grupo de perguntas, ponteiro para o título, descrições, vetor de ordens, tamanho (M), etc.
        
- **Importante:** comportamento depende da implementação da biblioteca (TopConnect).
    

---

11. **Verifica ESC: `If nLastKey == 27 Return`**
    

- Se o usuário pressionou ESC em algum diálogo anterior (`nLastKey` foi setado por `Pergunte`/`SetPrint`), aborta o relatório.
    

---

12. **SetDefault(aReturn,cString)**
    

- Define padrões de impressão a partir de `aReturn` e `cString` (alias/tabela).
    
- Normaliza variáveis/arquivo de spool.
    

---

13. **Define tipo de impressão (`nTipo`)**
    

- `nTipo := Iif(aReturn[4] == 1, 15, 18)`
    
    - Se formato comprimido (aReturn[4] == 1) então usa 15 (linhas/colunas ou fonte pequena), caso contrário 18.
        
    - Usado por `Cabec()` para escolher layout/altura por linha.
        

---

14. **Checagem ESC novamente**
    

- Repetição da verificação do `nLastKey` antes de iniciar o processamento.
    

---

15. **Chamada que dispara processamento com barra de progresso: `RptStatus(...)`**
    

- `RptStatus({|lEnd| RelSQLImp(@lEnd, wnrel, cString) }, "Aguarde...", "Processando registros...", .T. )`
    
    - `RptStatus` executa a função passada (aqui um bloco que chama `RelSQLImp`) e exibe progresso/mensagem.
        
    - `lEnd` é passado por referência para permitir a interrupção (cancelamento pelo usuário).
        
- **Fluxo:** o trabalho pesado de ler a base e imprimir está em `RelSQLImp`.
    

---

16. **Final do `Rel_SQL`: `Return`**
    

- Volta ao chamador; o restante do processamento foi executado por `RelSQLImp`.
    

---

17. **Declaração da função de impressão: `Static Function RelSQLImp(lEnd,wnrel,cString)`**
    

- Função estática (visível apenas neste arquivo) que gera o relatório: abre a consulta, itera registros, imprime, totaliza e grava arquivo Excel.
    
- `lEnd` é flag de parada; `wnrel` e `cString` já vistos.
    

---

18. **Variáveis locais da `RelSQLImp`**
    

- `cFilSE2 := xFilial(cString)`  
    Consulta a filial/empresa a partir do alias `cString` (normalmente retorna código filial a ser usado no `WHERE E2_FILIAL = '...'`).
    
- `cQuery := ""`  
    String que será montada com o SQL (SELECT ... FROM ... WHERE ... ORDER BY ...).
    
- `aCol := {}`  
    Array de posições coluna (valores numéricos com offset em caracteres) usado por `@ Li, aCol[n] PSay`.
    
- `cFornec := ""`  
    String que guarda a chave atual de agrupamento fornecedor+loja.
    
- `nValor, nPago, nSaldo` e `nT_Valor, nT_Pago, nT_Saldo`  
    Totais por fornecedor (`n*`) e totais gerais (`nT_*`).
    
- `cArqExcel := ""`  
    Caminho do arquivo que será gerado para Excel.
    

---

19. **Validação das datas (mv_par05 / mv_par06)**
    

- `cDataDe` e `cDataAte` recebem defaults seguros: `"19000101"` e `"21991231"`.
    
- Se `mv_par05` ou `mv_par06` for do tipo `D` (data) e não vazio, converte com `Dtos(mv_par05)` (provavelmente formata `dd/mm/aaaa` para `yyyymmdd` ou string usada no banco).
    
- **Função:** garante que o filtro de datas no `WHERE` use valores válidos (proteção contra entrada inválida).
    

---

20. **Montagem da query SQL:**
    

- Trecho:
    
    ```
    cQuery := "SELECT E2_PREFIXO, E2_NUM, E2_PARCELA, E2_TIPO, E2_FORNECE, E2_LOJA, E2_NOMFOR, E2_EMISSAO, E2_VENCTO, E2_VENCREA, E2_VALOR, E2_SALDO FROM "+RetSqlName("SE2")+" WHERE E2_FILIAL = '"+cFilSE2+"' AND E2_FORNECE >= '"+mv_par01+"' AND E2_FORNECE <= '"+mv_par02+"' AND E2_TIPO >= '"+mv_par03+"' AND E2_TIPO <= '"+mv_par04+"' AND E2_VENCTO >= '"+cDataDe+"' AND E2_VENCTO <= '"+cDataAte+"' AND D_E_L_E_T_ <> '*' ORDER BY "
    ```
    
- **O que faz:** seleciona campos relevantes da tabela `SE2` (prefixo, número, parcela, tipo, fornecedor, loja, nome fornecedor, emissão, vencimento, vencimento real, valor, saldo) aplicando filtros passados pelo usuário (fornecedor intervalo, tipo intervalo, vencimento intervalo, filial) e excluindo registros marcados como deletados (`D_E_L_E_T_ <> '*'`).
    
- **RetSqlName("SE2")**: função que retorna o nome físico (schema/tabela) apropriado para consulta.
    
- **Atenção de segurança:** os parâmetros são concatenados diretamente na string SQL. Em geral existe risco de injeção se qualquer parâmetro puder ser manipulado por usuário. No ambiente Protheus/TOP a fonte dos `mv_parXX` costuma ser parametrizada com validação, mas é bom ter cuidado.
    

---

21. **Montagem do `ORDER BY` conforme escolha do usuário**
    

- Compara `aReturn[8]`:
    
    - `1` -> `E2_FORNECE,E2_LOJA,E2_NUM` (ordenar por fornecedor)
        
    - `2` -> `E2_NUM,E2_FORNECE,E2_LOJA` (ordenar por título)
        
    - `3` -> `E2_EMISSAO,...` (emissão)
        
    - `4` -> `E2_VENCTO,...` (vencimento)
        
    - `5` -> `E2_VENCREA,...` (vencimento real)
        
- `Titulo += aOrd[aReturn[8]]` — o título do relatório recebe o rótulo da ordem escolhida (ex.: “Ordem de Fornecedor”).
    

---

22. **Criação de uma view/área temporária com o resultado:**
    

- `dbUseArea( .T., "TOPCONN", TcGenQry(,,cQuery), "TRB", .T., .F. )`
    
    - Abre uma área (alias) chamada `TRB` usando a conexão `TOPCONN` e a query gerada por `TcGenQry(,,cQuery)`.
        
    - `TcGenQry` aparentemente transforma a string SQL em uma consulta acessível via DBF/TopConnect.
        
- `dbSelectArea("TRB")` e `dbGoTop()` posicionam no primeiro registro.
    
- `SetRegua( RecCount() )` ajusta alguma régua/progressão com o total de registros (usado por barra de progresso).
    

---

23. **Definição das colunas de impressão: `aAdd(aCol, ...)`**
    

- Preenche `aCol` com offsets (coluna em que cada campo deve ser impresso):
    
    - `004` Prefixo, `012` Título, `024` Parcela, `031` Tipo, `036` Emissão, `046` Vencimento, `058` Vencimento Real, `070` Valor Original, `090` Pago, `110` Saldo.
        
- Essas posições se alinham com o `Cabec1` e com a régua do layout.
    

---

24. **Agrupamento inicial por fornecedor:**
    

- `cFornec := TRB->E2_FORNECE+TRB->E2_LOJA`  
    Chave para agrupar registros do mesmo fornecedor + loja (quando mudar, imprime total daquele fornecedor).
    

---

25. **Loop principal: `While !Eof() .And. !lEnd`**
    

- Percorre todos os registros retornados pela consulta, até o final (`Eof`) ou até o usuário interromper (`lEnd`).
    
- **Impressão do cabeçalho por página:**  
    `If Li > 55 Cabec(...) Endif`  
    Se a posição de linha atual (`Li`) ultrapassar o limite 55, reimprime cabeçalho (provavelmente controla paginação: a página tem ~55 linhas úteis).
    
- **Imprime a linha do fornecedor:**  
    `@ Li, aCol[1] PSay "Cod/Loj/Nome: "+TRB->E2_FORNECE+"-"+TRB->E2_LOJA+" "+TRB->E2_NOMFOR`  
    Mostra o código/loja/nome do fornecedor. Incrementa `Li`.
    

---

26. **Loop interno por registros do mesmo fornecedor: `While !Eof() .And. !lEnd .And. TRB->E2_FORNECE+TRB->E2_LOJA == cFornec`**
    

- Lê todos os títulos pertencentes ao mesmo fornecedor (agrupamento).
    
- `IncRegua()`  
    Atualiza o contador/indicador de progresso (regua).
    
- `If Li > 55 Cabec(...) Endif`  
    Reimprime cabeçalho se necessário.
    
- **Condição `If mv_par07 == 2`**
    
    - Controla se imprime ou não os títulos detalhados. Pelo `CriaSx1` a variável `mv_par07` é o campo "Aglutinar pagto.de fornec." (N=1?), aqui quando igual a `2` o código imprime linha a linha. Interpretação: **quando o usuário escolhe detalhar (não aglutinar)** o programa imprime cada título. Se o parâmetro indicar aglutinar, esse bloco não imprime os detalhes e só mostra totais por fornecedor.
        
    - Dentro do bloco há vários `@ Li, aCol[...] PSay TRB->E2_*` que imprimem os campos conforme colunas definidas.
        
- **Exemplos de formatação numérica:**  
    `PICTURE "@E 99,999,999,999.99"` — formata número para exibição com separadores e casas decimais, específico do runtime Harbour/AdvPL.
    
- `Li ++` — avança linha a cada registro impresso.
    
- **Acumulação de totais por fornecedor e gerais:**
    
    - `nValor += TRB->E2_VALOR`
        
    - `nPago += (TRB->E2_VALOR-TRB->E2_SALDO)` (calcula quanto foi pago)
        
    - `nSaldo += TRB->E2_SALDO`
        
    - `nT_Valor, nT_Pago, nT_Saldo` são os totais gerais (soma de todos os fornecedores).
        
- `dbSkip()` avança para o próximo registro na view.
    

---

27. **Imprime total do fornecedor (quando sai do grupo)**
    

- Após terminar o `While` interno (grupo de um fornecedor):
    
    - Imprime linha separadora: `@ Li, 000 PSay Replicate("-",Limite)`
        
    - Imprime `TOTAL.....` e os totais do grupo em colunas 8/9/10 (Valor/Pago/Saldo) com PICTURE.
        
    - Avança `Li += 2`
        
    - Reseta `nValor`, `nPago`, `nSaldo` para o próximo fornecedor e atualiza `cFornec` com a nova chave.
        

---

28. **Tratamento de interrupção pelo usuário: `If lEnd`**
    

- Se `lEnd` (flag enviada por `RptStatus`) for verdadeira, imprime mensagem de cancelamento (`cCancel`) e `Return`.
    
- `cCancel` provavelmente é uma string global com texto padrão ("Processamento cancelado" etc). Se não definida, pode imprimir vazio — depende do sistema.
    

---

29. **Total geral**
    

- Ao fim do laço principal imprime um separador com `=` e `TOTAL GERAL.....` com os `nT_Valor`, `nT_Pago`, `nT_Saldo`.
    
- `If Li <> 80 Roda(cbCont,cbTxt,Tamanho) Endif`
    
    - Se a linha corrente não for a posição inicial (80), chama `Roda(...)` — provavelmente lógica para avançar/rodar página, contadores, imprimir rodapé, etc.
        

---

30. **Geração de arquivo para Excel (.XLS)**
    

- `cArqExcel := __RELDIR+NomeProg+Substr(cUsuario,7,4)+".XLS"`
    
    - Monta nome de arquivo na pasta de relatórios (`__RELDIR`) usando `NomeProg` e último trecho do nome de usuário `cUsuario` (substr).
        
    - Ex.: `REL_DBFRELSQLXXXX.XLS` onde `XXXX` é parte do usuário.
        
- `Copy To &cArqExcel`
    
    - Comando que copia a área atual (`TRB`) para arquivo DBF/XLS; o `&` faz macroexpansão do nome. Resultado: o usuário terá um `.XLS` que o Excel pode abrir.
        
    - **Observação:** esse `Copy To` copia a estrutura do work-area (a view TRB) para arquivo; dependendo do ambiente, extensão `.XLS` é apenas DBF renomeado — funciona para abrir no Excel, mas não é um XLS binário nativo.
        

---

31. **Fechamento da área**
    

- `dbSelectArea("TRB")`
    
- `dbCloseArea()` — fecha a área/consulta temporária.
    

---

32. **Se saída por disco (aReturn[5] == 1) — spool e commit**
    

- `If aReturn[5] == 1`
    
    - `Set Printer TO` — reseta impressora (volta ao dispositivo padrão).
        
    - `dbCommitAll()` — confirma transações em banco (se houver alterações).
        
    - `Ourspool(wnrel)` — rotina que gera/escreve o spool (arquivo final), dependendo da configuração.
        
- `Ms_Flush()` — limpa buffers/filas de mensagem (garante flush).
    

---

33. **Retorno da função `RelSQLImp`**
    

- `Return` encerra a execução da função.
    

---

34. **Função `CriaSx1()` — criação das perguntas (SX1)**
    

- Objetivo: registrar um grupo de perguntas (perguntas de entrada) com `PutSx1` caso o grupo não exista, para que o usuário possa inserir `mv_par01`..`mv_par07`.
    
- Inicializa `aP` com a definição das perguntas e `aHelp` com textos de ajuda.
    
- **Estrutura do vetor `aP` (cada linha):**
    
    - Ex.: `aAdd(aP,{"Fornecedor de" ,"C",6,0,"G","" ,"SA2","" ,"" ,"","",""})`
        
    - Cada entrada define: texto da pergunta, tipo (`C` = character, `D` = data, `N` = numérico), tamanho, decimais, objeto (G = get, C = choice), expressão de validação, referência F3 (ex.: "SA2"), e opções de definição.
        
    - O comentário no topo de `CriaSx1()` explica a ordem dos parâmetros que `PutSx1()` aceita.
        
- `aAdd(aHelp, {...})` adiciona textos de ajuda correspondentes às perguntas.
    
- Loop `For i := 1 To Len(aP)`:
    
    - `cSeq := StrZero(i,2,0)` => gera índice com 2 dígitos: "01", "02", ...
        
    - `cMvPar := "mv_par"+cSeq` => nome da variável que armazenará resposta: `mv_par01`...
        
    - `cMvCh := "mv_ch" + IIF(i<=9,Chr(i+48),Chr(i+87))` => cria o código de variável `mv_ch1..mv_ch9,mv_cha,mv_chb,...` (caracteres de controle).
        
    - Em seguida chama `PutSx1(...)` com todos os argumentos montados — registra a pergunta no grupo `cPerg`.
        
- `Return ""` finaliza `CriaSx1()`.
    

---

35. **Observações gerais, riscos e sugestões práticas**
    

- **Risco de SQL concatenado:** a query monta `WHERE ... E2_FORNECE >= '"+mv_par01+"'"` diretamente. Em ambientes onde `mv_parXX` não esteja restrito, há risco de injeção. Se possível, use bind parameters ou valide fortemente (`ValType`, tamanho e máscara).
    
- **Dependências externas / funções não mostradas:** funções como `Pergunte`, `SetPrint`, `TcGenQry`, `dbUseArea`, `Cabec`, `PSay`, `IncRegua`, `SetRegua`, `Roda`, `Ourspool`, `PutSx1` são fornecidas pelo framework/ambiente (TOPCONN / Protheus / Harbour). É importante conhecê-las para ajustar comportamento.
    
- **Formatação numérica (`PICTURE`)** é específica do runtime; verificar se o ambiente que abrirá o arquivo `.XLS` entende formatação esperada.
    
- **`Copy To &cArqExcel`**: confirmar formato resultante; alguns ambientes geram um DBF com extensão XLS (compatível com Excel), outros geram CSV — testar com o cliente.
    
- **`Li := 80`:** valor inicial alto para forçar a impressão do cabeçalho na primeira iteração (condição `If Li > 55` -> imprime header). Explicita intenção, porém pode ser mais claro inicializar `Li := 56` ou chamar `Cabec()` explicitamente antes do loop.
    
- **Parâmetro mv_par07 (aglutinar)**: a lógica `If mv_par07 == 2` imprime linhas detalhadas. Verificar a codificação (1/2/3) atribuída por `PutSx1` às opções "Sim"/"Nao"/"Ambos" para garantir consistência.
    
- **Tratamento de cancelamento:** `lEnd` é verificado em pontos chaves — bom; porém, dependendo de `RptStatus`, pode haver necessidade de checar também em pontos extras (antes de `Copy To` por exemplo).
    
- **Internacionalização / datas:** `Dtos()` converte datas para formato usado no banco; manter consistência entre formatos `dd/mm/yyyy` e `yyyymmdd`.
    

---

36. **Resumo final (fluxo completo)**
    

- O programa:
    
    1. Define texto e layout (comentários).
        
    2. Cria/garante perguntas (SX1) e pede parâmetros ao usuário.
        
    3. Abre diálogo de impressão (`SetPrint`) e recebe configuração (`aReturn`).
        
    4. Valida entradas (datas).
        
    5. Monta SQL com filtros e `ORDER BY` conforme opção do usuário.
        
    6. Executa a query e abre uma área temporária (`TRB`).
        
    7. Itera registros, imprimindo cabeçalho, detalhes (se solicitado) e totais por fornecedor.
        
    8. Gera total geral e copia dados para arquivo `.XLS`.
        
    9. Fecha área, grava spool/arquivo se solicitado e finaliza.
        
