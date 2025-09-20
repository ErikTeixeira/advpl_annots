## 6 - Exercício
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
    @see        https://tdn.totvs.com/pages/
/*/

  
User Function BUTTON

	Local oDlg
	
	DEFINE MsDialog oDlg TITLE "Exemplo de MsDialog" FROM 0,0 TO 400,600 PIXEL
	
	@ 122, 060 BUTTON Confirmar PROMPT "Confirmar" SIZE 037, 012 OF oDlg ACTION { U_Msg() } PIXEL

	ACTIVATE MsDialog oDlg CENTER

RETURN
  

User Function Msg

	MsgAlert("Clique no botao confirmar")

RETURN
```

---

```advpl
#Include 'TOTVS.CH'
```

- Inclui o arquivo de cabeçalho **TOTVS.CH**, que contém constantes, macros e definições básicas usadas em Protheus.  
- Necessário para usar comandos como `DEFINE MsDialog`, `BUTTON`, `MsgAlert`, etc.  

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
    @see		https://tdn.totvs.com/pages/
/*/
```

- Esse bloco é **documentação da função**.
- Serve apenas para referência, não interfere na execução.
- Explica autor, versão, parâmetros, retorno e exemplo de uso.
---

```advpl
User Function BUTTON
Local oDlg
```

- Define a função `BUTTON` (função do usuário).
- Declara a variável local `oDlg`, que será usada como **diálogo/janela**.
---

```advpl
DEFINE MsDialog oDlg TITLE "Exemplo de MsDialog" FROM 0,0 TO 400,600 PIXEL
```

- Cria um **dialog (janela)** chamado `oDlg`.
    
- `TITLE "Exemplo de MsDialog"` define o título da janela.
    
- `FROM 0,0 TO 400,600 PIXEL` define a posição (canto superior esquerdo) e o tamanho da janela em pixels (largura 400, altura 600).
    

---

```advpl
@ 122, 060 BUTTON Confirmar PROMPT "Confirmar" SIZE 037, 012 OF oDlg ACTION { U_Msg() } PIXEL
```

- Cria um **botão** dentro do diálogo `oDlg`.
    
- `@ 122,060` → posição dentro da janela (x=122, y=60).
    
- `BUTTON Confirmar` → nome interno do botão (`Confirmar`).
    
- `PROMPT "Confirmar"` → texto exibido no botão.
    
- `SIZE 037,012` → largura 37px e altura 12px.
    
- `OF oDlg` → o botão pertence ao dialog `oDlg`.
    
- `ACTION { U_Msg() }` → define **a ação ao clicar no botão**: chama a função `U_Msg()`.
    
- `PIXEL` → define medidas em pixels.
    

---

```advpl
ACTIVATE MsDialog oDlg CENTER
```

- Exibe o dialog `oDlg` na tela.
    
- `CENTER` → centraliza a janela na tela.
    
- Enquanto o diálogo estiver ativo, o usuário pode interagir com ele.
    

---

```advpl
RETURN
```

- Finaliza a função `BUTTON`.
    
- Retorna vazio (`nil`) porque a função só exibe a janela e o botão.
    

---

```advpl
User Function Msg
```

- Define a função `Msg`, que será chamada quando o botão for clicado.
    

---

```advpl
MsgAlert("Clique no botao confirmar")
```

- Exibe uma **mensagem de alerta** com o texto `"Clique no botao confirmar"`.
    
- Essa função é usada aqui para mostrar uma reação simples ao clique no botão.
    

---

```advpl
RETURN
```

- Finaliza a função `Msg`.
    

---

✅ **Resumo do fluxo completo:**

1. Inclui bibliotecas básicas (`TOTVS.CH`).
    
2. Cria a função `BUTTON`.
    
3. Dentro dela, cria um **dialog** (`oDlg`) com tamanho definido.
    
4. Adiciona um **botão** chamado "Confirmar" no dialog, com ação ligada à função `U_Msg()`.
    
5. Exibe o dialog centralizado na tela.
    
6. Quando o usuário clica no botão, é chamada a função `Msg`, que exibe um **alerta** com a mensagem "Clique no botao confirmar".
    

---

Se quiser, posso fazer uma **versão comentada do código com explicação linha a linha dentro do próprio código**, que deixa bem didático para estudo de ADVPL.

Quer que eu faça?

