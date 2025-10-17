#include "TOTVS.CH"

User Function msBrGet()

    Local aArea      := FWGetArea()


    Local aDados := {}
    Local oBrowse := Nil
    Local oBtnSair

    DBSelectArea("SA1")

    SA1->(DBSetOrder(1))

    // Percorre todos os clientes e adiciona no array
    DbGoTop()
    While !Eof()
        AAdd(aDados, {SA1->A1_FILIAL, SA1->A1_COD, SA1->A1_NOME, SA1->A1_END})
        DbSkip()
    EndDo

    // Cria o diálogo
    Define Dialog oDlg Title "Clientes SA1" From 0,0 To 500,700 PIXEL

        // Cria browse
        oBrowse := MsBrGetDBase():New( 5, 15, 300, 200,,,, oDlg,,,,,,,,,,,, .F., "", .T.,, .F.,,, )

        // Define vetor para a browse
        oBrowse:SetArray(aDados)

        // Cria colunas do browse
        oBrowse:AddColumn( TCColumn():New("Filial",  { || aDados[oBrowse:nAt,1] },,,, "LEFT") )
        oBrowse:AddColumn( TCColumn():New("Código", { || aDados[oBrowse:nAt,2] },,,, "LEFT") )
        oBrowse:AddColumn( TCColumn():New("Nome",   { || aDados[oBrowse:nAt,3] },,,, "LEFT") )
        oBrowse:AddColumn( TCColumn():New("Endereço",{ || aDados[oBrowse:nAt,4] },,,, "LEFT") )

        oBrowse:Refresh()

        @220,240 BUTTON oBtnSair PROMPT "Fechar Tela" SIZE 60,20 PIXEL ACTION ( oDlg:End() )


    Activate Dialog oDlg CENTER

    DbCloseArea()

    FWRestArea(aArea)

Return
