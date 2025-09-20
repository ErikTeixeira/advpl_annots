## 10 - Exercício
```prw
#Include "TOTVS.CH"

/*/{Protheus.doc} U_TBar
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao de TBar
    @see        https://tdn.totvs.com/display/tec/TBar
/*/


User Function TBar()

    DEFINE MsDialog oDlg TITLE "Exemplo TBar" FROM 180, 180 TO 550, 700 PIXEL

    oTBar := TBar():New( oDlg, 25, 32, .T.,,,, .F. )

  
    oTBtnBmp1 := TBtnBmp2():New( 00, 00, 35, 25, 'copyuser',,,, { || Alert( 'TBtnBmp1' ) }, oTBar, 'msGetEx',, .F., .F. )

    oTBtnBmp2 := TBtnBmp2():New( 00, 00, 35, 25, 'critica',,,, { || }, oTBar, 'Critica',, .F., .F. )

    oTBtnBmp3 := TBtnBmp2():New( 00, 00, 35, 25, 'bmpcpo',,,, { || }, oTBar, 'PCO',, .F., .F. )

    oTBtnBmp4 := TBtnBmp2():New( 00, 00, 35, 25, 'preco',,,, { || }, oTBar, 'PreÃ§o',, .F., .F. )


    ACTIVATE MsDialog oDlg CENTERED

Return
```


---

```advpl
#Include "TOTVS.CH"
```

- Inclui o **arquivo de cabeçalho padrão da TOTVS**, com constantes, funções e macros usadas no Protheus.
    

---

```advpl
/*/{Protheus.doc} U_TBar
    @type		Function
    @author		Milton J.dos Santos
    @since		01/03/2020
    @version	1.0.0
    @param		Nenhum
    @return		Vazio (nil)
    @example    Exemplo da utilizacao de TBar 
    @see		https://tdn.totvs.com/display/tec/TBar
/*/
```

- Bloco de documentação da função, informando tipo, autor, versão, parâmetros, retorno e link de referência.
    

---

```advpl
User Function TBar()
```

- Declara a função `TBar()`.
    

---

```advpl
DEFINE MsDialog oDlg TITLE "Exemplo TBar" FROM 180, 180 TO 550, 700 PIXEL
```

- Cria uma **janela (dialog)** chamada `oDlg`.
    
- Tamanho: do canto `(180,180)` até `(550,700)` pixels.
    
- Título da janela: `"Exemplo TBar"`.
    

---

```advpl
oTBar := TBar():New( oDlg, 25, 32, .T.,,,, .F. )
```

- Cria a **barra de ferramentas (TBar)** dentro do diálogo:
    
    - `oDlg` → janela onde a barra será exibida.
        
    - `25, 32` → tamanho da barra (altura e largura).
        
    - `.T.` → habilita exibição.
        
    - Os `,,,` indicam parâmetros opcionais não utilizados.
        
    - `.F.` → indica que a barra não é flutuante.
        

---

```advpl
oTBtnBmp1 := TBtnBmp2():New( 00, 00, 35, 25, 'copyuser',,,, { || Alert( 'TBtnBmp1' ) }, oTBar, 'msGetEx',, .F., .F. )
```

- Cria o **primeiro botão com imagem** na barra (`TBtnBmp2`):
    
    1. `00,00` → posição do botão na barra (offset X e Y).
        
    2. `35,25` → tamanho do botão (largura e altura em pixels).
        
    3. `'copyuser'` → nome do bitmap/imagem do botão.
        
    4. `,,,` → parâmetros opcionais não usados.
        
    5. `{ || Alert( 'TBtnBmp1' ) }` → ação lambda ao clicar no botão (abre um alerta).
        
    6. `oTBar` → barra à qual o botão pertence.
        
    7. `'msGetEx'` → tooltip ou legenda do botão.
        
    8. `,, .F., .F.` → parâmetros opcionais (visibilidade, estado, etc).
        

---

```advpl
oTBtnBmp2 := TBtnBmp2():New( 00, 00, 35, 25, 'critica',,,, { || }, oTBar, 'Critica',, .F., .F. )
oTBtnBmp3 := TBtnBmp2():New( 00, 00, 35, 25, 'bmpcpo',,,, { || }, oTBar, 'PCO',, .F., .F. )
oTBtnBmp4 := TBtnBmp2():New( 00, 00, 35, 25, 'preco',,,, { || }, oTBar, 'Preço',, .F., .F. )
```

- Cria outros **botões com imagem** na barra:
    
    - Cada botão possui imagem (`'critica'`, `'bmpcpo'`, `'preco'`) e legenda (`'Critica'`, `'PCO'`, `'Preço'`).
        
    - `{ || }` → lambda vazia, ou seja, não faz nada quando clicado.
        
    - `oTBar` → todos pertencem à mesma barra de ferramentas.
        

---

```advpl
ACTIVATE MsDialog oDlg CENTERED
```

- Exibe a janela `oDlg`.
    
- `CENTERED` → centraliza a tela no monitor.
    

---

```advpl
Return
```

- Final da função. Não retorna valor (`nil`).
    

---

### 🔹 Resumo do funcionamento

1. Cria uma **janela (MsDialog)**.
    
2. Cria uma **barra de ferramentas (TBar)** dentro da janela.
    
3. Adiciona **botões com imagens (TBtnBmp2)** na barra.
    
4. O primeiro botão tem ação (alerta), os outros estão vazios.
    
5. Exibe a janela centralizada.
    


