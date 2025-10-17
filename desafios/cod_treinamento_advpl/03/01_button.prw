#INCLUDE "TOTVS.CH"



User Function buttonEx()

    Local oBtnSair
    Private oDlg

    DEFINE MSDIALOG oDlg TITLE "Tela Customizada" FROM 0,0 TO 400,600 PIXEL

    @170,190 BUTTON oBtnSair PROMPT "Botão para sair" SIZE 80,20 PIXEL ACTION (oDlg:End())

    ACTIVATE MSDIALOG odlg CENTERED
Return Nil

