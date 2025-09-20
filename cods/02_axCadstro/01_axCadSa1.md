## 1 - Exercício
```prw
#INCLUDE "TOTVS.CH"

/*

    Exemplo de AxCadastro - Modelo 1 (Uma unica tabela)

    Este comando permite, sem muito esforÃ§o de programaÃ§Ã£o, fazer a gestÃ£o de uma btabela.

    Este exemplo acessa tabela no banco de dados e por isso deve ser executado via SmartClient.

*/

  
User Function AxCadSA1()

    AxCadastro("SA1", "Cadastro de Clientes")  

Return
```

## O que é o **AxCadastro**?

O `AxCadastro()` é uma função pronta do Protheus que serve para criar uma **tela de manutenção (CRUD)** de cadastros de forma **automática**, sem precisar programar todos os detalhes da interface.

Com **poucas linhas**, você consegue abrir uma tela que permite:
- **Incluir**
- **Alterar**
- **Excluir**
- **Consultar**

registros de uma tabela do banco de dados do Protheus.

---
## ⚙️ Sintaxe básica

`AxCadastro( <cTabela>, <cTitulo> )`

### 🔹 Parâmetros:
- **cTabela** → Código da tabela no banco de dados (ex: `"SA1"` = clientes, `"SB1"` = produtos, etc).
- **cTitulo** → Texto que aparecerá como título da tela de cadastro.
---

## 📌 O que o código faz?
```prw
User Function AxCadSA1()

    AxCadastro("SA1", "Cadastro de Clientes")  

Return
```
	
➡️ Esse código abre automaticamente uma tela de cadastro para a tabela **SA1** (clientes).  
Na tela o usuário poderá incluir, alterar, excluir e consultar clientes.

O título exibido na tela será **"Cadastro de Clientes"**.

---
## ⚠️ Observações importantes:

1. Esse comando **precisa ser executado no SmartClient** porque ele abre uma **tela gráfica de cadastro** (não funciona só no servidor).
    
2. O `AxCadastro` é um **atalho**:
    - Você não precisa montar a tela manualmente.
    - O Protheus já entende os **campos da tabela** e gera a interface.
        
3. Existem **outros modelos** do `AxCadastro` para casos mais complexos (ex.: cadastro que envolve várias tabelas relacionadas).

---

## ✅ Quando usar?

- Quando você precisa disponibilizar uma tela simples de **manutenção de tabela** para o usuário.
- Muito útil para **cadastros padrões** (clientes, fornecedores, produtos, etc.), sem necessidade de programar telas personalizadas.

---
👉 Em resumo:  
O `AxCadastro("SA1", "Cadastro de Clientes")` abre uma **tela pronta de cadastro de clientes** usando a tabela SA1, facilitando a manutenção dos dados no Protheus sem esforço de programação.

