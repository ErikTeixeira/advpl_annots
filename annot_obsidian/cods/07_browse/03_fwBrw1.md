## 3 - Exercício
```prw
#INCLUDE "PROTHEUS.CH"

#INCLUDE "FWBROWSE.CH"


/*/{Protheus.doc} U_FWBrw1
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao do FWBrowse
                colunas baseado no dicionário de dados
    @see        https://tdn.totvs.com/display/public/PROT/FwBrowse
/*/

  

User Function FWBrw1()

    Local oBrowse
    Local oColumn
    Local oDlg

    //---------------------------------------------------// Abertura da tabela//-------------------------------------------------------------------

    DbSelectArea("SX2")

    DbSetOrder(1)

    //--------------------------------------------------------// Define a janela do Browse//-------------------------------------------------------

    DEFINE DIALOG oDlg FROM 0,0 TO 600,800 PIXEL

    //------------------------------------------------------- // Define o Browse //----------------------------------------------------------------

    DEFINE FWBROWSE oBrowse DATA TABLE ALIAS "SX2" OF oDlg

    //-------------------------------------------------------- // Cria uma coluna de marca/desmarca//----------------------------------------------

    ADD MARKCOLUMN oColumn DATA { || If(.T./* Funcao com a regra*/,'LBOK','LBNO') };

    DOUBLECLICK { |oBrowse| MsgAlert("/*Funcao que atualiza a regra*/") };

    HEADERCLICK { |oBrowse| MsgAlert("/*Funcao executada no clique do header */") } OF oBrowse

  

    //aBrowse[oBrowse:nAt,01],oOK,oNO)

    //---------------------------------------------------- // Cria uma coluna de status //--------------------------------------------------------

    ADD STATUSCOLUMN oColumn DATA { || If(.T./* Funcao com a regra */,'BR_VERDE','BR_VERMELHO') };

    DOUBLECLICK { |oBrowse| Msg("/*Funcao executada no duplo clique na coluna*/")} OF oBrowse

    //--------------------------------------------------- // Adiciona legenda no Browse //--------------------------------------------------------

    ADD LEGEND DATA 'X2_CHAVE $ "AA1|AA2"'      COLOR "GREEN"   TITLE "Chave teste 1" OF oBrowse

    ADD LEGEND DATA '!(X2_CHAVE $ "AA1|AA2")'   COLOR "RED"     TITLE "Chave teste 2" OF oBrowse

    //------------------------------------------------------------- // Adiciona as colunas do Browse //------------------------------------------

    ADD COLUMN oColumn DATA { || X2_CHAVE   } TITLE "Chave" SIZE 3 OF oBrowse

    ADD COLUMN oColumn DATA { || X2_ARQUIVO } TITLE "Arquivo" SIZE 10 OF oBrowse

    ADD COLUMN oColumn DATA { || X2_NOME    } TITLE DecodeUTF8("Descricao") SIZE 40 OF oBrowse

    ADD COLUMN oColumn DATA { || X2_MODO    } TITLE "Modo" SIZE 1 OF oBrowse

    //--------------------------------------------------- // Ativacao do Browse//----------------------------------------------------------------

    ACTIVATE FWBROWSE oBrowse

    //-------------------------------------------------// Ativacao do janela//-------------------------------------------------------------------

    ACTIVATE DIALOG oDlg CENTERED

Return
```
 **FWBrowse** (do Framework TOTVS) para criar uma janela com um browse totalmente configurado. Vou explicar **linha por linha** com detalhes:

---

```advpl
#INCLUDE "PROTHEUS.CH"
#INCLUDE "FWBROWSE.CH"
```

- Inclui os **arquivos de cabeçalho** necessários:
    
    - `PROTHEUS.CH` → funções e constantes padrão do Protheus.
        
    - `FWBROWSE.CH` → definições e classes do **FWBrowse**.
        

---

```advpl
/*/{Protheus.doc} U_FWBrw1
    @type		Function
    @author		Milton J.dos Santos
    @since		01/03/2020
    @version	1.0.0
    @param		Nenhum
    @return		Vazio (nil)
    @example    Exemplo da utilizacao do FWBrowse
				colunas baseado no dicionário de dados
    @see		https://tdn.totvs.com/display/public/PROT/FwBrowse
/*/
```

- **Bloco de documentação** padrão TOTVS DOC.
    
- Serve para gerar docs automáticas e dar clareza ao código.
    

---

```advpl
User Function FWBrw1()
 
    Local oBrowse
    Local oColumn
    Local oDlg
```

- Declara a função `U_FWBrw1()`, que será executada pelo usuário no SmartClient.
    
- Cria variáveis locais para:
    
    - `oBrowse` → objeto principal do FWBrowse.
        
    - `oColumn` → usado para configurar colunas.
        
    - `oDlg` → janela (dialog) que conterá o browse.
        

---

### 1️⃣ Abertura da tabela

```advpl
    DbSelectArea("SX2")
    DbSetOrder(1)
```

- Seleciona a área de trabalho `SX2` (tabela de dicionário de dados do Protheus).
    
- Define o índice `1` para navegação.
    

---

### 2️⃣ Define a janela (Dialog)

```advpl
    DEFINE DIALOG oDlg FROM 0,0 TO 600,800 PIXEL
```

- Cria uma janela (`Dialog`) que vai conter o browse.
    
- Dimensão: do pixel `(0,0)` até `(600,800)`.
    

---

### 3️⃣ Define o FWBrowse

```advpl
    DEFINE FWBROWSE oBrowse DATA TABLE ALIAS "SX2" OF oDlg
```

- Cria o objeto **FWBrowse** ligado à tabela `SX2`.
    
- O browse será exibido dentro da janela `oDlg`.
    

---

### 4️⃣ Coluna de marca/desmarca

```advpl
    ADD MARKCOLUMN oColumn DATA { || If(.T./* Funcao com a regra*/,'LBOK','LBNO') };
    DOUBLECLICK { |oBrowse| MsgAlert("/*Funcao que atualiza a regra*/") };
    HEADERCLICK { |oBrowse| MsgAlert("/*Funcao executada no clique do header */") } OF oBrowse
```

- `ADD MARKCOLUMN` → cria uma coluna com ícone de marcação (LBOK = marcado, LBNO = desmarcado).
    
- O conteúdo é definido por um bloco de código (`If(.T., 'LBOK','LBNO')`).
    
- `DOUBLECLICK` → ação quando o usuário der **duplo clique** na célula (aqui mostra `MsgAlert`).
    
- `HEADERCLICK` → ação ao clicar no **título da coluna**.
    

---

### 5️⃣ Coluna de status

```advpl
    ADD STATUSCOLUMN oColumn DATA { || If(.T./* Funcao com a regra */,'BR_VERDE','BR_VERMELHO') };
    DOUBLECLICK { |oBrowse| Msg("/*Funcao executada no duplo clique na coluna*/")} OF oBrowse
```

- `ADD STATUSCOLUMN` → cria uma coluna de status, exibindo cor (verde/vermelho).
    
- O valor é definido dinamicamente (aqui sempre `BR_VERDE`).
    
- `DOUBLECLICK` → exibe mensagem ao dar duplo clique.
    

---

### 6️⃣ Legendas

```advpl
    ADD LEGEND DATA 'X2_CHAVE $ "AA1|AA2"'      COLOR "GREEN"   TITLE "Chave teste 1" OF oBrowse
    ADD LEGEND DATA '!(X2_CHAVE $ "AA1|AA2")'   COLOR "RED"     TITLE "Chave teste 2" OF oBrowse
```

- Define **legendas visuais** para o browse:
    
    - Se `X2_CHAVE` contém `"AA1"` ou `"AA2"` → verde, título "Chave teste 1".
        
    - Caso contrário → vermelho, título "Chave teste 2".
        

---

### 7️⃣ Colunas do Browse

```advpl
    ADD COLUMN oColumn DATA { || X2_CHAVE   } TITLE "Chave" SIZE 3 OF oBrowse
    ADD COLUMN oColumn DATA { || X2_ARQUIVO } TITLE "Arquivo" SIZE 10 OF oBrowse
    ADD COLUMN oColumn DATA { || X2_NOME    } TITLE DecodeUTF8("Descricao") SIZE 40 OF oBrowse
    ADD COLUMN oColumn DATA { || X2_MODO    } TITLE "Modo" SIZE 1 OF oBrowse
```

- Adiciona as **colunas normais** do browse.
    
- Cada coluna:
    
    - `DATA` → função que retorna o campo da tabela.
        
    - `TITLE` → nome exibido no cabeçalho.
        
    - `SIZE` → largura da coluna.
        

---

### 8️⃣ Ativações

```advpl
    ACTIVATE FWBROWSE oBrowse
```

- Inicializa o browse para que possa ser exibido.
    

```advpl
    ACTIVATE DIALOG oDlg CENTERED
```

- Exibe a janela (`oDlg`) no centro da tela, contendo o browse configurado.
    

---

```advpl
Return "",
```

- Finaliza a função.
    
- Retorna string vazia (mas poderia ser `Nil` também).
    

---

## ✅ Resumão do que acontece quando roda `U_FWBrw1()`

1. Abre uma janela (600x800 px).
    
2. Dentro dela, aparece um **browse da tabela SX2**.
    
3. O browse tem:
    
    - Coluna de marca/desmarca (com clique e duplo clique).
        
    - Coluna de status (verde/vermelho).
        
    - Legendas (verde ou vermelho dependendo da chave).
        
    - Colunas "Chave", "Arquivo", "Descrição" e "Modo".
        
4. O usuário pode interagir clicando nas colunas, headers e registros.
    

---

👉 Na prática, você vai ver uma **tabela colorida (SX2)** no SmartClient, com ícones de marcação, status coloridos, legenda explicativa e colunas baseadas no dicionário de dados.

---

