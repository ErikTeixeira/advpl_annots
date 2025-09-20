## 3 - Exercício
```prw
#Include 'TOTVS.CH'

/*/{Protheus.doc} U_Get
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao de Get
    @see        https://tdn.engpro.totvs.com.br/display/tec/@+...+GET
/*/

  
User Function Get()

    Local oDlg, oGet1, oGet2
    Local cGet1 := Space(20)
    Local cGet2 := Space(20)

    DEFINE MsDialog oDlg TITLE "Exemplo de Get" FROM 180,180 TO 550,700 PIXEL

    // Cria o Objeto tGet usando o comando @ .. GET

    @ 10,10 GET oGet1 VAR cGet1 SIZE 200,20 OF oDlg PIXEL


    // Cria o Objeto tGet usando o comando @ .. GET

    @ 50,10 GET oGet2 VAR cGet2 SIZE 200,20 OF oDlg PIXEL VALID !empty(cGet2) PASSWORD


    ACTIVATE MsDialog oDlg CENTERED

Return
```

## **ADVPL usando `GET`**, que cria campos de entrada de dados dentro de uma janela do Protheus.

---

## 1️⃣ `#Include 'TOTVS.CH'`

```advpl
#Include 'TOTVS.CH'
```
- Inclui **constantes, tipos e funções padrão do Protheus**.
- Necessário para usar `MsDialog`, `GET`, cores, fontes e outros objetos do TOTVS.
---

## 2️⃣ Comentário `Protheus.doc`

```advpl
/*/{Protheus.doc} U_Get
    @type      Function
    @author    ...
```

- Comentário formal de documentação **para o TOTVS Developer Studio e TDN**.
- Define autor, versão, parâmetros, retorno e exemplos.

---

## 3️⃣ Declaração da função e variáveis

```advpl
User Function Get()
    Local oDlg, oGet1, oGet2 
    Local cGet1 := Space(20)
    Local cGet2 := Space(20)
```

- `oDlg` → objeto da janela (`MsDialog`).
    
- `oGet1`, `oGet2` → objetos de entrada de texto (`tGet`).
    
- `cGet1`, `cGet2` → **variáveis que armazenam os valores digitados** nos campos `GET`.
    
    - `Space(20)` → inicializa as variáveis com 20 espaços em branco.
        

💡 **Resumo:** `GET` precisa de uma variável para armazenar o que o usuário digitar.

---

## 4️⃣ Criar a janela

```advpl
DEFINE MsDialog oDlg TITLE "Exemplo de Get" FROM 180,180 TO 550,700 PIXEL
```

- Cria a janela `oDlg` com:
    
    - Posição inicial: `(180,180)` pixels.
        
    - Tamanho: 550px altura × 700px largura.
        
    - Título: `"Exemplo de Get"`.

---

## 5️⃣ Criar o primeiro campo GET

```advpl
@ 10,10 GET oGet1 VAR cGet1 SIZE 200,20 OF oDlg PIXEL
```

- `@ 10,10` → posição dentro da janela: 10px do topo, 10px da esquerda.
    
- `GET oGet1` → cria o objeto de entrada `oGet1`.
    
- `VAR cGet1` → vincula o campo à variável `cGet1`.
    
- `SIZE 200,20` → tamanho do campo: 200px largura × 20px altura.
    
- `OF oDlg` → associa o campo à janela `oDlg`.
    
- `PIXEL` → indica que medidas estão em pixels.
    

💡 **Resumo:** este é um **campo de texto simples**, sem validação especial.

---

## 6️⃣ Criar o segundo campo GET (com validação e senha)

```advpl
@ 50,10 GET oGet2 VAR cGet2 SIZE 200,20 OF oDlg PIXEL VALID !empty(cGet2) PASSWORD
```

- `@ 50,10` → posição: 50px do topo, 10px da esquerda.
    
- `GET oGet2 VAR cGet2` → campo vinculado à variável `cGet2`.
    
- `SIZE 200,20 OF oDlg PIXEL` → tamanho e janela.
    
- `VALID !empty(cGet2)` → **validação**: o campo não pode ficar vazio.
    
- `PASSWORD` → **esconde os caracteres digitados** (como senha).
    

💡 **Resumo:** este campo funciona como um **input de senha obrigatório**.

---

## 7️⃣ Exibir a janela

```advpl
ACTIVATE MsDialog oDlg CENTERED
```

- Mostra a janela na tela.
    
- `CENTERED` → centraliza a janela.
---

## 8️⃣ Retorno da função

```advpl
Return
```

- A função **não retorna nada**.
    
- Mas os valores digitados ficam armazenados em `cGet1` e `cGet2`.
---

## ✅ Resumo visual da janela

```
Janela: "Exemplo de Get"
 ├─ Campo 1: oGet1 -> cGet1 (texto simples)
 │   Posição: 10,10
 │   Tamanho: 200x20
 └─ Campo 2: oGet2 -> cGet2 (senha, obrigatório)
     Posição: 50,10
     Tamanho: 200x20
     Validação: não vazio
```

---

