## 1 - Exercício
```prw
#include "protheus.ch"

  

User Function MBrwSA1()

    Local cAlias    := "SA1"

    Local aCores    := {}

    Local cFiltra   := "A1_FILIAL == '"+xFilial('SA1')+"' .And. A1_EST == 'SP'"

  

    Private cCadastro   := "Cadastro de Clientes"

    Private aRotina     := {}  // opçoes de filtro utilizando a FilBrowse

    Private aIndexSA1   := {}

    Private bFiltraBrw  := { || FilBrowse(cAlias,@aIndexSA1,@cFiltra) }

  

    // Quando a função FilBrowse for utilizada a função de pesquisa deverão ser a PesqBrw ao inves da AxPesqui

  

    AADD(aRotina,{"Pesquisar" ,"PesqBrw" ,0,1})

    AADD(aRotina,{"Visualizar" ,"AxVisual",0,2})

    AADD(aRotina,{"Incluir" ,"AxInclui",0,3})

    AADD(aRotina,{"Alterar" ,"AxAltera",0,4})

    AADD(aRotina,{"Excluir" ,"U_Exclui",0,5})

    AADD(aRotina,{"Legenda" ,"U_BLegenda" ,0,3})

  

    // inclui as configurações da legenda

    AADD(aCores,{"A1_TIPO == 'F'" ,"BR_VERDE"   })

    AADD(aCores,{"A1_TIPO == 'L'" ,"BR_AMARELO" })

    AADD(aCores,{"A1_TIPO == 'R'" ,"BR_LARANJA" })

    AADD(aCores,{"A1_TIPO == 'S'" ,"BR_MARRON"  })

    AADD(aCores,{"A1_TIPO == 'X'" ,"BR_AZUL"    })

  

    dbSelectArea(cAlias)

    dbSetOrder(1)

  

    // Cria o filtro na MBrowse utilizando a função FilBrowse

    Eval(bFiltraBrw)

    dbSelectArea(cAlias)

    dbGoTop()

    mBrowse(6,1,22,75,cAlias, , , , , , aCores)

  

    // Deleta o filtro utilizado na função FilBrowse

    EndFilBrw(cAlias,aIndexSA1)

  

Return Nil

  

// Exemplo: Determinando a opção do aRotina pela informação recebida em nOpc

  

User Function Exclui(cAlias, nReg, nOpc)

    Local nOpcao := 0

    nOpcao := AxDeleta(cAlias,nReg,nOpc)

  

    If nOpcao == 2 //Se confirmou a exclusÃ£o  

        MsgInfo("Exclusão realizada com sucesso!")

    ElseIf nOpcao == 1  

        MsgInfo("Exclusão cancelada!")

    Endif

Return Nil

  

//+-------------------------------------------

//|Função: BLegenda - Rotina de Legenda

//+-------------------------------------------

  

User Function BLegenda()

    Local aLegenda := {}

    AADD(aLegenda,{"BR_VERDE"   ,"Cons.Final"       })

    AADD(aLegenda,{"BR_AMARELO" ,"Produtor Rural"   })

    AADD(aLegenda,{"BR_LARANJA" ,"Revendedor"       })

    AADD(aLegenda,{"BR_MARRON"  ,"Solidario"        })

    AADD(aLegenda,{"BR_AZUL"    ,"ExportaÃ§Ã£o"     })

  

    BrwLegenda(cCadastro, "Legenda", aLegenda)

Return Nil

```

Perfeito! Vamos destrinchar esse código **ADVPL** por partes para entender o que ele faz e como funciona no **SmartClient** ou Protheus. Ele é um exemplo clássico de uso de **MBrowse** com cores, filtros e rotinas.

---

## **1️⃣ Cabeçalho e declaração da função principal**

```advpl
#include "protheus.ch"

User Function MBrwSA1()
```

- `#include "protheus.ch"` → inclui constantes e funções padrão do Protheus (como `MsgInfo`, `mBrowse`, `FilBrowse`, etc.).
    
- `User Function MBrwSA1()` → função principal que será executada pelo usuário.
    

---

## **2️⃣ Declaração de variáveis**

```advpl
Local cAlias	:= "SA1"       // Nome do alias/tabela a ser exibida
Local aCores	:= {}           // Array para cores da legenda
Local cFiltra	:= "A1_FILIAL == '"+xFilial('SA1')+"' .And. A1_EST == 'SP'"  // filtro padrão
```

- `cAlias` → tabela que será usada no MBrowse.
    
- `aCores` → define cores de acordo com condições de campos (para legendas visuais no browse).
    
- `cFiltra` → string que define o **filtro** para exibir apenas clientes da filial atual (`xFilial('SA1')`) e estado SP.
    

---

## **3️⃣ Configuração de cadastro e rotinas**

```advpl
Private cCadastro := "Cadastro de Clientes"
Private aRotina	 := {}       // Rotinas de ação (Pesquisar, Visualizar, etc.)
Private aIndexSA1 := {}       // Índices usados pelo FilBrowse
Private bFiltraBrw := { || FilBrowse(cAlias,@aIndexSA1,@cFiltra) }
```

- `cCadastro` → nome usado na legenda ou título.
    
- `aRotina` → armazena opções de menu para cada registro no browse.
    
- `bFiltraBrw` → código que aplica o filtro via **FilBrowse**.
    

---

### **4️⃣ Adicionando rotinas**

```advpl
AADD(aRotina,{"Pesquisar" ,"PesqBrw" ,0,1})
AADD(aRotina,{"Visualizar" ,"AxVisual",0,2})
AADD(aRotina,{"Incluir" ,"AxInclui",0,3})
AADD(aRotina,{"Alterar" ,"AxAltera",0,4})
AADD(aRotina,{"Excluir" ,"U_Exclui",0,5})
AADD(aRotina,{"Legenda" ,"U_BLegenda" ,0,3})
```

- Cada linha adiciona uma opção ao menu do MBrowse.
    
- Estrutura: `{"Label","Função",Opcao,ID}`
    
- Ex: `"Excluir"` chama a função `U_Exclui` (definida mais abaixo).
    

---

## **5️⃣ Configuração de cores**

```advpl
AADD(aCores,{"A1_TIPO == 'F'" ,"BR_VERDE"	})
AADD(aCores,{"A1_TIPO == 'L'" ,"BR_AMARELO" })
AADD(aCores,{"A1_TIPO == 'R'" ,"BR_LARANJA" })
AADD(aCores,{"A1_TIPO == 'S'" ,"BR_MARRON"	})
AADD(aCores,{"A1_TIPO == 'X'" ,"BR_AZUL"	})
```

- Define cores para cada tipo de cliente (`A1_TIPO`).
    
- Cores serão exibidas no MBrowse.
    

---

## **6️⃣ Preparando o MBrowse**

```advpl
dbSelectArea(cAlias)   // Seleciona a tabela
dbSetOrder(1)          // Define índice

Eval(bFiltraBrw)       // Aplica o filtro definido acima
dbSelectArea(cAlias)
dbGoTop()              // Vai para o primeiro registro

mBrowse(6,1,22,75,cAlias, , , , , , aCores)
```

- `dbSelectArea` → seleciona a tabela.
    
- `dbSetOrder(1)` → define índice padrão.
    
- `Eval(bFiltraBrw)` → aplica filtro antes do MBrowse.
    
- `mBrowse(6,1,22,75,...)` → abre a tela do **browse**:
    
    - `6,1,22,75` → coordenadas da janela
        
    - `cAlias` → tabela
        
    - `aCores` → cores do browse
        

---

## **7️⃣ Limpando o filtro**

```advpl
EndFilBrw(cAlias,aIndexSA1)
```

- Remove o filtro aplicado pela função `FilBrowse`.
    

---

## **8️⃣ Função de exclusão**

```advpl
User Function Exclui(cAlias, nReg, nOpc)
	Local nOpcao := AxDeleta(cAlias,nReg,nOpc)

	If nOpcao == 2 //Se confirmou a exclusão	
		MsgInfo("Exclusão realizada com sucesso!")
	ElseIf nOpcao == 1	
		MsgInfo("Exclusão cancelada!")
	Endif
Return Nil
```

- Executa a exclusão de um registro.
    
- Usa `AxDeleta` para deletar no banco.
    
- Mostra mensagem de sucesso ou cancelamento.
    

---

## **9️⃣ Função de legenda**

```advpl
User Function BLegenda()
	Local aLegenda := {}
	AADD(aLegenda,{"BR_VERDE"	,"Cons.Final"		})
	AADD(aLegenda,{"BR_AMARELO" ,"Produtor Rural"	})
	AADD(aLegenda,{"BR_LARANJA" ,"Revendedor"		})
	AADD(aLegenda,{"BR_MARRON"	,"Solidario"		})
	AADD(aLegenda,{"BR_AZUL"	,"Exportação"		})

	BrwLegenda(cCadastro, "Legenda", aLegenda)

Return Nil
```

- Mostra uma **tabela de legenda** explicando o significado de cada cor no MBrowse.
    

---

## ✅ **Resumo do que o código faz**

1. Configura filtros e cores para um MBrowse de clientes (`SA1`).
    
2. Adiciona rotinas (Pesquisar, Visualizar, Incluir, Alterar, Excluir, Legenda).
    
3. Abre a tela do MBrowse mostrando os clientes da filial SP.
    
4. Permite que o usuário interaja com os registros usando o menu de rotinas.
    
5. Inclui legenda visual de cores.
    

---

## **Como rodar**

- Salve a função em um `.prw`.
    
- Compile (se estiver em ambiente servidor): `build MBrwSA1.prw`.
    
- Execute no **SmartClient**:
    

```advpl
MBrwSA1()
```

- Vai abrir a tela MBrowse com filtros, cores e menu de ações.
    

---

