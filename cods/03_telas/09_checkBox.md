## 9 - Exercício
```prw
#Include 'TOTVS.CH'

/*/{Protheus.doc} U_CheckBox
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao de CheckBox
    @see        https://tdn.engpro.totvs.com.br/display/tec/@+...+CHECKBOX
/*/


User Function CheckBox()

    Local oDlg, oChkBox, lCheck := .F.

    DEFINE MsDialog oDlg TITLE "Exemplo CheckBox" FROM 100,100 TO 450,400 PIXEL

    // Cria o Objeto tCheckBox usando o comando @ .. CHECKBOX

    @ 10,10 CHECKBOX oChkBox VAR lCheck PROMPT "Selecione" SIZE 60,15 OF oDlg PIXEL

    ACTIVATE MsDialog oDlg CENTERED

Return
```

---

```advpl
#Include 'TOTVS.CH'
```

- Inclui o **arquivo de cabeçalho da TOTVS**, que contém constantes, funções padrão e macros utilizadas pelo Protheus.
    

---

```advpl
/*/{Protheus.doc} U_CheckBox
    @type		Function
    @author		Milton J.dos Santos
    @since		01/03/2020
    @version	1.0.0
    @param		Nenhum
    @return		Vazio (nil)
    @example    Exemplo da utilizacao de CheckBox 
    @see		https://tdn.engpro.totvs.com.br/display/tec/@+...+CHECKBOX
/*/
```

- Bloco de documentação padrão.
    
- Explica o autor, tipo da função, parâmetros, retorno e exemplo de uso.
    

---

```advpl
User Function CheckBox()
    Local oDlg, oChkBox, lCheck := .F.
```

- Cria a função `CheckBox()`.
    
- Declara variáveis locais:
    
    - `oDlg` → objeto do diálogo (`MsDialog`).
        
    - `oChkBox` → objeto do **checkbox** que será criado.
        
    - `lCheck` → variável lógica que armazenará o estado do checkbox (`.T.` = marcado, `.F.` = desmarcado), inicializado como `.F.`.
        

---

```advpl
DEFINE MsDialog oDlg TITLE "Exemplo CheckBox" FROM 100,100 TO 450,400 PIXEL
```

- Cria uma **tela (dialog)** chamada `oDlg`.
    
- Tamanho definido pelos pixels:
    
    - Canto superior esquerdo: `(100,100)`
        
    - Canto inferior direito: `(450,400)`
        
- Título da janela: `"Exemplo CheckBox"`
    

---

```advpl
// Cria o Objeto tCheckBox usando o comando @ .. CHECKBOX
@ 10,10 CHECKBOX oChkBox VAR lCheck PROMPT "Selecione" SIZE 60,15 OF oDlg PIXEL
```

- Cria um **checkbox** na tela:
    
    - `@ 10,10` → posição na tela (10px à direita, 10px abaixo do canto superior esquerdo).
        
    - `CHECKBOX oChkBox` → define o objeto `oChkBox` como um checkbox.
        
    - `VAR lCheck` → variável que armazena o estado do checkbox. Se o usuário marcar, `lCheck := .T.`.
        
    - `PROMPT "Selecione"` → texto exibido ao lado do checkbox.
        
    - `SIZE 60,15` → tamanho do checkbox em pixels.
        
    - `OF oDlg` → indica que o checkbox pertence à janela `oDlg`.
        

---

```advpl
ACTIVATE MsDialog oDlg CENTERED
```

- Exibe a tela (`oDlg`) na tela do usuário.
    
- `CENTERED` → centraliza a janela no monitor.
    

---

```advpl
Return
```

- Final da função. Não retorna valor (`nil`).
    

---

### 🔹 Resumo do funcionamento

1. Cria uma tela (`MsDialog`) simples.
    
2. Adiciona um **checkbox** que controla a variável `lCheck`.
    
3. Quando o usuário marca/desmarca, o valor de `lCheck` é alterado automaticamente.
    
4. Centraliza e exibe a janela.
    
5. Ao fechar, o estado do checkbox pode ser usado no seu código.
    

---

