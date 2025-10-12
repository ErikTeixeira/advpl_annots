## 15 - Exercício
```prw
#Include 'TOTVS.CH'

  

/*/{Protheus.doc} U_TWBrowse

    @type       Function

    @author     Milton J.dos Santos

    @since      01/03/2020

    @version    1.0.0

    @param      Nenhum

    @return     Vazio (nil)

    @example    Exemplo da utilizacao de TWBrowse

    @see        https://tdn.totvs.com/display/tec/TWBrowse

/*/

  

User Function TWBrowse()

Local oOK := LoadBitmap(GetResources(),'br_verde')

Local oNO := LoadBitmap(GetResources(),'br_vermelho')  

  

DEFINE MsDialog oDlg TITLE "Exemplo TWBrowse" FROM 180,180 TO 550,700 PIXEL    

  

oBrowse := TWBrowse():New( 01 , 01, 260,184,,{'','Codigo','DescriÃ§Ã£o'},{20,30,30},;                              

oDlg,,,,,{||},,,,,,,.F.,,.T.,,.F.,,, )    

  

aBrowse   := {  {.T.,'CLIENTE 001','RUA CLIENTE 001','BAIRRO CLIENTE 001'},;                    

                {.F.,'CLIENTE 002','RUA CLIENTE 002','BAIRRO CLIENTE 002'},;                    

                {.T.,'CLIENTE 003','RUA CLIENTE 003','BAIRRO CLIENTE 003'} }    

  

oBrowse:SetArray(aBrowse)    

oBrowse:bLine := {||{If(aBrowse[oBrowse:nAt,01],oOK,oNO),aBrowse[oBrowse:nAt,02],;                      

aBrowse[oBrowse:nAt,03],aBrowse[oBrowse:nAt,04] } }    

  

// Troca a imagem no duplo click do mouse    

oBrowse:bLDblClick := {|| aBrowse[oBrowse:nAt][1] := !aBrowse[oBrowse:nAt][1],;                              

oBrowse:DrawSelect()}  

  

ACTIVATE MsDialog oDlg CENTERED

  

Return
```

Boa! Vamos por partes.  
Primeiro, um resumo em **uma linha**:

👉 Esse código cria uma tela no Protheus com um **TWBrowse** (tabela/grade de dados), exibindo clientes com colunas e ícones coloridos, permitindo alterar o status clicando duas vezes na linha.

---

### Agora, explicação **linha a linha**:

```advpl
#Include 'TOTVS.CH'
```

Inclui o cabeçalho principal do Protheus, necessário para usar classes, funções e constantes nativas.

---

```advpl
/*/{Protheus.doc} U_TWBrowse
    @type		Function
    @author		Milton J.dos Santos
    @since		01/03/2020
    @version	1.0.0
    @param		Nenhum
    @return		Vazio (nil)
    @example    Exemplo da utilizacao de TWBrowse
    @see		https://tdn.totvs.com/display/tec/TWBrowse
/*/
```

Bloco de documentação no padrão **Protheus.doc**, descrevendo a função `U_TWBrowse`: tipo, autor, versão, retorno, exemplo e link para documentação oficial.

---

```advpl
User Function TWBrowse()
```

Declara a função de usuário `TWBrowse`.

---

```advpl
Local oOK := LoadBitmap(GetResources(),'br_verde')
Local oNO := LoadBitmap(GetResources(),'br_vermelho')  
```

Carrega duas imagens (`br_verde` e `br_vermelho`) a partir dos **recursos gráficos** do Protheus e armazena em `oOK` e `oNO`.  
➡️ Essas imagens serão usadas como ícones de status no browse.

---

```advpl
DEFINE MsDialog oDlg TITLE "Exemplo TWBrowse" FROM 180,180 TO 550,700 PIXEL
```

Cria uma **janela (MsDialog)** chamada `oDlg`, com título `"Exemplo TWBrowse"`, posição inicial `(180,180)` e final `(550,700)`, usando coordenadas em pixels.

---

```advpl
oBrowse := TWBrowse():New( 01 , 01, 260,184,,{'','Codigo','DescriÃ§Ã£o'},{20,30,30},;                              
oDlg,,,,,{||},,,,,,,.F.,,.T.,,.F.,,, )    
```

Cria o objeto **TWBrowse**, ou seja, a tabela exibida dentro do `oDlg`.

- Posição: `(01,01)` até `(260,184)`.
    
- Colunas: `{'','Codigo','Descrição'}` (a primeira vazia será usada para os ícones verde/vermelho).
    
- Largura das colunas: `{20,30,30}`.
    
- `oDlg`: associa o browse ao diálogo.
    
- Outros parâmetros estão como vazios (`nil`) ou flags booleanas (`.T./.F.`).
    

---

```advpl
aBrowse := {	{.T.,'CLIENTE 001','RUA CLIENTE 001','BAIRRO CLIENTE 001'},;                    
				{.F.,'CLIENTE 002','RUA CLIENTE 002','BAIRRO CLIENTE 002'},;                    
				{.T.,'CLIENTE 003','RUA CLIENTE 003','BAIRRO CLIENTE 003'} }    
```

Cria um **array bidimensional** com os dados que o browse vai exibir:

- Primeira posição (`.T.` ou `.F.`) é o status (verdadeiro ou falso → ícone verde ou vermelho).
    
- Depois, código, rua e bairro de cada cliente.
    

---

```advpl
oBrowse:SetArray(aBrowse)
```

Associa o array `aBrowse` ao browse `oBrowse`, ou seja, os dados que serão exibidos.

---

```advpl
oBrowse:bLine := {||{If(aBrowse[oBrowse:nAt,01],oOK,oNO),aBrowse[oBrowse:nAt,02],;                      
aBrowse[oBrowse:nAt,03],aBrowse[oBrowse:nAt,04] } }
```

Define como cada **linha** do browse será montada:

- Se o valor da primeira coluna for `.T.`, mostra `oOK` (ícone verde); caso contrário, mostra `oNO` (ícone vermelho).
    
- Exibe também código, rua e bairro do cliente.
    
- `oBrowse:nAt` indica a **linha atual** do browse.
    

---

```advpl
// Troca a imagem no duplo click do mouse    
oBrowse:bLDblClick := {|| aBrowse[oBrowse:nAt][1] := !aBrowse[oBrowse:nAt][1],;                               
oBrowse:DrawSelect()}  
```

Define a ação quando o usuário dá **duplo clique** em uma linha:

- Inverte o valor lógico da primeira coluna (`.T.` vira `.F.` e vice-versa).
    
- Reatualiza o browse com `oBrowse:DrawSelect()`, mudando o ícone verde/vermelho.
    

---

```advpl
ACTIVATE MsDialog oDlg CENTERED 
```

Exibe a janela (`oDlg`) no centro da tela, com o browse ativo.

---

```advpl
Return ""
```

Finaliza a função, retornando string vazia.

---

✅ **Resumo final:**  
Esse código é um **exemplo prático de uso do TWBrowse** no Protheus. Ele cria uma tela com lista de clientes, mostra ícones de status (verde/vermelho) e permite alternar o status com duplo clique.

---

