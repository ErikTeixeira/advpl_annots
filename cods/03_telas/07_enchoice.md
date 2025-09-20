## 7 - Exercício
```prw
#Include 'TOTVS.CH'

/*/{Protheus.doc} U_Ench2
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao do comando Enchoice  (uma tela com vÃ¡rios campos conforme cadastro na SX3)
    @see        (https://tdn.totvs.com/pages/)
/*/


User Function Ench2
    Local cAlias
    Local nReg := 1
    Local nOpc := 1
    Local aPos
    Local aAlterEnch
    Local nModelo

    Private aCpoEnch := {"A1_COD","A1_NOME"}

    Enchoice(cAlias, nReg, nOpc, /*aCRA*/, /*cLetra*/, /*cTexto*/, aCpoEnch, aPos, aAlterEnch,nModelo,/*nColMens*/,/* cMensagem*/,/* cTudoOk*/, oDlg, lF3,lMemoria, lColumn, caTela, lNoFolder, lProperty)

Return
```


---

```advpl
#Include 'TOTVS.CH'
```

- Inclui o arquivo de cabeçalho do Protheus, **TOTVS.CH**, que contém macros, constantes e definições essenciais para funções ADVPL como `Enchoice`.
    

---

```advpl
/*/{Protheus.doc} U_Ench2
    @type		Function
    @author		Milton J.dos Santos
    @since		01/03/2020
    @version	1.0.0
    @param		Nenhum
    @return		Vazio (nil)
    @example    Exemplo da utilizacao do comando Enchoice  (uma tela com vÃ¡rios campos conforme cadastro na SX3)
    @see		(https://tdn.totvs.com/pages/)
/*/
```

- Bloco de **documentação da função**.
    
- Explica tipo, autor, versão, parâmetros, retorno e exemplo de uso.
    
- Não interfere na execução, serve apenas para referência.
    

---

```advpl
User Function Ench2
```

- Define a função **Ench2**, que será do tipo “função do usuário”.
    
- Não recebe parâmetros.
    

---

```advpl
Local cAlias
Local nReg := 1
Local nOpc := 1
Local aPos
Local aAlterEnch
Local nModelo
```

- Declara variáveis locais usadas na função:
    
    - `cAlias` → normalmente usado para indicar o **alias da tabela** que será utilizada no `Enchoice`.
        
    - `nReg := 1` → número do registro inicial (padrão 1).
        
    - `nOpc := 1` → opção inicial (padrão 1).
        
    - `aPos` → array que armazenará as posições dos campos na tela do `Enchoice`.
        
    - `aAlterEnch` → array usado para alterar valores ou comportamento dos campos no `Enchoice`.
        
    - `nModelo` → modelo da tela ou layout do `Enchoice`.
        

---

```advpl
Private aCpoEnch := {"A1_COD","A1_NOME"}
```

- Declara um **array privado** chamado `aCpoEnch` que contém os campos a serem exibidos no `Enchoice`.
    
- Aqui os campos `"A1_COD"` e `"A1_NOME"` são os que aparecerão na tela.
    

---

```advpl
Enchoice(cAlias, nReg, nOpc, /*aCRA*/, /*cLetra*/, /*cTexto*/, aCpoEnch, aPos, aAlterEnch,nModelo,/*nColMens*/,/* cMensagem*/,/* cTudoOk*/, oDlg, lF3,lMemoria, lColumn, caTela, lNoFolder, lProperty)
```

- Essa é a **chamada principal** do comando `Enchoice`.
    
- `Enchoice` é usado para abrir uma **tela de seleção de registros** do banco, exibindo múltiplos campos (como uma grade ou mini-formulário).
    

**Parâmetros importantes usados aqui:**

1. `cAlias` → alias da tabela.
    
2. `nReg` → registro inicial.
    
3. `nOpc` → opção inicial.
    
4. `aCpoEnch` → array de campos que aparecerão na tela (`"A1_COD"`, `"A1_NOME"`).
    
5. `aPos` → recebe a posição de cada campo na tela.
    
6. `aAlterEnch` → permite alterar valores ou propriedades de cada campo.
    
7. `nModelo` → layout/modelo do `Enchoice`.
    
8. Outros parâmetros (`oDlg`, `lF3`, `lMemoria`, etc.) → permitem configurar o diálogo, comportamento de teclas, memória, colunas, e propriedades adicionais.
    

- Os parâmetros comentados `/*...*/` indicam que **não estão sendo usados no momento**.
    
- O `Enchoice` exibe uma tela interativa com os registros, e o usuário pode selecionar ou consultar informações conforme os campos definidos.
    

---

```advpl
Return ""
```

- Finaliza a função retornando vazio (`nil`).
    
- A função não retorna nenhum valor específico; ela apenas exibe a tela de seleção (`Enchoice`).
    

---

✅ **Resumo do funcionamento:**

1. Declara variáveis locais e um array com os campos que serão exibidos.
    
2. Chama o comando `Enchoice` para abrir uma **tela de seleção de registros**, usando os campos definidos (`A1_COD` e `A1_NOME`).
    
3. O usuário interage com a tela, podendo consultar e selecionar registros.
    
4. A função termina sem retornar nenhum valor específico.
---
### **Parâmetros obrigatórios**

1. **`cAlias`**

    - Alias da tabela que será usada na tela.
        
    - Ex: `"SA1"` (clientes), `"SB1"` (fornecedores).
        
    - É o ponto de referência para o `Enchoice` saber de onde puxar os registros.
        
2. **`nReg`**
    
    - Registro inicial que será exibido na tela.
        
    - Geralmente `1` para começar do primeiro registro.
        
3. **`nOpc`**
    
    - Define a **opção inicial de navegação ou seleção**.
        
    - Exemplo: `1` para seleção simples, `2` para consulta detalhada.
        
4. **`aCRA`** _(comentado no código)_
    
    - Array de campos para **ordenar ou filtrar registros**.
        
    - Pode ser usado para definir regras de pesquisa.
        
5. **`cLetra`** _(comentado no código)_
    
    - Uma letra usada para **pesquisa rápida**.
        
    - Ex: `"A"` para mostrar registros que começam com “A”.
        
6. **`cTexto`** _(comentado no código)_
    
    - Texto inicial ou filtro para pesquisa.
        
    - Pode ser usado para pré-selecionar registros que contenham uma palavra.
        
7. **`aCpoEnch`**
    
    - Array de campos que aparecerão na tela.
        
    - Exemplo: `{"A1_COD","A1_NOME"}` → exibe código e nome do cliente.
        
8. **`aPos`**
    
    - Array que recebe **as posições dos campos na tela**.
        
    - Pode ser usado depois para manipular ou recuperar dados do layout do `Enchoice`.
        
9. **`aAlterEnch`**
    
    - Array usado para **alterar valores, propriedades ou comportamento de campos**.
        
    - Ex: desabilitar edição de determinado campo ou pré-preencher valores.
        
10. **`nModelo`**
    
    - Define o **layout ou modelo** do Enchoice.
        
    - Alguns modelos já vêm com padrão de tela do Protheus (grade simples, detalhada, etc.).
        

---

### **Parâmetros comentados (opcionais)**

11. **`nColMens`**
    
    - Número de colunas que exibem mensagens ou instruções na tela.
        
    - Pode ser usado para mostrar dicas de uso do `Enchoice`.
        
12. **`cMensagem`**
    
    - Texto de mensagem ou instrução que será exibido na tela.
        
    - Ex: `"Selecione o cliente desejado"`.
        
13. **`cTudoOk`**
    
    - Mensagem que aparece quando todas as validações da tela são aprovadas.
        
    - Ex: `"Cadastro validado"`.
        
14. **`oDlg`**
    
    - Se você quiser integrar o `Enchoice` dentro de um **dialog existente**.
        
    - Permite que a tela seja parte de uma janela maior.
        
15. **`lF3`**
    
    - Booleano (`.T.` ou `.F.`) que define se a tecla **F3** pode ser usada para sair ou cancelar.
        
16. **`lMemoria`**
    
    - Booleano para habilitar ou desabilitar **memória de posição** (ou seja, lembrar a última linha/registro exibido).
        
17. **`lColumn`**
    
    - Define se a tela terá **colunas automáticas** ou se seguirá o layout manual.
        
18. **`caTela`**
    
    - Array com parâmetros de **tela**, como tamanho ou posição.
        
    - Ex: definir largura/altura da janela.
        
19. **`lNoFolder`**
    
    - Booleano para habilitar/desabilitar **pastas virtuais** no Enchoice.
        
20. **`lProperty`**
    
    - Booleano que define propriedades extras do Enchoice, como **readonly** ou **visível**.

---


