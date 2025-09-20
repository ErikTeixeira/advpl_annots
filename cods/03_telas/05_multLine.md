## 5 - Exercício
```prw
#Include 'TOTVS.CH'

/*/{Protheus.doc} U_MultLine
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao de Get MultiLine
    @see        https://tdn.engpro.totvs.com.br/display/tec/@+...+GET+MULTILINE
/*/

User Function MultLine()

    Local oDlg, oGet, cText := ''

    DEFINE MsDialog oDlg TITLE "Exemplo TMultiGet" FROM 180,180 TO 550,700 PIXEL


    // Cria o Objeto tGet usando o comando @ .. GET MULTILINE

    @ 10,10 GET oGet VAR cText SIZE 200,60 MULTILINE OF oDlg PIXEL

    ACTIVATE MsDialog oDlg CENTERE

Retur
```

---

```advpl
#Include 'TOTVS.CH'
```

- Essa linha inclui o arquivo de cabeçalho **TOTVS.CH**, que contém constantes, macros e definições necessárias para funções do Protheus.
    
- É equivalente a um `import` ou `include` em outras linguagens.
    

---

```advpl
/*/{Protheus.doc} U_MultLine
    @type		Function
    @author		Milton J.dos Santos
    @since		01/03/2020
    @version	1.0.0
    @param		Nenhum
    @return		Vazio (nil)
    @example    Exemplo da utilizacao de Get MultiLine 
    @see		https://tdn.engpro.totvs.com.br/display/tec/@+...+GET+MULTILINE
/*/
```

- Esse bloco é **documentação da função**.
    
- Explica o autor, data, versão, parâmetros, retorno e exemplo de uso.
    
- Não interfere na execução do código; serve apenas como referência para quem vai usar ou manter a função.
    

---

```advpl
User Function MultLine()
```

- Define a função **MultLine**, que será do tipo `User Function` (função definida pelo usuário no Protheus).
    
- Ela não recebe parâmetros, conforme indicado na documentação.
    

---

```advpl
Local oDlg, oGet, cText := ''
```

- Declara variáveis locais para a função:
    
    - `oDlg` → será o **dialog/formulário** que aparece na tela.
        
    - `oGet` → será o **controle de entrada de texto** (campo para o usuário digitar).
        
    - `cText` → uma string que armazenará o texto digitado pelo usuário; inicializada vazia (`''`).
        

---

```advpl
DEFINE MsDialog oDlg TITLE "Exemplo TMultiGet" FROM 180,180 TO 550,700 PIXEL
```

- Cria um **dialog (janela)** chamado `oDlg` usando o comando `DEFINE MsDialog`.
    
- `TITLE "Exemplo TMultiGet"` define o título da janela.
    
- `FROM 180,180 TO 550,700 PIXEL` define a posição e o tamanho da janela em pixels na tela (canto superior esquerdo até canto inferior direito).
    

---

```advpl
// Cria o Objeto tGet usando o comando @ .. GET MULTILINE
@ 10,10 GET oGet VAR cText SIZE 200,60 MULTILINE OF oDlg PIXEL
```

- Essa linha cria um **campo de entrada de múltiplas linhas** (textarea) dentro do dialog `oDlg`.
    
- `@ 10,10` → posição dentro do dialog (x=10, y=10).
    
- `GET oGet VAR cText` → cria o controle `oGet` que será vinculado à variável `cText`. Tudo que o usuário digitar ficará armazenado em `cText`.
    
- `SIZE 200,60` → largura 200px, altura 60px.
    
- `MULTILINE` → permite que o usuário digite mais de uma linha.
    
- `OF oDlg` → indica que o controle pertence ao dialog `oDlg`.
    
- `PIXEL` → unidades de medida em pixels (em vez de linhas e colunas padrão do Protheus).
    

---

```advpl
ACTIVATE MsDialog oDlg CENTERED
```

- Exibe a janela criada (`oDlg`) na tela.
    
- `CENTERED` → faz com que o dialog seja centralizado na tela do usuário.
    
- Enquanto o dialog estiver ativo, o usuário poderá digitar no `oGet` e interagir com o formulário.
    
- Após o usuário fechar a janela, o conteúdo digitado será armazenado em `cText`.
    

---

```advpl
Return ""
```

- Retorna vazio (`nil`) para quem chamou a função.
    
- Isso indica que a função não produz um valor específico, mas apenas exibe o diálogo para interação do usuário.
    

---

✅ **Resumo do fluxo completo:**

1. Inclui bibliotecas básicas do Protheus.
    
2. Define uma função chamada `MultLine`.
    
3. Cria variáveis locais: dialog, campo de texto e string.
    
4. Cria uma janela (`dialog`) com título e tamanho definido.
    
5. Adiciona um campo de texto **multilinha** vinculado a uma variável.
    
6. Exibe a janela centralizada, permitindo o usuário digitar várias linhas.
    
7. Após o fechamento, o texto digitado fica armazenado na variável `cText`.
    
8. A função retorna vazio (`nil`).
    

---

Se você quiser, posso fazer **uma versão comentada do código já com explicações linha a linha dentro do código**, que ajuda muito a estudar ADVPL.

Quer que eu faça isso?

