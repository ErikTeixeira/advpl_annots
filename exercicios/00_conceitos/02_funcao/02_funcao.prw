#INCLUDE "TOTVS.ch"


/*
Dif�cil

Fa�a uma User Function U_CadeiaChamadas() que chame uma Static Function Nivel1(), 
que chama Nivel2(), que chama Nivel3(),
e cada n�vel mostre um Alert() indicando em qual est� (�Executando N�vel 1�, �Executando N�vel 2�...).
*/


User Function funcaoDificil()

    umNivel()

Return Nil



Static Function umNivel()
    Alert("Primeiro N�vel")

    doisNivel()
Return Nil

Static Function doisNivel()
    Alert("Segundo N�vel")

    tresNivel()
Return Nil

Static Function tresNivel()
    Alert("Terceiro N�vel")
Return Nil
