## 8 - Exercício
```prw
#Include "TOTVS.CH"

/*

   Programa.: UDC.PRW
   Funcao...: U_UDC
   Autor....: Milton J.dos Santos
   Data.....: 01/01/2020
   Descricao: Teste de Comandos Definidos pelo Usuario.


   UDC = User Defined Commands (Comandos definidos pelo usuario)

   Mais informações: https://tdn.totvs.com/display/tec/AdvPL+-+Compiler+Directives


*/


//  Sem o uso de constantes #define.


User Function UDC()

  Local i

  Local aArray := {{"Joao",25,.T.,"4567-9876",2}, {"Maria",30,.F.,"9517-6541",0}, {"Jose",18,.T.,"6348-7537",3}}

  For i := 1 To Len(aArray)

      MsgAlert(aArray[i, 1])
      MsgAlert(aArray[i, 4])
      MsgAlert(aArray[i, 2])
      MsgAlert(aArray[i, 3])
      MsgAlert(aArray[i, 5])

  Next

Return


// A mesma rotina, mas com o uso de UDC ( constantes #define ), interagindo com a execução da rotina.

  

#define __NOME     1
#define __IDADE    2
#define __ESTCIVIL 3
#define __FONE     4
#define __NRDEPEND 5

User Function TstUDC2()

  Local i

  Local aArray := {{"Joao",25,.T.,"4567-9876",2}, {"Maria",30,.F.,"9517-6541",0}, {"Jose",18,.T.,"6348-7537",3}}

  For i := 1 To Len(aArray)

      MsgAlert(aArray[i, __NOME    ])
      MsgAlert(aArray[i, __FONE    ])
      MsgAlert(aArray[i, __IDADE   ])
      MsgAlert(aArray[i, __ESTCIVIL])
      MsgAlert(aArray[i, __NRDEPEND])

  Next

Return

// Outra rotina usando UDC, usando constante #define porém interagindo na compilação

#define BRASIL

User Function TstUDC3()

  #IfDef BRASIL

    Local cPais
    Local cLingua
    cPais   := "Brasil"
    cLingua := "Portugues"

  #Else

    Local cPais
    cPais := "Argentina"

  #EndIf

  MsgAlert(cPais + "/" + cLingua)

Return Nil
```

### **UDCs (User Defined Commands)** em ADVPL
- Comandos e constantes que o próprio programador define usando `#define`

#### 🔹 Primeira parte – **Sem UDC**

- Aqui temos um **vetor bidimensional** (`aArray`), ou seja, uma matriz com várias informações por pessoa:
    1. Nome (String)
    2. Idade (Numérica)
    3. Estado civil (Lógico → `.T.` verdadeiro, `.F.` falso)
    4. Telefone (String)
    5. Número de dependentes (Numérico)
        
- Para acessar cada campo, ele usa o **índice numérico direto** (`aArray[i,1]`, `aArray[i,2]` etc.).
- Isso funciona, mas deixa o código **difícil de entender**, porque o programador precisa decorar qual número corresponde a cada campo.
---

#### 🔹 Segunda parte – **Com UDC (mais organizado)**
- Agora criamos **constantes nomeadas** para os índices da matriz.
- Assim, no loop

- O código fica **muito mais legível e fácil de manter**.
- Em vez de ver `aArray[i,3]`, sabemos claramente que é `__ESTCIVIL`.
---

#### 🔹 Terceira parte – **UDC com compilação condicional**

- Aqui o `#define` controla **seções do código na compilação**.
- `#IfDef` → verifica se uma constante está definida.
- Como `#define BRASIL` está no código, ele entra no **bloco do Brasil**.
- Caso não estivesse definido, cairia no `#Else`, configurando para "Argentina".
- Isso é útil quando se quer compilar um mesmo código para diferentes ambientes, países ou versões, **sem precisar alterar manualmente a lógica**.



