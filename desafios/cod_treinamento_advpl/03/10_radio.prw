#INCLUDE "TOTVS.CH"



User Function radioEx()

    Local oDlg, oBtnSair, oRadio
    Local nRadio := 1


    DEFINE MSDIALOG oDlg TITLE "Tela Customizada" FROM 0,0 TO 400,600 PIXEL

    @10,10 RADIO oRadio VAR nRadio ITEMS "Item 1", "Item 2", "Item 3" OF oDlg SIZE 100,60 PIXEL


    @170,230 BUTTON oBtnSair PROMPT "Fechar Tela" SIZE 60,20 PIXEL ACTION ( oDlg:End() )

    ACTIVATE MSDIALOG oDlg CENTER

Return Nil
