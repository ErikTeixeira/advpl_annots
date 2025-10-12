#INCLUDE "TOTVS.ch"





User Function paramDificil(cValMoeda, cCodigo)

    Local nMoeda
    Local nMoedaFinal

    nMoeda := Val(cValMoeda)


    If cCodigo == "USD"
        nMoedaFinal := nMoeda * 5.50

    ElseIf cCodigo == "EUR"
        nMoedaFinal := nMoeda * 6

    Else 
        nMoedaFinal := nMoeda
    EndIf

    Alert("Valor convertido: " + Transform(nMoedaFinal, "@E 9999999.99") )

Return Nil
