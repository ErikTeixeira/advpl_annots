#INCLUDE "TOTVS.ch"


/*
Fácil

Crie uma função U_Soma() que receba dois parâmetros numéricos e retorne a soma deles.
*/


// tem que passar os parametros assim ----->  "1","2"
User Function paramFacil(num1, num2)

    Local nume1
    Local nume2

    nume1 = val(num1)
    nume2 = val(num2)

    Alert("A soma é "+ Str(nume1 + nume2))

Return Nil
