## 06 Exercício
```prw
#Include "TOTVS.CH"

/*
   Programa.: Repeticao.PRW
   Autor....: Milton J.dos Santos
   Data.....: 01/01/2020
   
   
   Descricao: Exemplo de estrutura de repeticao

   Esta estrutura sao chamadas de "Lacos de repeticao"

   Funcao...: Exemplo FOR  : U_FOR1,U_FOR2,U_FOR3,U_FOR4

              Exemplo WHILE: U_WHILE1,U_WHILE2
*/

/*/
    Exemplo de FOR mostrando um alerta
/*/

User Function For1()

    Local i

    For i := 1 To 10

        MsgAlert(i)

    Next
    
Return


/*/
    Exemplo de FOR contando de 2 em 2, forcando a saida da repeticao
/*/

  

User Function For2()

    Local i

    Local nIni, nFim

    nIni := 100

    nFim := 120

    For i := nIni To nFim Step 2

        MsgAlert(i)
        If i > 110

            Exit      // Break tambem encerra.
        EndIf

    Next

Return

/*/
    Exemplo de FOR contagem regressiva mostrando mensagem
/*/

User Function For3()

    Local i

    Local nIni, nFim

    nIni := 1

    nFim := 10

    For i := nFim To nIni Step -1

        MsgAlert(i)
    Next

Return

/*/
    Exemplo de FOR em cascata
/*/

User Function For4()

    Local i

    Local j

    For i := 20 To 25

        MsgAlert("i=" + Str(i))

        For j := 1 To 5

            MsgAlert("i=" + Str(i) + "   j=" + Str(j))
        Next

    Next

Return

/*
    While permite repetir de forma condicional
*/

User Function While1()

    Local nCnt := 1

    Do While nCnt <= 10

        nCnt := nCnt * nCnt

        nCnt++
    Enddo

    MsgAlert(nCnt)

Return

/*
    A mesma funcao tambem pode ser escrita da seguinte forma
*/

User Function While2()

    Local nCnt := 1

    While nCnt <= 10

        nCnt := nCnt * nCnt

        nCnt++
    End

    MsgAlert(nCnt)

Return
```


### **1. For1()**
- `For i := 1 To 10` → executa o bloco de código **10 vezes**, de 1 até 10.
- Cada vez mostra `MsgAlert(i)`.  
    📌 Resultado: aparece uma janela mostrando os números de **1 a 10**.
---

### **2. For2()**
- Vai de `100` até `120`, mas com passo de **2 em 2** (`Step 2`).
- Ou seja: 100, 102, 104...
- Se o valor de `i` passar de **110**, usa `Exit` (ou `Break`) para **encerrar antes do fim**.  
    📌 Resultado: mostra **100, 102, 104, 106, 108, 110, 112** e para.
---

### **3. For3()**

- Faz uma **contagem regressiva**, de `10 até 1`, porque usa `Step -1`.  
    📌 Resultado: aparece os números **10 até 1**.
    

---

### **4. For4()**
- Dois **loops em cascata (aninhados)**:
    - O `i` vai de 20 até 25.
    - Para cada valor de `i`, o `j` roda de 1 até 5.
- Mostra mensagens indicando os dois valores (`i` e `j`).  
    📌 Resultado: exemplo típico de **loop duplo**, útil para tabelas ou combinações.
---

### **5. While1()**
- Declara `nCnt = 1`.
- Enquanto `nCnt <= 10`, multiplica `nCnt * nCnt` e depois incrementa (`nCnt++`).
- Sai quando a condição não for mais verdadeira.  
    📌 No fim mostra o valor final de `nCnt`.
---

### **6. While2()**
- Faz a mesma coisa que o anterior, mas usando a forma reduzida (`While ... End`).  
    📌 Mesma lógica do While1.
