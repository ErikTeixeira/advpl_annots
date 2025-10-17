#INCLUDE "TOTVS.CH"

User Function funcPadraoEx()
    Local aArea      := FWGetArea()
    
    
    Local oDlg
    Local oBtnSair
    Local oGetCliente
    Local cCliente := space(10)
    
    DBSelectArea("SA1")

    SA1->(DBSetOrder(1))
    
    DEFINE MSDIALOG oDlg TITLE "Tela Customizada" FROM 0,0 TO 400,600 PIXEL

      @ 020,010 SAY "Cliente: " OF oDlg PIXEL
        @ 020,050 MSGET oGetCliente VAR cCliente F3 "SA1" OF oDlg PIXEL SIZE 120,12 ;
            VALID (oGetCliente:Refresh(), .T.) HASBUTTON
        
    
    @170,230 BUTTON oBtnSair PROMPT "Botão para sair" SIZE 60,20 PIXEL ACTION (oDlg:End())

    ACTIVATE MsDialog oDlg CENTER


    FWRestArea(aArea)
Return ""
    
