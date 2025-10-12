## 10 - Exercício
```prw
#Include "Protheus.ch"          

  

/*/{Protheus.doc} U_MrkBrw1

    @type       Function

    @author     Milton J.dos Santos

    @since      01/03/2020

    @version    1.0.0

    @param      Nenhum

    @return     Vazio (nil)

    @example    Exemplo da utilizacao de MarkBrowse com Refresh

    @see        https://tdn.totvs.com/display/public/framework/MarkBrow

/*/

  

User Function MarkRefr()    

Local _stru     := {}

Local aCpoBro   := {}

Local aCores    := {}

Local oDlg

  

Private lInverte:= .F.

Private cMark   := GetMark()  

Private oMark

  

//Cria um arquivo de Apoio

AADD(_stru,{"OK"     ,"C"   ,2      ,0      })

AADD(_stru,{"COD"    ,"C"   ,6      ,0      })

AADD(_stru,{"LOJA"   ,"C"   ,2      ,0      })

AADD(_stru,{"NOME"   ,"C"   ,40     ,0      })

AADD(_stru,{"MCOMPRA","N"   ,17     ,2      })

AADD(_stru,{"END"    ,"C"   ,40     ,0      })

AADD(_stru,{"STATUS" ,"C"   ,2      ,0      })

  

cArq := Criatrab(_stru,.T.)

  

DBUSEAREA(.t.,,carq,"TTRB")

  

//Alimenta o arquivo de apoio com os registros do cadastro de clientes (SA1)

  

DbSelectArea("SA1")

DbGotop()

While  SA1->(!Eof())

    DbSelectArea("TTRB")

    RecLock("TTRB",.T.)

    TTRB->COD     :=  SA1->A1_COD

    TTRB->LOJA    :=  SA1->A1_LOJA

    TTRB->NOME    :=  SA1->A1_NOME

    TTRB->MCOMPRA :=  SA1->A1_MCOMPRA

    TTRB->END     :=  SA1->A1_END

    TTRB->STATUS  := "0"

    //Verde

    MsunLock()

    SA1->(DbSkip())

Enddo

  

// Define as cores dos itens de legenda.

aCores := {}

aAdd(aCores,{"TTRB->STATUS == '0'","BR_VERDE"   })

aAdd(aCores,{"TTRB->STATUS == '1'","BR_AMARELO" })

aAdd(aCores,{"TTRB->STATUS == '2'","BR_VERMELHO"})

  

//Define quais colunas (campos da TTRB) serao exibidas na MsSelect

aCpoBro := {{ "OK"          ,, "Mark"           ,"@!"},;

            { "COD"         ,, "Codigo"         ,"@!"},;

            { "LOJA"        ,, "Loja"           ,"@1!"},;

            { "NOME"        ,, "Nome"           ,"@X"},;

            { "MCOMPRA"     ,, "Maior Compra"   ,"@E 999,999,999.99"},;

            { "End"         ,, "Endereco"       ,"@!"}}

  

//Cria uma Dialog

  

DEFINE MsDialog oDlg TITLE "MarkBrowse c/Refresh" From 9,0 To 315,800 PIXEL

  

DbSelectArea("TTRB")

DbGotop()

  

//Cria a MsSelect

oMark       := MsSelect():New("TTRB","OK","",aCpoBro,@lInverte,@cMark,{17,1,150,400},,,,,aCores)

oMark:bMark := {| | Disp()}

  

//Exibe a Dialog

ACTIVATE MSDIALOG oDlg CENTERED ON INIT EnchoiceBar(oDlg,{|| oDlg:End()},{|| oDlg:End()})

  

// Fecha a Area e elimina os arquivos de apoio criados em disco.

TTRB->(DbCloseArea())

Iif(File(cArq + GetDBExtension()),FErase(cArq  + GetDBExtension()) ,Nil)

Return

  

//Funcao executada ao Marcar/Desmarcar um registro.  

Static Function Disp()

RecLock("TTRB",.F.)

If Marked("OK")

    TTRB->OK := cMark

Else

    TTRB->OK := ""

Endif

MSUNLOCK()

oMark:oBrowse:Refresh()

  

Return()
```

 **MarkBrowse com Refresh**

---

### **1. Inclusão de arquivos de cabeçalho**

```advpl
#Include "Protheus.ch"
```

- Inclui o arquivo de cabeçalho do Protheus, necessário para usar funções básicas do sistema como `DbUseArea()`, `DbSelectArea()`, `RecLock()`, `DbSkip()`, entre outras.
    

---

### **2. Comentário de documentação**

```advpl
/*/{Protheus.doc} U_MrkBrw1
    @type        Function
    @author      Milton J.dos Santos
    @since       01/03/2020
    @version     1.0.0
    @param       Nenhum
    @return      Vazio (nil)
    @example     Exemplo da utilizacao de MarkBrowse com Refresh
    @see         https://tdn.totvs.com/display/public/framework/MarkBrow
/*/
```

- Documenta a função `MarkRefr()`.
    
- Informa tipo, autor, versão, parâmetros, retorno e referência.
    

---

### **3. Declaração da função principal**

```advpl
User Function MarkRefr()
```

- Define a função `MarkRefr()` que será chamada pelo usuário.
    
- É uma **função pública** (`User Function`) que pode ser utilizada em qualquer lugar do Protheus.
    

---

### **4. Declaração de variáveis**

```advpl
Local _stru      := {}
Local aCpoBro    := {}
Local aCores     := {}
Local oDlg
Private lInverte := .F.
Private cMark    := GetMark()
Private oMark
```

- `_stru`: estrutura do arquivo de apoio que será criado.
    
- `aCpoBro`: array que define os campos do `MarkBrowse`.
    
- `aCores`: array que define cores dos registros.
    
- `oDlg`: objeto da Dialog que será criada.
    
- `lInverte`: variável privada usada para inverter marcação (inicialmente `.F.`).
    
- `cMark`: captura o valor do **mark atual** com `GetMark()`.
    
- `oMark`: objeto que irá controlar o MarkBrowse.
    

---

### **5. Criação da estrutura de apoio**

```advpl
AADD(_stru,{"OK"     ,"C"  ,2   ,0  })
AADD(_stru,{"COD"    ,"C"  ,6   ,0  })
AADD(_stru,{"LOJA"   ,"C"  ,2   ,0  })
AADD(_stru,{"NOME"   ,"C"  ,40  ,0  })
AADD(_stru,{"MCOMPRA","N"  ,17  ,2  })
AADD(_stru,{"END"    ,"C"  ,40  ,0  })
AADD(_stru,{"STATUS" ,"C"  ,2   ,0  })
```

- `AADD()` adiciona campos na estrutura `_stru`.
    
- Cada campo tem: **nome, tipo (`C`=caracter, `N`=numérico), tamanho e casas decimais**.
    
- Campos de apoio:
    
    - `OK`: marcação.
        
    - `COD`: código do cliente.
        
    - `LOJA`: loja.
        
    - `NOME`: nome do cliente.
        
    - `MCOMPRA`: maior compra.
        
    - `END`: endereço.
        
    - `STATUS`: para controlar cores do MarkBrowse.
        

---

### **6. Criação do arquivo de apoio**

```advpl
cArq := Criatrab(_stru,.T.)
DBUSEAREA(.t.,,carq,"TTRB")
```

- `Criatrab()` cria fisicamente o arquivo de apoio.
    
- `DBUSEAREA()` abre o arquivo para manipulação.
    
- `"TTRB"`: alias usado para referenciar este arquivo.
    

---

### **7. Alimentando o arquivo de apoio com registros**

```advpl
DbSelectArea("SA1")
DbGotop()
While SA1->(!Eof())
    DbSelectArea("TTRB")
    RecLock("TTRB",.T.)
    TTRB->COD     :=  SA1->A1_COD
    TTRB->LOJA    :=  SA1->A1_LOJA
    TTRB->NOME    :=  SA1->A1_NOME
    TTRB->MCOMPRA :=  SA1->A1_MCOMPRA
    TTRB->END     :=  SA1->A1_END
    TTRB->STATUS  := "0"
    //Verde
    MsunLock()
    SA1->(DbSkip())
Enddo
```

- Alterna para a área `SA1` (clientes) e posiciona no primeiro registro.
    
- Laço `While` percorre todos os clientes.
    
- Para cada cliente:
    
    - Seleciona o arquivo de apoio `TTRB`.
        
    - Bloqueia o registro (`RecLock`) para edição.
        
    - Copia campos de `SA1` para `TTRB`.
        
    - Inicializa `STATUS` com `"0"` (cor verde).
        
    - Desbloqueia registro (`MsunLock()`).
        
    - Avança para o próximo registro (`DbSkip()`).
        

---

### **8. Definição das cores do MarkBrowse**

```advpl
aCores := {}
aAdd(aCores,{"TTRB->STATUS == '0'","BR_VERDE"})
aAdd(aCores,{"TTRB->STATUS == '1'","BR_AMARELO"})
aAdd(aCores,{"TTRB->STATUS == '2'","BR_VERMELHO"})
```

- Define cores dos registros no MarkBrowse de acordo com o campo `STATUS`.
    

---

### **9. Definição das colunas do MarkBrowse**

```advpl
aCpoBro := {{ "OK"      ,, "Mark"         ,"@!"},;
            { "COD"     ,, "Codigo"       ,"@!"},;
            { "LOJA"    ,, "Loja"         ,"@1!"},;
            { "NOME"    ,, "Nome"         ,"@X"},;
            { "MCOMPRA" ,, "Maior Compra" ,"@E 999,999,999.99"},;
            { "End"     ,, "Endereco"     ,"@!"}}
```

- Define colunas que aparecerão na `MsSelect`.
    
- Cada coluna tem: **campo, cabeçalho, máscara de exibição**.
    

---

### **10. Criação da Dialog**

```advpl
DEFINE MsDialog oDlg TITLE "MarkBrowse c/Refresh" From 9,0 To 315,800 PIXEL
```

- Cria um objeto Dialog para exibir o MarkBrowse.
    
- Define título e tamanho em pixels.
    

---

### **11. Preparando a MsSelect**

```advpl
DbSelectArea("TTRB")
DbGotop()
oMark := MsSelect():New("TTRB","OK","",aCpoBro,@lInverte,@cMark,{17,1,150,400},,,,,aCores)
oMark:bMark := {| | Disp()}
```

- Seleciona o arquivo de apoio `TTRB`.
    
- Cria o MarkBrowse (`MsSelect`) com:
    
    - `"TTRB"`: tabela de dados.
        
    - `"OK"`: campo de marcação.
        
    - `aCpoBro`: campos exibidos.
        
    - `aCores`: cores.
        
- Associa a função `Disp()` para executar quando um registro for marcado/desmarcado.
    

---

### **12. Exibindo a Dialog**

```advpl
ACTIVATE MSDIALOG oDlg CENTERED ON INIT EnchoiceBar(oDlg,{|| oDlg:End()},{|| oDlg:End()})
```

- Mostra a Dialog centralizada.
    
- `EnchoiceBar()` adiciona botões de controle que encerram a Dialog.
    

---

### **13. Limpeza**

```advpl
TTRB->(DbCloseArea())
Iif(File(cArq + GetDBExtension()),FErase(cArq  + GetDBExtension()) ,Nil)
Return
```

- Fecha a área `TTRB`.
    
- Apaga o arquivo de apoio criado em disco.
    
- Retorna `nil` (vazio).
    

---

### **14. Função estática para marcar/desmarcar**

```advpl
Static Function Disp()
RecLock("TTRB",.F.)
If Marked("OK")
    TTRB->OK := cMark
Else
    TTRB->OK := ""
Endif
MSUNLOCK()
oMark:oBrowse:Refresh()
Return()
```

- `Disp()` é chamada ao marcar/desmarcar um registro.
    
- Bloqueia o registro atual (`RecLock`).
    
- Verifica se está marcado:
    
    - Se marcado, atribui o valor de `cMark`.
        
    - Se desmarcado, limpa (`""`).
        
- Desbloqueia (`MsUnlock`) e **atualiza a tela do MarkBrowse** (`oMark:oBrowse:Refresh()`).
    

---

💡 **Resumo do funcionamento geral:**

1. Cria um arquivo de apoio (`TTRB`) com dados do cadastro de clientes (`SA1`).
    
2. Define cores e campos para exibição no MarkBrowse.
    
3. Cria uma Dialog e exibe o MarkBrowse com marcação (`OK`) e cores.
    
4. Permite marcar/desmarcar registros e atualiza a tela em tempo real.
    
5. Ao fechar, limpa tudo do disco.
    

---



