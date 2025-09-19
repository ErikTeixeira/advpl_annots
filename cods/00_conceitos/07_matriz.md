## 07 - Exercício
```prw
#Include "TOTVS.CH"


/*
   Programa.: Matriz.PRW
   Funcao...: U_Matriz()
   Autor....: Milton J.dos Santos
   Data.....: 01/01/2020
   Descricao: Exemplo de usos de variaveis do tipo matriz

   Matrizes ou vetores sao uteis para conjuntos de dados

*/

// Mostrando uma Array ( Matriz ou Vetor ) Comum

User Function Matriz()

   Local aArray := {"Joao", "Alberto", "Pedro", "Maria"}

   Alert( aArray[1] )
   Alert( aArray[2] )
   Alert( aArray[3] )
   Alert( aArray[4] )

Return Nil
```

- O programa mostra o uso de **variáveis do tipo matriz (array ou vetor)** em ADVPL.
    
- No `User Function Matriz()`, é criada a variável **aArray**, que é um vetor com 4 nomes: `{"Joao", "Alberto", "Pedro", "Maria"}`.
    
- Diferente de muitas linguagens, em ADVPL os vetores começam no **índice 1** (não no 0, como em Java ou Python).
    
- Em seguida, o código exibe os elementos da matriz com `Alert()`, um por vez:
    - `aArray[1]` → "Joao"
    - `aArray[2]` → "Alberto"
    - `aArray[3]` → "Pedro"
    - `aArray[4]` → "Maria"
        
- Por fim, a função retorna `Nil` (sem valor útil).

