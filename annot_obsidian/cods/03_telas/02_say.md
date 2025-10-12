## 2 - Exercício
```prw
#Include 'TOTVS.CH'

  

/*/{Protheus.doc} U_Say
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao do SAY
    @see        https://tdn.engpro.totvs.com.br/display/tec/@+...+SAY
/*/

  

User Function Say()

    Local oDlg, oFont, oSay

    DEFINE MsDialog oDlg TITLE "Exemplo do Say" FROM 180,180 TO 550,700 PIXEL

    // Cria Fonte para visualizaÃ§Ã£o

    oFont := TFont():New('Courier new',,-18,.T.)


    // Cria o Objeto tSay usando o comando @ .. SAY

    @ 10,10 SAY oSay PROMPT 'Texto para exibicao' SIZE 200,20 COLORS CLR_RED,CLR_WHITE FONT oFont OF oDlg PIXEL

    ACTIVATE MsDialog oDlg CENTERED

Return
```
---

## 1️⃣ `#Include 'TOTVS.CH'`

```advpl
#Include 'TOTVS.CH'
```

- Inclui **definições e constantes do Protheus**, como cores (`CLR_RED`), tipos de objetos (`TFont`, `MsDialog`) e funções básicas.
    
- É **necessário** em quase todos os programas ADVPL que usam objetos gráficos ou comandos do TOTVS.
    

---

## 2️⃣ Comentário `Protheus.doc`

```advpl
/*/{Protheus.doc} U_Say
    @type      Function
    @author    Milton J.dos Santos
    @since     01/03/2020
    @version   1.0.0
    @param     Nenhum
    @return    Vazio (nil)
    @example   Exemplo da utilizacao do SAY 
    @see       https://tdn.engpro.totvs.com.br/display/tec/@+...+SAY
/*/
```

- Comentário de documentação **formal do TOTVS**.
    
- Serve para o **TOTVS Developer Studio** ou TDN (TOTVS Developer Network) gerar documentação automática.
    
- Define autor, versão, data, parâmetros e retorno.
    

---

## 3️⃣ Declaração da função

```advpl
User Function Say()
    Local oDlg, oFont, oSay
```

- Cria a função `Say` que pode ser executada pelo Protheus.
    
- Declara três variáveis locais:
    
    - `oDlg` → janela do tipo `MsDialog`.
        
    - `oFont` → fonte para o texto.
        
    - `oSay` → objeto de exibição de texto (`tSay`).
        

---

## 4️⃣ Criar a janela

```advpl
DEFINE MsDialog oDlg TITLE "Exemplo do Say" FROM 180,180 TO 550,700 PIXEL
```

- Cria uma **janela MsDialog**:
    
    - Título: `"Exemplo do Say"`.
        
    - Posição inicial: `(180,180)` pixels (topo e esquerda da tela).
        
    - Tamanho: `(550px altura, 700px largura)`.
        
- `oDlg` é a **variável que representa a janela**, permitindo configurar e manipular depois.
    

---

## 5️⃣ Criar a fonte do texto

```advpl
oFont := TFont():New('Courier new',,-18,.T.)
```

- Cria um objeto `TFont` para o texto a ser exibido.
    
- Parâmetros:
    
    - `'Courier new'` → fonte.
        
    - `-` → estilo da fonte (não definido aqui).
        
    - `18` → tamanho da fonte.
        
    - `.T.` → negrito (`TRUE`).
        

💡 **Resumo:** o texto será exibido em **Courier New, tamanho 18, negrito**.

---

## 6️⃣ Criar o objeto SAY

```advpl
@ 10,10 SAY oSay PROMPT 'Texto para exibicao' SIZE 200,20 COLORS CLR_RED,CLR_WHITE FONT oFont OF oDlg PIXEL
```

- Este comando **exibe um texto dentro da janela**.
    
- Explicando cada parte:
    
    - `@ 10,10` → posição dentro da janela (10px do topo e 10px da esquerda).
        
    - `SAY oSay` → cria um **objeto SAY** e associa à variável `oSay`.
        
    - `PROMPT 'Texto para exibicao'` → texto que vai aparecer.
        
    - `SIZE 200,20` → tamanho do retângulo que contém o texto (200px largura x 20px altura).
        
    - `COLORS CLR_RED,CLR_WHITE` → cor do texto vermelho e fundo branco.
        
    - `FONT oFont` → aplica a fonte criada anteriormente.
        
    - `OF oDlg` → indica que o texto será exibido dentro da janela `oDlg`.
        
    - `PIXEL` → indica que todas as medidas (posição e tamanho) estão em pixels.
        

💡 **Resumo:** o texto `"Texto para exibicao"` aparece dentro da janela `oDlg` na posição `(10,10)`.

---

## 7️⃣ Ativar (exibir) a janela

```advpl
ACTIVATE MsDialog oDlg CENTERED
```

- Mostra a janela na tela.
    
- `CENTERED` → força a janela a aparecer **centralizada** na tela, ignorando parcialmente a posição `(180,180)`.
    

---

## 8️⃣ Retorno da função

```advpl
Return
```

- A função não retorna nada (`nil`).
    
- Simplesmente cria e exibe a janela com o texto.
    

---

### ✅ Resumo visual da hierarquia

```
Janela (oDlg)
 └─ Texto SAY (oSay)
     ├─ Posição: 10,10
     ├─ Texto: 'Texto para exibicao'
     ├─ Cor: vermelho no fundo branco
     └─ Fonte: Courier New, 18pt, negrito
```

---

Se você quiser, posso fazer **uma versão desenhada mostrando onde o texto aparece dentro da janela** para ficar bem visual. Isso ajuda muito a entender o `@ 10,10 SAY ...` e o tamanho da janela.

Quer que eu faça isso?