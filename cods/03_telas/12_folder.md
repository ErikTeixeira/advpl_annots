## 12 - Exercício
```prw
#Include 'TOTVS.CH'

/*/{Protheus.doc} U_Folder
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao de Folders InstantÃ¢neos (Pastas)
    @see        https://tdn.engpro.totvs.com.br/display/tec/@+...+FOLDER
/*/


User Function Folder1()

    Local oDlg    
    Local oFolder
    DEFINE MsDialog oDlg TITLE "Exemplo de FOLDER" FROM 0,0 TO 600,800 PIXEL

    @ 10,15 FOLDER oFolder PROMPTS 'Aba 01','Aba 02' SIZE 260, 200 OF oDlg  PIXEL

    @ 10,10 SAY "Texto na Aba 01" OF oFolder:aDialogs[1] PIXEL

    @ 10,10 SAY "Texto na Aba 02" OF oFolder:aDialogs[2] PIXEL

    ACTIVATE MsDialog oDlg CENTER

Return

  
User Function Folder2()

    Local oDlg    
    Local oFolder

    DEFINE MsDialog oDlg TITLE "Exemplo de ADD FOLDER" FROM 0,0 TO 600,800 PIXEL

    @ 10,15 FOLDER oFolder SIZE 260, 200 OF oDlg  PIXEL

    oFolder:AddItem("Aba 01",.T.)
    oFolder:AddItem("Aba 02",.T.)

    @ 10,10 SAY "Texto na Aba 01" OF oFolder:aDialogs[1] PIXEL

    @ 10,10 SAY "Texto na Aba 02" OF oFolder:aDialogs[2] PIXEL

    oFolder:SetOption(1)

    ACTIVATE MsDialog oDlg CENTER

Return
```


---

### 1. Cabeçalho e documentação

```advpl
#Include 'TOTVS.CH'

/*/{Protheus.doc} U_Folder
    @type		Function
    @author		Milton J.dos Santos
    @since		01/03/2020
    @version	1.0.0
    @param		Nenhum
    @return		Vazio (nil)
    @example    Exemplo da utilizacao de Folders Instantâneos (Pastas)
    @see		https://tdn.engpro.totvs.com.br/display/tec/@+...+FOLDER
/*/
```

- `#Include 'TOTVS.CH'` → inclui definições e comandos gráficos.
    
- O bloco de documentação (`Protheus.doc`) descreve o que a função faz: trabalhar com **Folders (abas)**.
    

---

### 2. Função `Folder1()` → FOLDER instantâneo

```advpl
User Function Folder1()
    Local oDlg     
    Local oFolder
```

- `oDlg` → objeto da janela.
    
- `oFolder` → objeto do Folder (grupo de abas).
    

```advpl
DEFINE MsDialog oDlg TITLE "Exemplo de FOLDER" FROM 0,0 TO 600,800 PIXEL
```

- Cria a janela `oDlg` com título e dimensões.
    

```advpl
@ 10,15 FOLDER oFolder PROMPTS 'Aba 01','Aba 02' SIZE 260, 200 OF oDlg  PIXEL
```

- Cria o Folder `oFolder` dentro da janela `oDlg`.
    
- `PROMPTS` → define as abas de forma direta: `"Aba 01"` e `"Aba 02"`.
    
- `SIZE 260,200` → define o tamanho em pixels.
    

```advpl
@ 10,10 SAY "Texto na Aba 01" OF oFolder:aDialogs[1] PIXEL
@ 10,10 SAY "Texto na Aba 02" OF oFolder:aDialogs[2] PIXEL
```

- Adiciona textos dentro de cada aba:
    
    - `aDialogs[1]` → refere-se à **primeira aba**.
        
    - `aDialogs[2]` → refere-se à **segunda aba**.
        

```advpl
ACTIVATE MsDialog oDlg CENTER 
```

- Exibe a janela no centro da tela.
    

✅ **Resumo Folder1:**  
Cria um Folder com **abas fixas (definidas na criação)**.

---

### 3. Função `Folder2()` → FOLDER dinâmico (usando `AddItem`)

```advpl
User Function Folder2()
    Local oDlg     
    Local oFolder
```

Mesma estrutura inicial.

```advpl
DEFINE MsDialog oDlg TITLE "Exemplo de ADD FOLDER" FROM 0,0 TO 600,800 PIXEL
```

Cria a janela.

```advpl
@ 10,15 FOLDER oFolder SIZE 260, 200 OF oDlg  PIXEL
```

Cria um Folder vazio (sem abas inicialmente).

```advpl
oFolder:AddItem("Aba 01",.T.)
oFolder:AddItem("Aba 02",.T.)
```

- `AddItem()` → adiciona abas dinamicamente.
    
- `"Aba 01"`, `"Aba 02"` → nomes das abas.
    
- `.T.` → habilita a aba.
    

```advpl
@ 10,10 SAY "Texto na Aba 01" OF oFolder:aDialogs[1] PIXEL
@ 10,10 SAY "Texto na Aba 02" OF oFolder:aDialogs[2] PIXEL
```

Coloca texto em cada aba.

```advpl
oFolder:SetOption(1)
```

- Define a **aba selecionada por padrão**.
    
- Aqui, a aba 1 será aberta primeiro.
    

```advpl
ACTIVATE MsDialog oDlg CENTER 
```

Exibe a janela.

✅ **Resumo Folder2:**  
Cria um Folder **dinâmico** → você pode ir adicionando abas depois da criação.

---

### 🔑 Diferença entre `Folder1` e `Folder2`

- **Folder1** → abas já definidas na criação (com `PROMPTS`).
    
- **Folder2** → abas adicionadas depois (com `AddItem`). Isso dá mais flexibilidade para criar abas dinamicamente, dependendo da lógica do programa.
    

---
