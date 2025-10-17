#INCLUDE "TOTVS.CH"


User Function dataEx()

    Local oDlg, oSay, oBtnSair, oGet
    Local dGet := Date()
    
    DEFINE MSDIALOG oDlg TITLE "Tela Customizada" FROM 0,0 TO 400,600 PIXEL

    @10,10 SAY oSay PROMPT "Seleciona a Data: " SIZE 100,10 PIXEL

    @10,70 MSGET oGet VAR dGet PICTURE "@D" SIZE 60,10 PIXEL OF oDlg

    @170,230 BUTTON oBtnSair PROMPT "Botão para sair" SIZE 60,20 PIXEL ACTION (oDlg:End())


    ACTIVATE MSDIALOG oDlg CENTER

Return NIl
