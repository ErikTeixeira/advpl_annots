#INCLUDE "TOTVS.ch"


/*
F�cil

Crie uma fun��o U_Soma() que receba dois par�metros num�ricos e retorne a soma deles.
*/


// tem que passar os parametros assim ----->  "1","2"
User Function paramFacil(num1, num2)

    Local nume1
    Local nume2

    nume1 = val(num1)
    nume2 = val(num2)

    Alert("A soma � "+ Str(nume1 + nume2))

Return Nil
