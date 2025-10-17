#INCLUDE "TOTVS.CH"



User Function folderEx()

    Local oFolder1
    Local oBtnSair
    Private oDlg

    DEFINE DIALOG oDlg TITLE "Tela Personalizada" FROM 0,0 TO 400,600 PIXEL

    @ 1,1 FOLDER oFolder1 PROMPT "Pasta 1", "Pasta 2", "Pasta 3", "Pasta 4", "Pasta 5" SIZE 200, 150 OF oDlg

    @170,230 BUTTON oBtnSair PROMPT "Botão para sair" SIZE 60,20 PIXEL ACTION (oDlg:End())

    ACTIVATE DIALOG oDlg CENTER
Return Nil


