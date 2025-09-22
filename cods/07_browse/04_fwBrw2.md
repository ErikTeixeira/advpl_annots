## 4 - Exercício
```prw
#INCLUDE "PROTHEUS.CH"
#INCLUDE "FWBROWSE.CH"


/*/{Protheus.doc} U_FWBrw2
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao do FWMBrowse, cria um objeto do tipo grid, botÃµes laterais e detalhes das

                colunas baseado no dicionÃ¡rio de dados

    @see        https://tdn.totvs.com/pages/releaseview.action?pageId=62390842
/*/

  

User Function FWBrw2()

	Local oBrowse
	Local oColumn
	Local oDlg
	
	// Abertura da tabela
	
	DbSelectArea("SX2")
	
	DbSetOrder(1)
	
	//Define a janela do Browse
	
	oDlg = TDialog():New(0, 0, 600, 800,,,,,,,,,,.T.)
	
	// Define o Browse
	
	oBrowse := FWBrowse():New(oDlg)
	
	oBrowse:SetDataTable(.T.)
	
	oBrowse:SetAlias("SX2")
	
	// Cria uma coluna de marca/desmarca
	
	oColumn := oBrowse:AddMarkColumns({||If(.T./*Funcao de Marca/desmaca*/,'LBOK','LBNO')},{|oBrowse|/*Funcao de DOUBLECLICK*/},{|oBrowse|/* Funcao de HEADERCLICK*/})
	
	// Cria uma coluna de status
	
	oColumn := oBrowse:AddStatusColumns({||If(.T./*Funcao de avaliacao de status*/,'BR_VERDE','BR_VERMELHO')},{|oBrowse|/*FunÃ§Ã£o de DOUBLECLICK*/})
	
	// Adiciona legenda no Browse
	
	oBrowse:AddLegend('X2_CHAVE $ "AA1|AA2"'    ,"GREEN","Chave teste 1")
	
	oBrowse:AddLegend('!(X2_CHAVE $ "AA1|AA2")' ,"RED"  ,"Chave teste 2")
	
	// Adiciona as colunas do Browse
	
	oColumn := FWBrwColumn():New()
	
	oColumn:SetData({||X2_CHAVE})
	
	oColumn:SetTitle("Chave")
	
	oColumn:SetSize(3)
	
	oBrowse:SetColumns({oColumn})
	
	oColumn := FWBrwColumn():New()
	
	oColumn:SetData({||X2_ARQUIVO})
	
	oColumn:SetTitle("Arquivo")
	
	oColumn:SetSize(10)
	
	oBrowse:SetColumns({oColumn})
	
	oColumn := FWBrwColumn():New()
	
	oColumn:SetData({||X2_NOME})
	
	oColumn:SetTitle(DecodeUTF8("Descricao"))
	
	oColumn:SetSize(40)
	
	oBrowse:SetColumns({oColumn})
	
	oColumn := FWBrwColumn():New()
	
	oColumn:SetData({||X2_MODO})
	
	oColumn:SetTitle("Modo")
	
	oColumn:SetSize(1)
	
	oBrowse:SetColumns({oColumn})
	
	// AtivaÃ§Ã£o do Browse
	
	oBrowse:Activate()
	
	// AtivaÃ§Ã£o da janela
	
	oDlg:Activate(,,,.T.)

Return
```

 **FWMBrowse** (mais moderno e flexível) em vez do `FWBrowse`. Vou detalhar linha por linha:

---

### **Cabeçalho**

```advpl
#INCLUDE "PROTHEUS.CH"
#INCLUDE "FWBROWSE.CH"
```

- Inclui as bibliotecas principais do **Protheus** e dos componentes visuais de **Browse** (grid interativo).
    

---

### **DocBlock**

```advpl
/*/{Protheus.doc} U_FWBrw2
    ...
*/
```

- É a documentação da função, usada pelo **Doc Generator** do Protheus.
    
- Indica que é uma função do usuário (`User Function`), com autor, versão, exemplo e link de referência.
    

---

### **Função**

```advpl
User Function FWBrw2()
```

- Define a **função de usuário** que pode ser chamada via `U_FWBrw2` no **SmartClient**.
    

---

### **Declaração de variáveis**

```advpl
Local oBrowse
Local oColumn
Local oDlg
```

- `oBrowse` → objeto do grid (**FWMBrowse**).
    
- `oColumn` → referência às colunas do grid.
    
- `oDlg` → objeto da janela (dialog) onde o grid será exibido.
    

---

### **Abrindo a tabela**

```advpl
DbSelectArea("SX2")
DbSetOrder(1)
```

- Seleciona a tabela **SX2** (Dicionário de Dados – campos).
    
- Define a ordem **1** (provavelmente por índice `X2_CHAVE`).
    

---

### **Criando a janela**

```advpl
oDlg = TDialog():New(0, 0, 600, 800,,,,,,,,,,.T.)
```

- Cria uma **janela (dialog)** de tamanho `600 x 800 pixels`.
    
- O último `.T.` indica que a janela é **modal** (bloqueia a tela anterior até ser fechada).
    

---

### **Criando o Browse**

```advpl
oBrowse := FWBrowse():New(oDlg)
oBrowse:SetDataTable(.T.)
oBrowse:SetAlias("SX2")
```

- Cria um objeto **FWBrowse** dentro da janela `oDlg`.
    
- `SetDataTable(.T.)` → indica que ele vai trabalhar com **dados de tabela**.
    
- `SetAlias("SX2")` → vincula o browse à tabela **SX2** aberta antes.
    

---

### **Coluna de marca/desmarca**

```advpl
oColumn := oBrowse:AddMarkColumns(
   {||If(.T./*Funcao de Marca/desmaca*/,'LBOK','LBNO')},
   {|oBrowse|/*Funcao de DOUBLECLICK*/},
   {|oBrowse|/*Funcao de HEADERCLICK*/}
)
```

- Cria uma coluna com **ícone de marcação** (check/uncheck).
    
- Primeiro bloco `{||If(.T.,'LBOK','LBNO')}` → define se exibe `LBOK` ou `LBNO`.
    
- Segundo → ação ao **duplo clique**.
    
- Terceiro → ação ao **clique no cabeçalho**.
    

---

### **Coluna de status**

```advpl
oColumn := oBrowse:AddStatusColumns(
   {||If(.T./*Funcao de avaliacao de status*/,'BR_VERDE','BR_VERMELHO')},
   {|oBrowse|/*Função de DOUBLECLICK*/}
)
```

- Adiciona coluna com **status visual** (verde/vermelho).
    
- Aqui sempre retorna verde (`.T.`).
    
- Poderia ter uma regra, exemplo: “se campo ativo → verde, senão vermelho”.
    

---

### **Legendas**

```advpl
oBrowse:AddLegend('X2_CHAVE $ "AA1|AA2"'    ,"GREEN","Chave teste 1")
oBrowse:AddLegend('!(X2_CHAVE $ "AA1|AA2")' ,"RED"  ,"Chave teste 2")
```

- Cria **legendas coloridas** no grid.
    
- Verde quando `X2_CHAVE` está em `AA1` ou `AA2`.
    
- Vermelho caso contrário.
    

---

### **Colunas do Browse**

```advpl
oColumn := FWBrwColumn():New()
oColumn:SetData({||X2_CHAVE})
oColumn:SetTitle("Chave")
oColumn:SetSize(3)
oBrowse:SetColumns({oColumn})
```

- Cria **coluna manualmente** para exibir o campo `X2_CHAVE`.
    
- Define título e tamanho (3 caracteres).
    
- Depois adiciona ao browse.
    

➡️ O mesmo processo é repetido para:

- `X2_ARQUIVO` (Arquivo, tamanho 10)
    
- `X2_NOME` (Descrição, tamanho 40)
    
- `X2_MODO` (Modo, tamanho 1)
    

---

### **Ativação**

```advpl
oBrowse:Activate()
oDlg:Activate(,,,.T.)
```

- `oBrowse:Activate()` → inicia o **grid**.
    
- `oDlg:Activate()` → abre a **janela modal** com o browse.
    

---

### **Retorno**

```advpl
Return ""
```

- Retorna vazio.
    

---

✅ **O que aparece quando rodar (`U_FWBrw2`)**:

- Uma **janela modal** (`600x800 px`).
    
- Dentro dela, um **grid (browse)** mostrando os registros da tabela `SX2`.
    
- Com:
    
    - Coluna de marcação (ícones).
        
    - Coluna de status (verde/vermelho).
        
    - Legendas (verde e vermelho).
        
    - Colunas com dados reais do `SX2`: **Chave, Arquivo, Descrição, Modo**.
        

---

👉 Resumindo: esse código cria uma **tela de grid interativo** mais avançada que a do `FWBrw1`, com ícones, status, legenda e colunas configuradas manualmente.

---

