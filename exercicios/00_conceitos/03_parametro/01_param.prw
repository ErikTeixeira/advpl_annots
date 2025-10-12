#INCLUDE "TOTVS.ch"


/*
Médio

Crie uma função U_MensagemPadrao() que receba um parâmetro opcional cNome.
Se o parâmetro for vazio, mostre "Olá, usuário!"; caso contrário, mostre "Olá, <nome>!".
*/


User Function paramMedio(cNome)

    if Empty(cNome)

        Alert("Olá, usuário")
    else
        Alert("Olá, "+cNome)
    endif

Return Nil
