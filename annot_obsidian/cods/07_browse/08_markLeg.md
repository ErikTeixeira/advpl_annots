## 8 - Exercício
```prw 
#Include "Protheus.Ch"


/*/{Protheus.doc} U_MarkLeg
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao de MarkBrowse + Legenda
    @see        https://tdn.totvs.com/display/public/framework/MarkBrow
/*/

  

User Function MarkLeg()

    Local aSay      := {}

    Local aButton   := {}

    Local nOpcao    := 0

  

    Private cCadastro   := "Exemplo de MarkBrowse + Legenda"

    MrkBrwDados()

  

Return

  

Static Function MrkBrwDados()

    Local nI        := 0

    Local aCpos     := {}

    Local aCampos   := {}

    Local aIndex    := {}

    Private aRotina := {}

    Private bFiltraBrw := {|| }

    //+--------------------------------------------------------+

    //| Parametros utilizado no programa                       |

    //+--------------------------------------------------------+

    //| mv_par01 - Emissao de?                      99/99/99   |

    //| mv_par02 - Emissao ate?                     99/99/99   |

    //| mv_par03 - Forncedor de?                    999999     |

    //| mv_par04 - Fornecedor ate?                  999999     |

    //| mv_par05 - Mostrar todos os registros?      Sim/Não    |

    //| mv_par06 - Trazer marcados?                 Sim/Não    |

    //+--------------------------------------------------------+

    mv_par01 := StoD('19000101')

    mv_par02 := StoD('20501231')

    mv_par03 := '000000'

    mv_par04 := '999999'

    mv_par05 := 1

    mv_par06 := 1

  

    //+----------------------------------------

    //| Atribui as variaveis de funcionalidades

    //+----------------------------------------

    aAdd( aRotina ,{"Pesquisar" ,"u_MrkBrwPesq()",0,1})

    aAdd( aRotina ,{"Processar" ,"u_MrkBrwProc()",0,3})

    aAdd( aRotina ,{"Legenda"   ,"u_MrkBrwLeg()" ,0,4})

    //+----------------------------------------------------

    //| Somente deverão aparecer estes campos na MarkBrowse

    //+----------------------------------------------------

    aCpos := {"F1_OK","F1_DOC","F1_SERIE","F1_FORNECE","F1_LOJA","F1_EMISSAO","F1_VALBRUT","F1_TIPO"}

    /*

    * Estrutura do vetor aCampos

    * --------------------------

    * [1] - Nome do campo

    * [2] - Obsoleto

    * [3] - Título do campo

    * [4] - Picure do campo

    */

  

    SX3->(dbSetOrder(2))

  

    For nI := 1 To Len(aCpos)

    SX3->(dbSeek(aCpos[nI]))

    aAdd(aCampos,{  RTrim(SX3->X3_CAMPO),"",;

                        Iif(nI==1," ",X3Titulo()),;

                        RTrim(SX3->X3_PICTURE)})

    Next

        //+------------------------------------------------------------------------

        //| Monta as variáveis com o filtro especifico para o resultado na MarkBrow

        //+------------------------------------------------------------------------

        // Filtro DBF

        cFiltro := "Dtos(F1_EMISSAO) >= '"+Dtos(mv_par01)+"' .And. "

        cFiltro += "Dtos(F1_EMISSAO) <= '"+Dtos(mv_par02)+"' .And. "

        cFiltro += "F1_FORNECE >= '"+mv_par03+"' .And. "

        cFiltro += "F1_FORNECE <= '"+mv_par04+"' "

        If mv_par05 == 2

        cFiltro += ".And. Empty(F1_REMITO)"

        Endif

        // Filtro SQL

        cQuery := "F1_EMISSAO >= '"+Dtos(mv_par01)+"' AND "

        cQuery += "F1_EMISSA0 <= '"+Dtos(mv_par02)+"' AND "

        cQuery += "F1_FORNECE >= '"+mv_par03+"' AND "

        cQuery += "F1_FORNECE <= '"+mv_par04+"' "

        If mv_par05 == 2

            cQuery += "AND F1_REMITO = ' ' "

        Endif  

  

        //+-------------------------------------------------------

        //| Processa o filtro conforme a base de dados do Protheus

        //+-------------------------------------------------------

        bFiltraBrw := {|x| Iif(x==NIL,FilBrowse("SF1",@aIndex,@cFiltro),{cFiltro,cQuery,"","",aIndex}) }

        Eval(bFiltraBrw)

        SF1->(MsSeek(xFilial()))

  

        //+------------------------------------------------------

        //| Apresenta o MarkBrowse para o usuario se houver dados

        //+------------------------------------------------------

        If !SF1->(EOF()) .And. !SF1->(BOF())

            MarkBrow("SF1","F1_OK","SF1->F1_REMITO",aCampos,(mv_par06==1),GetMark(,"SF1","F1_OK"))

        Else

            MsgInfo("Não há dados para apresentar nas tabela de documentos fiscais de entrada. Verifique os parâmetros.")

        Endif

        //+-------------------------

        //| Desfaz o indice e filtro

        //+-------------------------

        dbSelectArea("SX2")

        RetIndex("SX2")

        dbClearFilter()

        AEval(aIndex,{|x| Ferase(x[1]+OrdBagExt())})

  

Return

  

//+-------------------------------------------------------------+

//| Rotina | MrkBrwPesq | Autor | Robson Luiz | Data | 01.01.04 |

//+-------------------------------------------------------------+

//| Descr. | Rotina de pesquisa de registro no browse filtrado  |

//+-------------------------------------------------------------+

//| Uso    | Oficina de Programação                             |

//+-------------------------------------------------------------+

User Function MrkBrwPesq()

    AxPesqui()

    Eval(bFiltraBrw)

Return(.T.)

  

//+-------------------------------------------------------------+

//| Rotina | MrkBrwProc | Autor | Robson Luiz | Data | 01.01.04 |

//+-------------------------------------------------------------+

//| Descr. | Rotina de processamento dos registro seleiconados  |

//+-------------------------------------------------------------+

//| Uso    | Oficina de Programação                             |

//+-------------------------------------------------------------+

User Function MrkBrwProc()

    Local cReg := ""

    If !MsgYesNo("Confirma o processamento do registros marcados?")

        Return

    Endif

    SF1->(dbGoTop())

    While !SF1->(EOF())

        If IsMark("F1_OK",ThisMark(),ThisInv())

            cReg += SF1->( F1_SERIE+" "+F1_DOC+" "+F1_FORNECE+" "+F1_LOJA )+Chr(13)+Chr(10)

            SF1->(RecLock("SF1",.F.))

            SF1->F1_REMITO := "S"

            SF1->(MsUnLock())

        Endif

        SF1->(dbSkip())

    End

    MsgInfo("Os registros processados foram: "+Chr(13)+Chr(10)+cReg)

Return

  

User Function MrkBrwLeg()

    Local aCor := {}

    aAdd(aCor,{"BR_VERDE"   ,"Não Processado"})

    aAdd(aCor,{"BR_VERMELHO","Processado"    })

  

    BrwLegenda(cCadastro,"Status dos documentos",aCor)  

  

Return
```


# Cabeçalho e docblock

```advpl
#Include "Protheus.Ch"

/*/{Protheus.doc} U_MarkLeg
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao de MarkBrowse + Legenda
    @see        https://tdn.totvs.com/display/public/framework/MarkBrow
/*/
```

- `#Include "Protheus.Ch"`: inclui constantes, macros e declarações fundamentais do ambiente Protheus/AdvPL — praticamente obrigatório em fontes que interagem com o framework.
    
- O bloco `/*/{Protheus.doc} ... /*/` é apenas documentação para o gerador de docs (Protheus Doc): não executa nada, serve para descrever a função, autor, versão, exemplos e links de referência.
    

---

# User Function `MarkLeg()`

```advpl
User Function MarkLeg()


    Private cCadastro   := "Exemplo de MarkBrowse + Legenda"
        
    MrkBrwDados()

Return
```

Explanação, linha a linha:

1. `User Function MarkLeg()`
    
    - Declara a função publicamente acessível `U_MarkLeg` (nome lógico no RPO). É o ponto de entrada que o usuário chama.

2. `Private cCadastro := "Exemplo de MarkBrowse + Legenda"`
    
    - Declara `cCadastro` como **PRIVATE**, com valor textual.
        
    - `Private` aqui dá a `cCadastro` um escopo mais amplo que `Local`: ela fica acessível a outras funções dentro do mesmo módulo/fonte (útil: `MrkBrwDados()` e `MrkBrwLeg()` usam essa variável).
        
    - Valor serve como título/descritivo do cadastro que será mostrado em legendas ou títulos da tela.
        
3. `MrkBrwDados()`
    
    - Chama a rotina `MrkBrwDados` (que é `Static Function` definida abaixo). É onde está toda a construção do MarkBrowse e filtros.
        
4. `Return`
    
    - Retorna ao chamador (retorno implícito `NIL` / vazio). Final da função.
        

> Observação: as variáveis `aSay`, `aButton`, `nOpcao` parecem inúteis aqui — podem ser removidas para limpeza do código.

---

# Static Function `MrkBrwDados()` — função principal de montagem do MarkBrowse

Vou explicar em blocos lógicos e também linha a linha onde relevante.

```advpl
Static Function MrkBrwDados()
    Local nI      := 0
    Local aCpos   := {}
    Local aCampos := {}
    Local aIndex  := {}
        
    Private aRotina := {}
    Private bFiltraBrw := {|| }
```

- `Static Function MrkBrwDados()` — função com escopo restrito ao fonte; usada apenas internamente. É onde todo o MarkBrowse é preparado e exibido.
    
- `Local nI := 0` — índice para loops.
    
- `Local aCpos := {}` — array com nomes dos campos que serão exibidos no browse.
    
- `Local aCampos := {}` — array que receberá metadados (nome, título, picture) para cada coluna do MarkBrowse.
    
- `Local aIndex := {}` — array para armazenar índices temporários gerados por `FilBrowse()` (usado depois para apagar).
    
- `Private aRotina := {}` — array privado (visível em outras funções do fonte) que conterá as ações (botões/rotinas) do menu do MarkBrowse.
    
- `Private bFiltraBrw := {|| }` — declara uma **code block** (lambda) vazia inicialmente; será atribuída logo em seguida como closure que monta/aplica o filtro (usada também por `MrkBrwPesq`).
    

---

## Bloco de parâmetros e valores iniciais

Comentário no código explica os parâmetros `mv_par01..mv_par06`. Em seguida os valores são inicializados:

```advpl
mv_par01 := StoD('19000101')
mv_par02 := StoD('20501231')
mv_par03 := '000000'
mv_par04 := '999999'
mv_par05 := 1
mv_par06 := 1
```

- `StoD('YYYYMMDD')` converte string para data. Aqui definem um intervalo de datas abrangente por padrão (01/01/1900 a 31/12/2050).
    
- `mv_par03` e `mv_par04` definem faixa de fornecedor.
    
- `mv_par05` (1/2) e `mv_par06` (1/2) são flags de controle (no comentário: mostrar todos, trazer marcados, etc.). No código `mv_par05 == 2` é testado para um comportamento especial (filtrar remito vazio).
    

---

## Montando o menu/rotinas do MarkBrowse

```advpl
aAdd( aRotina ,{"Pesquisar" ,"u_MrkBrwPesq()",0,1})
aAdd( aRotina ,{"Processar" ,"u_MrkBrwProc()",0,3})
aAdd( aRotina ,{"Legenda"   ,"u_MrkBrwLeg()" ,0,4})
```

- `aAdd` adiciona itens ao array `aRotina`. Cada item é um vetor com:
    
    1. rótulo do botão/menu,
        
    2. rotina a executar (string com chamada),
        
    3. parâmetro (obsoleto/uso interno),
        
    4. posição/índice do botão.
        
- Assim vinculamos botões “Pesquisar”, “Processar” e “Legenda” às funções correspondentes.
    

---

## Quais campos mostrar no MarkBrowse

```advpl
aCpos := {"F1_OK","F1_DOC","F1_SERIE","F1_FORNECE","F1_LOJA","F1_EMISSAO","F1_VALBRUT","F1_TIPO"}
```

- Lista explícita com os nomes dos campos (campos da tabela `SF1`) que deverão aparecer no browse.
    

Comentário sobre estrutura de `aCampos`:

```
* [1] - Nome do campo
* [2] - Obsoleto
* [3] - Título do campo
* [4] - Picure do campo
```

---

## Montando `aCampos` consultando `SX3` (dicionário de campos)

```advpl
SX3->(dbSetOrder(2))

For nI := 1 To Len(aCpos)
    SX3->(dbSeek(aCpos[nI]))
    aAdd(aCampos,{ RTrim(SX3->X3_CAMPO),"",;
                    Iif(nI==1," ",X3Titulo()),;
                    RTrim(SX3->X3_PICTURE)})
Next
```

- `SX3` é geralmente a tabela de metadados/dicionário do Protheus (lista de campos).
    
- `SX3->(dbSetOrder(2))` seleciona índice apropriado para buscar por `X3_CAMPO`.
    
- Loop: para cada nome em `aCpos`:
    
    - `SX3->(dbSeek(aCpos[nI]))` procura metadados daquele campo.
        
    - `aAdd(aCampos, {...})` constrói o registro de definição da coluna:
        
        - `[1]` nome do campo (`X3_CAMPO`),
            
        - `[2]` string vazia (campo obsoleto),
            
        - `[3]` título da coluna: se for o primeiro campo (`nI==1`) usa `" "` (espaço) — provavelmente para esconder header do campo marcado; caso contrário usa `X3Titulo()` (função que retorna título amigável),
            
        - `[4]` `X3_PICTURE` formatação do campo (ex: picture para números, datas).
            
- Resultado: `aCampos` pronto para passar ao `MarkBrow()`.
    

---

## Montando filtros DBF e SQL

```advpl
cFiltro := "Dtos(F1_EMISSAO) >= '"+Dtos(mv_par01)+"' .And. "
cFiltro += "Dtos(F1_EMISSAO) <= '"+Dtos(mv_par02)+"' .And. "
cFiltro += "F1_FORNECE >= '"+mv_par03+"' .And. "
cFiltro += "F1_FORNECE <= '"+mv_par04+"' "
If mv_par05 == 2
    cFiltro += ".And. Empty(F1_REMITO)"
Endif

cQuery := "F1_EMISSAO >= '"+Dtos(mv_par01)+"' AND "
cQuery += "F1_EMISSA0 <= '"+Dtos(mv_par02)+"' AND "
cQuery += "F1_FORNECE >= '"+mv_par03+"' AND "
cQuery += "F1_FORNECE <= '"+mv_par04+"' "
If mv_par05 == 2
    cQuery += "AND F1_REMITO = ' ' "
Endif
```

- `cFiltro` monta expressão no estilo DBF/Harbour (com `.And.` e `Dtos()`).
    
- `Dtos()` transforma data para string no formato usado pela base DBF.
    
- `cQuery` monta a mesma lógica para base SQL (MSSQL), usando `AND`.
    
- **Observação importante**: em `cQuery` há `F1_EMISSA0` (com o último caractere `0`/zero) — isso parece **um erro de digitação**; deveria ser `F1_EMISSAO`. Isso pode causar falha em ambientes SQL. Recomendo checar e corrigir para `F1_EMISSAO`.
    

---

## Preparando e aplicando filtro via codeblock

```advpl
bFiltraBrw := {|x| Iif(x==NIL,FilBrowse("SF1",@aIndex,@cFiltro),{cFiltro,cQuery,"","",aIndex}) }
Eval(bFiltraBrw)
SF1->(MsSeek(xFilial()))
```

- `bFiltraBrw` recebe uma **code block** (closure) que, quando executada:
    
    - se `x==NIL` => chama `FilBrowse("SF1", @aIndex, @cFiltro)` — função que prepara o filtro/índices para o alias `SF1` (cria índices temporários em `aIndex` e aplica filtro `cFiltro` para DBF); o retorno de `FilBrowse` pode configurar o ambiente.
        
    - senão => retorna um array `{cFiltro,cQuery,"","",aIndex}` (possivelmente para uso em ambiente SQL ou para devolver parâmetros para o MarkBrowse).
        
- `Eval(bFiltraBrw)` executa a codeblock sem parâmetros, portanto cai no lado `x==NIL` e efetivamente chama `FilBrowse`, aplicando o filtro.
    
- `SF1->(MsSeek(xFilial()))` — posiciona o cursor de `SF1` para a filial atual (função `xFilial()`).
    

---

## Exibindo o MarkBrowse

```advpl
If !SF1->(EOF()) .And. !SF1->(BOF())
    MarkBrow("SF1","F1_OK","SF1->F1_REMITO",aCampos,(mv_par06==1),GetMark(,"SF1","F1_OK"))
Else
    MsgInfo("Não há dados para apresentar nas tabela de documentos fiscais de entrada. Verifique os parâmetros.")
Endif
```

- Verifica se `SF1` não está vazia (`!EOF() .And. !BOF()`).
    
- `MarkBrow(...)` é a chamada que abre o **MarkBrowse** (browse com marcação de linhas). Parâmetros (conforme o uso comum):
    
    1. `"SF1"` — alias da tabela a visualizar.
        
    2. `"F1_OK"` — nome do campo que será usado internamente para marcar/desmarcar (campo lógico/flag).
        
    3. `"SF1->F1_REMITO"` — campo de referência/indicador já existente (por exemplo, campo que indica se já foi processado).
        
    4. `aCampos` — array com colunas (construído antes).
        
    5. `(mv_par06==1)` — booleano: se verdadeiro indica trazer marcados inicial ou opção.
        
    6. `GetMark(,"SF1","F1_OK")` — provável array com marcações pré-existentes (recupera marcação salva). Note o primeiro parâmetro vazio: pode ser aceitável na API, mas vale checar documentação se necessário.
        
- Se não há registros, mostra `MsgInfo()` com aviso.
    

> Observação: consultando a documentação do seu ambiente você confirma a ordem exata e possíveis parâmetros opcionais de `MarkBrow` e `GetMark`.

---

## Limpeza de índice e filtro temporário

```advpl

	dbSelectArea("SX2")

        If Len(aIndex) > 0

            RetIndex("SX2")

        Endif

  

        dbClearFilter()

  

        If Len(aIndex) > 0

            AEval(aIndex,{|x| Ferase(x[1]+OrdBagExt())})

        Endif
```

Desfaz o indice e filtro (apenas se houver indices criados)
    

---

# User Function `MrkBrwPesq()`

```advpl
User Function MrkBrwPesq()
    AxPesqui()
    Eval(bFiltraBrw)
Return(.T.)
```

- `AxPesqui()` provavelmente abre diálogo para o usuário alterar parâmetros de pesquisa (mv_par01..mv_par06).
    
- `Eval(bFiltraBrw)` re-executa a code block que aplica o filtro (chamando `FilBrowse()` novamente).
    
- `Return(.T.)` indica sucesso (usado como handler de botão).
    

---

# User Function `MrkBrwProc()` — processa os registros marcados

```advpl
User Function MrkBrwProc()
    Local cReg := ""
    
    If !MsgYesNo("Confirma o processamento do registros marcados?")
        Return
    Endif
    
    SF1->(dbGoTop())
    While !SF1->(EOF())
        If IsMark("F1_OK",ThisMark(),ThisInv())
            cReg += SF1->( F1_SERIE+" "+F1_DOC+" "+F1_FORNECE+" "+F1_LOJA )+Chr(13)+Chr(10)
            SF1->(RecLock("SF1",.F.))
            SF1->F1_REMITO := "S"
            SF1->(MsUnLock())
        Endif
        SF1->(dbSkip())
    End
    
    MsgInfo("Os registros processados foram: "+Chr(13)+Chr(10)+cReg)
    
Return
```

Detalhes:

- `Local cReg := ""` — string acumuladora para listar os registros processados.
    
- `MsgYesNo(...)` — confirma ação com o usuário.
    
- `SF1->(dbGoTop())` e `While !SF1->(EOF())` — itera todos os registros.
    
- `IsMark("F1_OK",ThisMark(),ThisInv())` — verifica se a linha atual está marcada no MarkBrowse (usa valores/contexto fornecido pela tela: `ThisMark()` e `ThisInv()` são funções/globals que retornam o estado atual do item).
    
- Se marcada:
    
    - `cReg += ...` — concatena identificação legível do registro (série, doc, fornecedor, loja) para relatório final.
        
    - `SF1->(RecLock("SF1",.F.))` — trava o registro para edição (prevenindo concorrência).
        
    - `SF1->F1_REMITO := "S"` — grava marcação de “processado” (campo `F1_REMITO` recebe `"S"`).
        
    - `SF1->(MsUnLock())` — libera lock.
        
- `SF1->(dbSkip())` avança para o próximo registro.
    
- Ao final, `MsgInfo()` exibe quais registros foram processados.
    

> Observação: esse processamento grava diretamente no arquivo—certifique-se de regras de transação/backups se rodar em produção.

---

# User Function `MrkBrwLeg()` — exibe legenda do MarkBrowse

```advpl
User Function MrkBrwLeg()
    Local aCor := {}
        
    aAdd(aCor,{"BR_VERDE"   ,"Não Processado"})
    aAdd(aCor,{"BR_VERMELHO","Processado"    })

    BrwLegenda(cCadastro,"Status dos documentos",aCor)    

Return
```

- Cria `aCor` com pares `{cor, descricao}`:
    
    - `"BR_VERDE"` => `"Não Processado"`
        
    - `"BR_VERMELHO"` => `"Processado"`
        
- `BrwLegenda(cCadastro,"Status dos documentos",aCor)` — chama helper que mostra a janela de legenda para o usuário, usando `cCadastro` (titulo do cadastro definido em `MarkLeg()`) e subtítulo `"Status dos documentos"`.
    
- `Return` finaliza.
