## 5 - Exercício
```prw
#INCLUDE "TOTVS.CH"

/*/ {Protheus.doc} User Function MsgInfo
    (Exemplos de funcoes de alerta)
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example
    (examples)
    @see (https://tdn.totvs.com/display/tec/MsgInfo)

/*/

User Function MsgInfo()

	// Mostra um Pop-Up com um desenho de balão com a letra "i" indicando que é um alerta informativo,
	// Sinaliza ao usuário acerca de dados importantes sobre um determinado assunto.
	// A função a Inclusão de um título
	
	// Sintaxe
	// MsgInfo( <cTexto>, <cTitulo> )
	
	MsgInfo( 'Titulo', 'Mensagem' )

Return( Nil )
```

### 📌 O que é `MsgInfo()`?

É uma função que abre uma **caixa de diálogo (pop-up)** com o ícone de **informação** (um balão com a letra “i”).  
➡️ Serve para **informar o usuário sobre algo relevante**, mas sem caráter de erro nem de atenção crítica.
Exemplo de uso:
- Avisar que um processo terminou com sucesso.
- Mostrar instruções ou detalhes adicionais.
---

### ⚙️ Sintaxe

`MsgInfo(<cTexto>, <cTitulo>)`
- `<cTexto>` → Mensagem que será exibida.
- `<cTitulo>` → (Opcional) título da janela.
---

### 📌 O que o código faz:
`MsgInfo('Titulo', 'Mensagem')`

➡️ Vai mostrar uma janela com:
- **Título:** "Titulo"
- **Mensagem:** "Mensagem"
- Ícone de **informação**
---

### 📌 Diferença para outras funções:
- `MsgAlert()` → alerta com ícone de **atenção/exclamação** (quando precisa de cuidado).
- `MsgStop()` → alerta mais forte, bloqueia até o usuário confirmar.
- `MsgInfo()` → alerta **informativo**, só para avisar, sem urgência.


