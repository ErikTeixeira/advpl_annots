#INCLUDE "TOTVS.ch"


/*
M�dio

Crie uma fun��o U_MensagemPadrao() que receba um par�metro opcional cNome.
Se o par�metro for vazio, mostre "Ol�, usu�rio!"; caso contr�rio, mostre "Ol�, <nome>!".
*/


User Function paramMedio(cNome)

    if Empty(cNome)

        Alert("Ol�, usu�rio")
    else
        Alert("Ol�, "+cNome)
    endif

Return Nil
