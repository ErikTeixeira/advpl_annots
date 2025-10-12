## 13 - Exercício
```prw
#Include 'TOTVS.CH'

/*/{Protheus.doc} U_Input
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo de uma tela que solicita dados ao usuÃ¡rio
/*/

User Function Input()

    Local cNome := ""

    cNome := FwInputBox("Qual o seu nome?", cNome)

    Alert(cNome)

Return()
```


---

### 1. Cabeçalho e documentação
```advpl
#Include 'TOTVS.CH'

/*/{Protheus.doc} U_Input
    @type		Function
    @author		Milton J.dos Santos
    @since		01/03/2020
    @version	1.0.0
    @param		Nenhum
    @return		Vazio (nil)
    @example    Exemplo de uma tela que solicita dados ao usuário
/*/
```
- `#Include 'TOTVS.CH'` → inclui as definições necessárias para os comandos gráficos e funções padrão do Protheus.  
- O bloco `Protheus.doc` só documenta a função (não afeta o funcionamento).

---

### 2. Função principal
```advpl
User Function Input()
    Local cNome := ""
```
- Define a função `U_Input`.  
- Cria a variável `cNome`, inicialmente vazia (`""`), que vai armazenar o nome digitado.

---

### 3. Caixa de entrada de dados
```advpl
cNome := FwInputBox("Qual o seu nome?", cNome)
```
- `FwInputBox()` → abre uma **caixa de texto** para o usuário digitar alguma coisa.  
  - Primeiro parâmetro → a mensagem exibida: `"Qual o seu nome?"`.  
  - Segundo parâmetro → valor inicial (nesse caso, vazio).  
- O valor digitado pelo usuário é retornado e guardado em `cNome`.

---

### 4. Mostrando o resultado
```advpl
Alert(cNome)
```
- Depois que o usuário digita o nome, aparece uma **caixinha de alerta** exibindo o valor armazenado em `cNome`.

---

### 5. Encerrando a função
```advpl
Return()
```
Finaliza a execução.

---

✅ **Resumo do que acontece**:
1. O sistema abre uma janelinha perguntando: *"Qual o seu nome?"*.  
2. O usuário digita algo (exemplo: *"Erik"*).  
3. O valor digitado é guardado em `cNome`.  
4. Logo em seguida, aparece um **alerta** mostrando esse valor.  

---

👉 Esse tipo de função é usado quando você precisa de **um dado rápido do usuário**, sem precisar abrir uma tela completa com `MsDialog`.  

