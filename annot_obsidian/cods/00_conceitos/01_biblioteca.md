## 1 - Exercício 
```prw
#INCLUDE "TOTVS.CH"

/*/

    Programa.: Biblioteca.PRW
    Funcao...: U_Biblioteca()
    Autor....: Milton J.dos Santos
    Data.....: 01/01/2020

    Arquivos INCLUDE:

    Geralmente os includes estao no caminho: C:\TOTVS\Protheus\Include

    Esses arquivos contem um código-fonte a ser incluído no arquivo de programa corrente e deve ser obrigatoriamente
    delimitado por aspas simples ou duplas.

    Todo arquivo ADVPL deve ter pelo menos um INCLUDE, que se refere as funcoes escritas no PRW.

    Sem o INCLUDE certo a funcao nao eh compilada !

     Exemplo: - A estrutura da funcao ADVPL ALERT() esta na biblioteca "TOTVS.CH"

/*/ 


User Function BIBLIOTECA

	Alert("Esta funcao esta na BIBLIOTECA TOTVS.CH")

Return

```

### **1. `#INCLUDE "TOTVS.CH"`**
- **O que é:** Um comando de inclusão de bibliotecas (similar ao `import` em outras linguagens).
- **Para que serve:**
    - Carrega definições, constantes, funções e estruturas necessárias para o ADVPL.
    - A `"TOTVS.CH"` contém funções básicas do Protheus, como `Alert()`.
    - Sem o include correto, o programa não compila, pois o compilador não reconhece as funções usadas.
---

### **2. Bloco de comentário (`/* ... */`)**
- **O que é:** Um comentário de múltiplas linhas.
- Não afeta a execução do código, apenas ajuda na manutenção.
---

### **3. `User Function BIBLIOTECA`**
- **O que é:** Declaração de uma função de usuário no ADVPL.
- **Para que serve:**
    - Define um ponto de entrada chamado `BIBLIOTECA`.
    - Esse nome será usado para chamar a função dentro do sistema Protheus.
    - O prefixo `U_` (em `U_Biblioteca`) é um padrão para funções de usuário, facilitando a organização e evitando conflito com funções nativas.
---

### **4. `Alert("Esta funcao esta na BIBLIOTECA TOTVS.CH")`**
- **O que é:** Um comando que exibe uma mensagem na tela (caixa de diálogo).
- **Para que serve:**
    - Mostrar informações ao usuário.
    - Aqui, é apenas um teste para provar que a função `Alert()` está disponível graças ao `#INCLUDE "TOTVS.CH"`.
---
### **5. `Return`**
- **O que é:** Instrução que finaliza a função.
- **Para que serve:**
    - Indica ao compilador que a função terminou.
    - Em ADVPL, mesmo que não retorne um valor, o `Return` é obrigatório para encerrar corretamente.



