## 2 - Exercício
```prw
#INCLUDE "PROTHEUS.CH"

#INCLUDE "FWBROWSE.CH"

  

/*/{Protheus.doc} U_DlgMod
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao do FWDialogModal
    @see        https://tdn.totvs.com/display/framework/FwDialogModal
/*/


User Function DlgMod()

    Local oModal
    Local oContainer
    
    oModal  := FWDialogModal():New()      
    oModal:SetEscClose(.T.)
    oModal:setTitle("Ti­tulo da Janela ")
    oModal:setSubTitle("SubTitulo da Janela")

    //Seta a largura e altura da janela em pixel

    oModal:setSize(200, 140)
    oModal:createDialog()
    oModal:addCloseButton(nil, "Fechar")

    oContainer := TPanel():New( ,,, oModal:getPanelMain() )
    oContainer:SetCss("TPanel{background-color : red;}")
    oContainer:Align := CONTROL_ALIGN_ALLCLIENT

    TSay():New(1,1,{|| "Teste "},oContainer,,,,,,.T.,,,30,20,,,,,,.T.)

    oModal:Activate()

Return
```

Esse código é um exemplo **ADVPL com Framework (FW)**, mostrando como abrir uma **janela modal personalizada** no **Protheus** usando a classe `FWDialogModal`.


---

```advpl
#INCLUDE "PROTHEUS.CH"
#INCLUDE "FWBROWSE.CH"
```

- **Inclui os cabeçalhos** necessários:
    
    - `PROTHEUS.CH` → constantes e funções padrão do Protheus.
        
    - `FWBROWSE.CH` → recursos do Framework (FW), como `FWDialogModal`, `TPanel`, `TSay`.
        

---

```advpl
/*/{Protheus.doc} U_DlgMod
    @type		Function
    @author		Milton J.dos Santos
    @since		01/03/2020
    @version	1.0.0
    @param		Nenhum
    @return		Vazio (nil)
    @example    Exemplo da utilizacao do FWDialogModal
    @see		https://tdn.totvs.com/display/framework/FwDialogModal
/*/
```

- **Bloco de documentação** (padrão TOTVS DOC).
    
- Facilita para quem gera documentação automática ou consulta no TDN.
    
- Explica autor, versão, parâmetros e exemplo de uso.
    

---

```advpl
User Function DlgMod()
    Local oModal
    Local oContainer
```

- Declara a função `U_DlgMod()` (pode ser executada no SmartClient).
    
- Cria duas variáveis locais:
    
    - `oModal` → objeto principal da janela modal.
        
    - `oContainer` → container dentro do modal, onde ficam os componentes.
        

---

```advpl
    oModal  := FWDialogModal():New()       
```

- Cria a instância da janela modal (`FWDialogModal`).
    

---

```advpl
    oModal:SetEscClose(.T.)
```

- Define que a janela pode ser fechada usando a tecla **ESC**.
    
- `.T.` = verdadeiro.
    

---

```advpl
    oModal:setTitle("Ti­tulo da Janela ")
    oModal:setSubTitle("SubTitulo da Janela")
```

- Define **título** e **subtítulo** da janela modal.
    

---

```advpl
    //Seta a largura e altura da janela em pixel
    oModal:setSize(200, 140)
```

- Define o **tamanho da janela em pixels**:
    
    - `200` = largura
        
    - `140` = altura
        

---

```advpl
    oModal:createDialog()
```

- Cria a janela modal (mas ainda não mostra na tela).
    
- É a preparação para adicionar botões, containers e componentes.
    

---

```advpl
    oModal:addCloseButton(nil, "Fechar")
```

- Adiciona um botão de **fechar** à janela.
    
- `nil` → posição padrão.
    
- `"Fechar"` → texto exibido no botão.
    

---

```advpl
    oContainer := TPanel():New( ,,, oModal:getPanelMain() )
```

- Cria um **painel (`TPanel`)** dentro do modal.
    
- `oModal:getPanelMain()` → indica que o painel será inserido no **container principal** da janela.
    

---

```advpl
    oContainer:SetCss("TPanel{background-color : red;}")
```

- Define o estilo CSS do painel.
    
- Nesse caso, **fundo vermelho**.
    

---

```advpl
    oContainer:Align := CONTROL_ALIGN_ALLCLIENT
```

- Faz o painel ocupar **todo o espaço disponível** dentro da janela modal.
    

---

```advpl
    TSay():New(1,1,{|| "Teste "},oContainer,,,,,,.T.,,,30,20,,,,,,.T.)
```

- Cria um **componente TSay** (rótulo de texto) dentro do container.
    
- Principais parâmetros:
    
    - `1,1` → posição inicial (linha 1, coluna 1).
        
    - `{|| "Teste "}` → bloco de código que retorna o texto exibido.
        
    - `oContainer` → onde o componente será inserido.
        
    - `30,20` → largura e altura do texto.
        
    - `.T.` → alguns parâmetros de controle (ex.: foco, atualização).
        

---

```advpl
    oModal:Activate()
```

- **Exibe a janela modal na tela** e permite interação com o usuário.
    
- Só depois desse comando o modal realmente aparece.
    

---

```advpl
Return ""
```

- Finaliza a função.
    
- Retorna `""` (string vazia), mas poderia ser `Nil` também.
    

---

## ✅ Resumindo

Esse código abre uma **janela modal personalizada** no Protheus com:

- Título e subtítulo.
    
- Botão de fechar.
    
- Painel vermelho preenchendo toda a janela.
    
- Texto "Teste" dentro do painel.
    

---

👉 Se você rodar `U_DlgMod()` no **SmartClient**, vai aparecer uma **janela modal vermelha** com título, subtítulo, um botão "Fechar" e a palavra "Teste" escrita dentro.

---

