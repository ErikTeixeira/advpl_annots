#INCLUDE "TOTVS.ch"


/*
Difícil

Faça uma User Function U_CadeiaChamadas() que chame uma Static Function Nivel1(), 
que chama Nivel2(), que chama Nivel3(),
e cada nível mostre um Alert() indicando em qual está (“Executando Nível 1”, “Executando Nível 2”...).
*/


User Function funcaoDificil()

    umNivel()

Return Nil



Static Function umNivel()
    Alert("Primeiro Nível")

    doisNivel()
Return Nil

Static Function doisNivel()
    Alert("Segundo Nível")

    tresNivel()
Return Nil

Static Function tresNivel()
    Alert("Terceiro Nível")
Return Nil
