## 2 - Exercício
```prw
User Function U_ParamBox()

    Local aPergs    := {}
    Local cCodRec   := space(08)
    Local cRecDest  := space(08)  
    Local aRet      := {}

    aAdd( aPergs ,{1,"Recurso De: "     ,cCodRec    ,"@"    ,'.F.'              ,,'.F.',40,.F.})

    aAdd( aPergs ,{1,"Recurso Para: "   ,cRecDest   ,"@!"   ,'!Empty(mv_par02)' ,,'.T.',40,.T.})

  
    If ParamBox(aPergs ,"Substitui recurso",aRet)

        MsgAlert("Recurso original: " + aRet[1] + " substituido pelo recurso:" + aRet[2],"Exemplo do ParamBox" )

    Else
        MsgAlert("Processo cancelado","Exemplo do ParamBox")

    EndIf

Return .T.
```


---

### **Análise do código**

#### 1️⃣ Declaração da função

```advpl
User Function U_ParamBox()
```

- É uma **User Function**, ou seja, pode ser chamada dentro do SmartClient, de menus, ou de outro programa ADVPL.
    
- `U_` no início é só uma convenção para funções de usuário.
    

---

#### 2️⃣ Declaração de variáveis

```advpl
Local aPergs	:= {}         // Array para armazenar as perguntas/inputs do ParamBox
Local cCodRec	:= space(08) // Inicializa uma string de 8 espaços (código do recurso de origem)
Local cRecDest	:= space(08) // Inicializa uma string de 8 espaços (código do recurso de destino)
Local aRet		:= {}         // Array que vai receber os valores digitados no ParamBox
```

- `space(08)` cria uma string vazia com 8 espaços.
    
- `aPergs` vai definir os campos que aparecerão na caixa de diálogo.
    

---

#### 3️⃣ Definindo as perguntas do ParamBox

```advpl
aAdd( aPergs ,{1,"Recurso De: "		,cCodRec	,"@"	,'.F.'				,,'.F.',40,.F.})
aAdd( aPergs ,{1,"Recurso Para: "	,cRecDest	,"@!"	,'!Empty(mv_par02)'	,,'.T.',40,.T.})
```

Cada elemento de `aPergs` é um **array com configuração do campo**:

- **1** → tipo de campo (1 = texto)
    
- **"Recurso De:" / "Recurso Para:"** → label que aparece na tela
    
- **cCodRec / cRecDest** → variável que vai receber o valor digitado
    
- **"@" / "@!"** → máscara de validação do campo (padrão)
    
- **'.F.' / '.T.'** → indica se é obrigatório ou não
    
- **40** → tamanho máximo do campo
    
- Os outros valores (`,,`) são opcionais, geralmente relacionados a máscara ou expressão de validação.
    

O segundo campo tem a expressão `'!Empty(mv_par02)'` → significa que ele **não aceita valor vazio**.

---

#### 4️⃣ Chamando o `ParamBox`

```advpl
If ParamBox(aPergs ,"Substitui recurso",aRet)
	MsgAlert("Recurso original: " + aRet[1] + " substituido pelo recurso:" + aRet[2],"Exemplo do ParamBox" )
Else
	MsgAlert("Processo cancelado","Exemplo do ParamBox")
EndIf
```

- `ParamBox()` abre uma **caixa de diálogo de parâmetros**.
    
- Parâmetros:
    
    1. `aPergs` → campos que serão exibidos
        
    2. `"Substitui recurso"` → título da janela
        
    3. `aRet` → array que vai receber os valores digitados pelo usuário
        
- Retorna `.T.` se o usuário clicou em **OK** e `.F.` se cancelou.
    
- `MsgAlert()` mostra uma mensagem com o resultado.
    

---

#### 5️⃣ Retorno da função

```advpl
Return .T.
```

- Sempre retorna `.T.` (verdadeiro).
    
- Isso é opcional, mas muitas funções de usuário retornam um valor lógico.
    

---

### ⚠️ Observações importantes

- Não é necessário compilar o `.prw` se estiver usando **SmartClient** em modo **interpretação**, mas se for em ambiente **protheus Server**, deve compilar (`build`).
    
- Certifique-se de que a função esteja salva com o **prefixo correto** (`U_`) se for chamar pelo menu.
    
- `ParamBox` é útil para **pegar dados do usuário** de forma rápida sem criar telas complexas.
    

---
