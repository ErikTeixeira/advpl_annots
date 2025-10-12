## 3 - Exercício
```prw 
#Include "Protheus.ch"

/*/{Protheus.doc} U_SduLogin
    @type       Ponto de Entrada
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao de SduLogin
    @see        https://tdn.totvs.com/display/public/PROT/SDULogin+-+Entrada+e+acesso
/*/


User Function SduLogin()

    Local lRet  := .T.
    Local cUser := ParamIXB

    MsgAlert("Usuário "+ Alltrim(cUser) + " efetuou login no APSDU em " + DTOC(Date()) + " às "+Time())


Return .T.
```

 **Ponto de Entrada** chamado **SDULogin**, usado especificamente no **APSdu (utilitário de administração do Protheus)**. 

---

### 📌 Cabeçalho

```advpl
#Include "Protheus.ch"

/*/{Protheus.doc} U_SduLogin
    @type       Ponto de Entrada
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao de SduLogin
    @see        https://tdn.totvs.com/display/public/PROT/SDULogin+-+Entrada+e+acesso
/*/
```

- O `#Include "Protheus.ch"` importa as definições básicas do Protheus.
    
- O bloco `Protheus.doc` documenta a função como **Ponto de Entrada**, para aparecer na doc oficial e ser reconhecido pelo sistema.
    
- O link no `@see` aponta para a documentação oficial da TOTVS sobre o **SDULogin**.
    

---

### 📌 Função principal

```advpl
User Function SduLogin()
    Local lRet   := .T.
    Local cUser  := ParamIXB

    MsgAlert("Usuário "+ Alltrim(cUser) + " efetuou login no APSDU em " + DTOC(Date()) + " às "+Time())

Return .T.
```

1. **Declaração da função**
    
    - `User Function SduLogin()` define o **Ponto de Entrada**.
        
    - Ele é disparado automaticamente quando um usuário faz login no **APSdu**.
        
2. **Variáveis locais**
    
    - `lRet := .T.` → indica retorno verdadeiro (mas no fim o `.T.` não é usado no fluxo, porque a função retorna sempre `.T.` no final).
        
    - `cUser := ParamIXB` → recebe o **código do usuário logado** (o APSdu passa isso no parâmetro).
        
3. **Mensagem para o usuário**
    
    ```advpl
    MsgAlert("Usuário "+ Alltrim(cUser) + " efetuou login no APSDU em " + DTOC(Date()) + " às "+Time())
    ```
    
    - `MsgAlert()` abre uma **caixa de alerta** na tela.
        
    - A mensagem será algo assim:
        
        ```
        Usuário ADMIN efetuou login no APSDU em 20/09/2025 às 23:10:35
        ```
        
    - `AllTrim()` remove espaços extras.
        
    - `DTOC(Date())` converte a data atual para string (`20/09/2025`).
        
    - `Time()` retorna a hora atual (`23:10:35`).
        
4. **Retorno da função**
    
    ```advpl
    Return .T.
    ```
    
    - O ponto de entrada sempre retorna verdadeiro, permitindo o login normalmente.
        

---

✅ **Resumo**:  
Esse PE é disparado quando alguém entra no **APSdu**. Ele captura o usuário (`ParamIXB`) e mostra um alerta na tela informando **quem entrou**, **quando** (data e hora).

---

