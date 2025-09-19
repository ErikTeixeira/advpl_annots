## 8 - Exercício
```prw
#INCLUDE "TOTVS.CH"

/*/ {Protheus.doc} User Function MsgYesNo
    (Exemplos de funcoes de alerta)
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    (examples)
    @see        (https://tdn.totvs.com/pages/viewpage.action?pageId=24347000)
/*/

  
User Function MsgYesNo()

    // Pop-Up que mostra um icone de Interrogação e uma mensagem na tela e espera que o usuário
    // decida, por meio dos botões Sim e Não, qual ação será tomada. A opção padrão é o Sim já
    // selecionado apenas para confirmar. Permite o uso de Titulo na tela
  
    // Sintaxe
    // MsgYesNo( <cTexto>, <cTitulo> )

  
    If MsgYesNo( 'Confirma?', 'Exemplo' )
        MsgInfo( 'Sim', 'Exemplo' )

    Else
        MsgInfo( 'Nao', 'Exemplo' )

    Endif

Return( Nil )
```

### 📌 O que é `MsgYesNo()`?
- É uma função que abre uma **caixa de diálogo** com:
    - Ícone de interrogação (❓).
    - Texto da mensagem.
    - Botões **Sim** e **Não**.
        
- O retorno é **.T. (True)** se o usuário clicar em **Sim**, e **.F. (False)** se clicar em **Não**.
- Diferente do `Alert()`, permite incluir um **título** na janela.
---

### ⚙️ Sintaxe
`MsgYesNo( <cTexto>, <cTitulo> ) → Lógico`

- **`<cTexto>`** → mensagem exibida.
- **`<cTitulo>`** → título da janela.

- **Retorno:**
    - `.T.` (verdadeiro) → usuário clicou em **Sim**.
    - `.F.` (falso) → usuário clicou em **Não**.
---

### 📌 O que o código faz

```
If MsgYesNo( 'Confirma?', 'Exemplo' )    
	MsgInfo( 'Sim', 'Exemplo' ) 
Else     
	MsgInfo( 'Nao', 'Exemplo' ) Endif
```

1. Mostra uma janela com:
    - **Título:** "Exemplo"
    - **Mensagem:** "Confirma?"
    - Botões **Sim** e **Não**
        
2. Se o usuário clicar em **Sim**, aparece outra janela (`MsgInfo`) dizendo **"Sim"**.
3. Se clicar em **Não**, aparece uma janela dizendo **"Não"**.

---

### ✅ Quando usar?
- Para confirmar ações importantes antes de executá-las.
- Exemplos práticos:
    - "Deseja excluir este registro?"
    - "Deseja realmente encerrar o sistema?"
    - "Deseja salvar as alterações?"


