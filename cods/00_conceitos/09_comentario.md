## 09 - Exercício
```prw
#INCLUDE "TOTVS.CH"

/*
    Um comentario e muito importante dentro de um programa
    Ajuda no entendimento e documentar
    E Pode ser usado das seguintes formas

    BARRA e ASTERISTICO no inicio e asteristico e barra no final
*/

// Ou iniciando com BARRA BARRA  


/*/
    {Protheus.doc} User Function Comenta
    (Exemplos de comentario na programacao)
    @type       Function
    @author     Milton J.dos Santos
    @since      01/01/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    (Examplos)
    @see (https://tdn.totvs.com/pages/)
/*/

// Comentario antes da funcao

User Function Comenta

    // Comentario antes do comando

    Alert("Rotina para demonstrar o uso do comentario") // Comentario apos um comando

Return
```

### Comentários de bloco (multi-linha)
- Esse é o **comentário de bloco tradicional**: começa com `/*` e termina com `*/`.
    
- Serve para escrever várias linhas de explicação, documentação ou até desativar temporariamente um trecho de código.

### Comentários de linha
- Esse é o **comentário de linha**: tudo que estiver depois de `//` na mesma linha será ignorado pelo compilador.
    
- Ideal para notas rápidas ou explicações curtas ao lado do código.

### Comentários de documentação (Protheus.doc)
- Esse formato especial `/*/ ... /*/` é usado para **documentação formal de funções no Protheus**.
    
- O TOTVS IDE e ferramentas como o **DocProtheus** conseguem **gerar documentação automática** a partir dessas tags (`@type`, `@author`, `@param`, etc.).
    
- Isso é útil para deixar claro **quem fez, quando, o que a função recebe e o que retorna**.

### Comentários dentro do código
- Mostra exemplos de comentários colocados **antes da função**, **antes de um comando** ou **após o comando na mesma linha**.
    
- Todos ajudam a dar **clareza** sobre a intenção do código.

---

✅ **Resumo final:**  
Esse programa mostra **todas as formas de comentar no ADVPL**:

1. **`/* ... */`** → comentário em bloco.
    
2. **`//`** → comentário em linha.
    
3. **`/*/ ... /*/`** com `{Protheus.doc}` → documentação formal que pode ser lida por ferramentas da TOTVS.
    
4. Comentários podem ser colocados **antes, dentro ou depois de comandos**.




