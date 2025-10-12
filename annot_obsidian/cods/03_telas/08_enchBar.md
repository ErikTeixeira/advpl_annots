## 8 - Exercício
```prw
#Include 'TOTVS.CH'

/*/{Protheus.doc} U_BUTTON
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao do comando BUTTON
    @see        https://tdn.totvs.com/pages/releaseview.action?pageId=6814974
/*/

/*

    Este exemplo verifica permissoes de acesso do  usuario e por isso deve ser executado via SIGAMDI

*/

  
User Function EnchBar()

    Local aButtons := {}
    Local oDlg
    Local oBtn
    Local lOk


    DEFINE MSDIALOG oDlg TITLE "Exemplo de EnchoiceBar" FROM 000,000 TO 400,600 PIXEL  

    Aadd( aButtons, {"HISTORIC", {|| TestHist()}, "Historico...", "Historico" , {|| .T.}} )            

    @ -15,-15 BUTTON oBtn PROMPT "..." SIZE 1,1 PIXEL OF oDlg          


    ACTIVATE MSDIALOG oDlg ON INIT (EnchoiceBar(oDlg,{||lOk:=.T.,oDlg:End()},{||oDlg:End()},,@aButtons))


Return


Static Function TestHist()  

    ApMsgInfo("Mostra historico")

Retur
```

---

```advpl
#Include 'TOTVS.CH'
```

- Inclui o **arquivo de cabeçalho da TOTVS**, com constantes, funções padrões e macros do Protheus.

---

```advpl
/*/{Protheus.doc} U_BUTTON
    @type		Function
    @author		Milton J.dos Santos
    @since		01/03/2020
    @version	1.0.0
    @param		Nenhum
    @return		Vazio (nil)
    @example    Exemplo da utilizacao do comando BUTTON
    @see		https://tdn.totvs.com/pages/releaseview.action?pageId=6814974
/*/
```

- Documentação padrão de função Protheus.
- Indica autor, tipo de função, parâmetros e retorno.
- Facilita a consulta no TDN (TOTVS Developer Network).
---

```advpl
/*
    Este exemplo verifica permissoes de acesso do  usuario e por isso deve ser executado via SIGAMDI
*/
```

- Comentário explicativo.
    
- Diz que a função precisa de **permissões de usuário** e que deve rodar via **SIGAMDI** (console administrativo do Protheus).
---

```advpl
User Function EnchBar()
    Local aButtons := {}
    Local oDlg
    Local oBtn
    Local lOk
```

- **Declaração da função principal** `EnchBar()`.
    
- Cria variáveis locais:
    - `aButtons` → array que vai armazenar os botões dinâmicos da barra.
    - `oDlg` → objeto da janela (`MsDialog`).
    - `oBtn` → objeto botão para placeholder.
    - `lOk` → flag lógica para indicar que uma ação foi confirmada.

---

```advpl
DEFINE MSDIALOG oDlg TITLE "Exemplo de EnchoiceBar" FROM 000,000 TO 400,600 PIXEL
```

- Cria uma **tela (dialog)** chamada `oDlg`.
    
- Tamanho: do canto superior esquerdo `(0,0)` até `(400,600)` pixels.
    
- Título: `"Exemplo de EnchoiceBar"`.
    

---

```advpl
Aadd( aButtons, {"HISTORIC", {|| TestHist()}, "Historico...", "Historico" , {|| .T.}} )
```

- Adiciona um **botão dinâmico** ao array `aButtons`.
    
- Cada botão é definido como array com 5 itens:
    
    1. `"HISTORIC"` → código interno do botão.
        
    2. `{|| TestHist()}` → ação do botão (lambda) que chama a função `TestHist()`.
        
    3. `"Historico..."` → texto exibido na barra ou tooltip.
        
    4. `"Historico"` → nome alternativo/legenda.
        
    5. `{|| .T.}` → condição de exibição (true = sempre visível).
        

---

```advpl
@ -15,-15 BUTTON oBtn PROMPT "..." SIZE 1,1 PIXEL OF oDlg
```

- Cria um **botão invisível** (`1x1 pixel`) na tela.
    
- Serve como **placeholder**, porque o `EnchoiceBar` precisa de um botão base para construir a barra dinâmica.
    

---

```advpl
ACTIVATE MSDIALOG oDlg ON INIT (EnchoiceBar(oDlg,{||lOk:=.T.,oDlg:End()},{||oDlg:End()},,@aButtons))
```

- **Ativa a tela (`oDlg`)**.
    
- `ON INIT` → assim que a tela abre, executa:
    
    - `EnchoiceBar()` → função que gera a **barra de botões dinâmica**.
        
    - Parâmetros do `EnchoiceBar`:
        
        1. `oDlg` → diálogo onde a barra será exibida.
            
        2. `{||lOk:=.T.,oDlg:End()}` → lambda chamada ao confirmar (ativa `lOk` e fecha a tela).
            
        3. `{||oDlg:End()}` → lambda chamada ao cancelar/fechar.
            
        4. `,` → parâmetro opcional ignorado.
            
        5. `@aButtons` → array com todos os botões configurados.
            

---

```advpl
Return
```

- Final da função `EnchBar()`.
    

---

```advpl
Static Function TestHist()
    ApMsgInfo("Mostra historico")
Return
```

- Função **estática**, só usada internamente.
    
- Quando o botão `"Historico..."` é clicado, executa:
    
    - `ApMsgInfo("Mostra historico")` → exibe mensagem na tela: `"Mostra historico"`.
        

---

### 🔹 Resumo do funcionamento

1. Cria uma **tela vazia (`MsDialog`)**.
    
2. Cria um **botão invisível** que servirá de base.
    
3. Adiciona botões dinâmicos em `aButtons`, cada um com:
    
    - Código, ação (lambda), legenda, tooltip e visibilidade.
        
4. Usa `EnchoiceBar()` para gerar a **barra de botões dinâmica**.
    
5. Quando um botão é clicado, executa a função lambda associada (`TestHist()` neste caso).
    
6. Fecha a tela quando a ação é finalizada.
    

---


