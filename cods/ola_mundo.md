## Código 1 – para olá mundo

- Nome do arquivo = SISTEM1
```tlpp
#include "Protheus.ch"
#include "Totvs.ch"

User Function SISTEM1()

	MsgInfo("Olá Mundo","Saudacoes")

return
```


- **Nome do arquivo = `SISTEM1` (convenção)**
    - **O que é:** nome do arquivo fonte (normalmente `SISTEM1.prw` no repositório ADVPL).
    - **Por que usar:** manter nome do arquivo igual ao nome da função facilita organização e chamadas a partir do Protheus.
    - **Quando usar:** sempre que criar uma rotina nova — escolha nomes descritivos e consistentes com o padrão do projeto.
        
- **`#include "Protheus.ch"`**
    - **O que é:** arquivo de cabeçalho (.ch) com constantes, macros e declarações específicas do Protheus.
    - **Por que usar:** disponibiliza funções e símbolos usados pelo ERP; sem ele muitas funções padrão não são reconhecidas.
    - **Quando usar:** praticamente em todo programa que interaja com o ambiente Protheus (menus, mensagens, cadastros, relatórios).
        
- **`#include "Totvs.ch"`**
    - **O que é:** outro header com macros, definições e utilitários fornecidos pela TOTVS.
    - **Por que usar:** complementa `Protheus.ch` com definições gerais e compatibilidade entre versões.
    - **Quando usar:** quase sempre junto com `Protheus.ch`; é prática comum incluir os dois no começo do arquivo.
        
- **`User Function SISTEM1()`**
    - **O que é:** declaração da função de usuário chamada `SISTEM1` (ponto de entrada da rotina).
    - **Por que usar:** `User Function` cria uma rotina que pode ser chamada pelo Protheus (menus, botões, customizações).
    - **Quando usar:** sempre que precisar de uma rotina invocável pelo sistema; escolha `User Function` para rotinas que devem ser acessíveis externamente.
        
- **Nome da função igual ao nome do arquivo (boa prática)**
    - **O que é:** padrão comum em projetos ADVPL (ex.: `SISTEM1.prw` contém `User Function SISTEM1()`).
    - **Por que usar:** facilita manutenção, localização e evita confusão ao compilar/instalar.
    - **Quando usar:** sempre que possível — segue convenções do time/projeto.
        
- **`MsgInfo("Olá Mundo","Saudacoes")`**
    - **O que é:** chamada para exibir uma caixa de mensagem informativa ao usuário.
        - 1º parâmetro: texto da mensagem.
        - 2º parâmetro: título da janela.
    - **Por que usar:** jeito rápido e padrão de mostrar informações, avisos ou resultados simples ao usuário.
    - **Quando usar:** mensagens de confirmação, alertas simples, testes/depuração ou saudações; para interações mais complexas use `MsgYesNo`, `MsgStop`, ou interfaces/formulários próprios.
        
- **`return`**
    - **O que é:** encerra a função e devolve controle ao chamador.
    - **Por que usar:** toda função em ADVPL precisa terminar corretamente; evita comportamento indefinido.
    - **Quando usar:** sempre no fim de `User Function` (e em funções quaisquer) — mesmo que não retorne valor.