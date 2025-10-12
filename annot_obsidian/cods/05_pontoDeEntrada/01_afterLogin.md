## 1 - Exercício
```prw
#Include "Protheus.ch"

/*/{Protheus.doc} U_AfterLogin
    @type       Ponto de Entrada
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao de AfterLogin
    @see        https://tdn.totvs.com/pages/releaseview.action?pageId=6815186
/*/


User Function AfterLogin()

    Local cId   := ParamIXB[1]
    Local cNome := ParamIXB[2]

    ApMsgAlert("UsuÃ¡rio "+ cId + " - " + Alltrim(cNome)+" efetuou login Ã s "+Time())

Retur
```

 **Ponto de Entrada** no Protheus, chamado **AfterLogin**.  


---

### 📌 Cabeçalho e documentação

```advpl
#Include "Protheus.ch"

/*/{Protheus.doc} U_AfterLogin
    @type       Ponto de Entrada
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao de AfterLogin
    @see        https://tdn.totvs.com/pages/releaseview.action?pageId=6815186
/*/
```

- O `#Include "Protheus.ch"` importa as definições e funções padrão do Protheus.
    
- O bloco de comentário estruturado (`Protheus.doc`) é usado para **documentar a função** e aparecer na **documentação automática do Protheus**.
    
- `@type Ponto de Entrada` → significa que essa função é **executada automaticamente** em um evento específico do sistema.
    
- O link do `@see` leva para a documentação oficial no TDN (TOTVS Developer Network).
    

---

### 📌 Definição da função

```advpl
User Function AfterLogin()
```

- Define a função de usuário `AfterLogin`.
    
- Esse **Ponto de Entrada** é chamado **logo após um usuário realizar login** no Protheus.
    

---

### 📌 Captura de parâmetros

```advpl
Local cId   := ParamIXB[1]
Local cNome := ParamIXB[2]
```

- `ParamIXB` é um array que contém os parâmetros que o Protheus passa para o Ponto de Entrada.
    
    - `ParamIXB[1]` → código do usuário que logou.
        
    - `ParamIXB[2]` → nome do usuário que logou.
        

---

### 📌 Exibição da mensagem

```advpl
ApMsgAlert("Usuário "+ cId + " - " + Alltrim(cNome)+" efetuou login às "+Time())
```

- `ApMsgAlert()` exibe uma **caixa de mensagem na tela** do usuário.
    
- O conteúdo mostrado será algo assim:
    

👉 **Exemplo de saída**:

```
Usuário ADMIN - João Silva efetuou login às 10:42:15
```

- `Alltrim(cNome)` remove espaços extras do nome.
    
- `Time()` pega a hora atual.
    

---

### 📌 Retorno da função

```advpl
Return
```

- A função não precisa retornar nada específico (o retorno é `nil`).
    

---

✅ **Resumo**:  
Esse código intercepta o **evento de login no Protheus** e mostra uma mensagem na tela informando **quem logou** e **em que horário**.  
É útil para auditoria simples, feedback para o usuário ou até customizações de segurança.

---

