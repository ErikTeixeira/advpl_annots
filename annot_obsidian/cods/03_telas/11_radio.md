## 11 - Exercício
```prw
#Include 'TOTVS.CH'

/*/{Protheus.doc} U_Radio
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao do comando Radio (janela/formulario)
    @see        (https://tdn.totvs.com/pages/)
/*/


User Function Radio

    Local oDlg, oRadio
    Local nRadio    := 1

    DEFINE MsDialog oDlg TITLE "Exemplo de Radio" FROM 0,0 TO 400,600 PIXEL


    @ 08,10 RADIO oRadio VAR nRadio ITEMS 'Item x', 'Item 2','Item 3', 'Item 4'  OF oDlg ON CHANGE { || Alert( 'Mudando de Opcao' ) } SIZE 110,10 PIXEL

    ACTIVATE MsDialog oDlg CENTER

RETURN
```


---

```advpl
#Include 'TOTVS.CH'
```

- Inclui o arquivo de cabeçalho da TOTVS, que contém definições e macros necessárias para comandos gráficos como `RADIO`, `CHECKBOX`, `BUTTON`, etc.
    

---

```advpl
/*/{Protheus.doc} U_Radio
    @type		Function
    @author		Milton J.dos Santos
    @since		01/03/2020
    @version	1.0.0
    @param		Nenhum
    @return		Vazio (nil)
    @example    Exemplo da utilizacao do comando Radio (janela/formulario)
    @see		(https://tdn.totvs.com/pages/)
```

- Documentação da função no padrão **Protheus.doc**.
    
- Indica que é um exemplo de uso do comando **Radio**.
    

---

```advpl
User Function Radio
```

- Declara a função `Radio()`, que será chamada pelo usuário no ambiente Protheus (via SIGAMDI, por exemplo).
    

---

```advpl
Local oDlg, oRadio
Local nRadio := 1
```

- `oDlg` → objeto da janela.
    
- `oRadio` → objeto do grupo de botões de opção.
    
- `nRadio := 1` → variável que controla a **opção selecionada** (por padrão começa na primeira opção).
    

---

```advpl
DEFINE MsDialog oDlg TITLE "Exemplo de Radio" FROM 0,0 TO 400,600 PIXEL 
```

- Cria a janela **MsDialog** chamada `oDlg`.
    
- Título: `"Exemplo de Radio"`.
    
- Tamanho: da posição `(0,0)` até `(400,600)` em pixels.
    

---

```advpl
@ 08,10 RADIO oRadio VAR nRadio ITEMS 'Item x', 'Item 2','Item 3', 'Item 4'  OF oDlg ON CHANGE { || Alert( 'Mudando de Opcao' ) } SIZE 110,10 PIXEL
```

Aqui acontece a mágica 👇

- `@ 08,10` → posição do componente dentro da janela.
    
- `RADIO oRadio` → cria um grupo de botões de opção chamado `oRadio`.
    
- `VAR nRadio` → variável de controle (`nRadio`). O valor dela indica a opção escolhida:
    
    - 1 → "Item x"
        
    - 2 → "Item 2"
        
    - 3 → "Item 3"
        
    - 4 → "Item 4"
        
- `ITEMS 'Item x', 'Item 2','Item 3', 'Item 4'` → lista de opções exibidas.
    
- `OF oDlg` → pertence ao diálogo `oDlg`.
    
- `ON CHANGE { || Alert( 'Mudando de Opcao' ) }` → ação ao trocar de opção (abre um `Alert`).
    
- `SIZE 110,10 PIXEL` → tamanho do campo.
    

---

```advpl
ACTIVATE MsDialog oDlg CENTER 
```

- Exibe a janela `oDlg` no centro da tela.
    
- A partir daqui o usuário pode interagir com o grupo de Radio Buttons.
    

---

```advpl
RETURN
```

- Finaliza a função.
    

---

### 🔹 Resumindo

Esse código cria uma tela com **um grupo de Radio Buttons**.

- Ao abrir a tela, a primeira opção já está selecionada (`nRadio = 1`).
    
- Se o usuário trocar de opção, aparece uma mensagem `"Mudando de Opcao"`.
    
- Depois, você pode usar o valor de `nRadio` para saber qual opção foi escolhida.
    

---
