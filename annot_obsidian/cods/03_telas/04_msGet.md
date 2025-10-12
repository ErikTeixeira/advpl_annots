## 4 - Exercício
```prw
#Include 'TOTVS.CH'

/*/{Protheus.doc} U_MsGet
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao do comando MsGet
    @see        (https://tdn.totvs.com/pages/)
/*/


User Function MsGet

    Local oDlg,oValTot
    Local nTGerBco :=0

    DEFINE MsDialog oDlg TITLE "Exemplo de MsGet" FROM 0,0 TO 400,600 PIXEL

    @ 267, 530 MsGet oValTot VAR nTGerBco SIZE 120, 010 OF oDlg PICTURE "@E 99,999,999,999.99" Font oFont PIXEL

    ACTIVATE MsDialog oDlg CENTER

RETURN
```

**exemplo ADVPL usando `MsGet`**, que é usado para **campos de entrada de dados numéricos com formatação** dentro de uma janela do Protheus.

---

## 1️⃣ `#Include 'TOTVS.CH'`

```advpl
#Include 'TOTVS.CH'
```

- Inclui **constantes, tipos e funções do Protheus**.
    
- Necessário para trabalhar com `MsDialog`, `MsGet`, cores, fontes e formatações.

---

## 2️⃣ Comentário `Protheus.doc`

```advpl
/*/{Protheus.doc} U_MsGet
    @type      Function
    @author    ...
```

- Comentário de documentação formal para **TOTVS Developer Studio** ou TDN.
    
- Define autor, versão, parâmetros, retorno e exemplo.
    

---

## 3️⃣ Declaração da função e variáveis

```advpl
User Function MsGet
    Local oDlg,oValTot
    Local nTGerBco :=0
```

- `oDlg` → objeto da janela (`MsDialog`).
    
- `oValTot` → objeto `MsGet`, que representa o campo de entrada numérico.
    
- `nTGerBco` → variável **armazenará o valor digitado pelo usuário**, inicializada com 0.
    

💡 **Resumo:** `MsGet` funciona como `GET`, mas para números com **máscara/formatos especiais**.

---

## 4️⃣ Criar a janela

```advpl
DEFINE MsDialog oDlg TITLE "Exemplo de MsGet" FROM 0,0 TO 400,600 PIXEL
```

- Cria uma **janela MsDialog**:
    
    - Posição inicial: `(0,0)` pixels (canto superior esquerdo da tela).
        
    - Tamanho: 400px altura × 600px largura.
        
    - Título: `"Exemplo de MsGet"`.
        
- `oDlg` é a **variável que representa a janela**, permitindo manipular propriedades.
    

---

## 5️⃣ Criar o campo MsGet

```advpl
@ 267, 530 MsGet oValTot VAR nTGerBco SIZE 120, 010 OF oDlg PICTURE "@E 99,999,999,999.99" Font oFont PIXEL
```

Vamos detalhar cada parte:

|Comando|Função|
|---|---|
|`@ 267,530`|Posição do campo dentro da janela: 267px do topo e 530px da esquerda.|
|`MsGet oValTot`|Cria o **campo numérico** e associa à variável `oValTot`.|
|`VAR nTGerBco`|Variável que vai **armazenar o valor digitado** pelo usuário.|
|`SIZE 120,010`|Tamanho do campo: 120px largura x 10px altura.|
|`OF oDlg`|Campo pertence à janela `oDlg`.|
|`PICTURE "@E 99,999,999,999.99"`|**Máscara de formatação numérica**:|
||- `@E` → alinhamento à direita e zeros à esquerda.|
||- `99,999,999,999.99` → formato com separador de milhares e duas casas decimais.|
|`Font oFont`|Aplica a fonte (não definida no seu código, mas poderia ser `TFont`).|
|`PIXEL`|Medidas em pixels.|

💡 **Resumo:** `MsGet` é um **campo numérico formatado**, ideal para valores monetários ou grandes números, diferente do `GET` que é texto simples.

---

## 6️⃣ Exibir a janela

```advpl
ACTIVATE MsDialog oDlg CENTER
```

- Mostra a janela na tela.
    
- `CENTER` → centraliza a janela na tela.
    

---

## 7️⃣ Retorno da função

```advpl
RETURN
```

- A função **não retorna nada**.
    
- O valor digitado pelo usuário fica armazenado em `nTGerBco`, pronto para ser usado em cálculos ou validações.
    

---

### ✅ Resumo visual da janela

```
Janela: "Exemplo de MsGet"
 └─ Campo MsGet (oValTot) -> nTGerBco
     Posição: 267px topo, 530px esquerda
     Tamanho: 120x10
     Formato: "@E 99,999,999,999.99"
     Uso: número com máscara (dinheiro ou grande valor)
```

---


