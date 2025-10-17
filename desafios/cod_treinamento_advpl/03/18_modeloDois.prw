#include 'totvs.ch'
 


User function modeloDois()
    Local oDlg, oBtnSair 
    Local oPanel1, oPanel2, oPanel3
        
    DEFINE DIALOG oDlg TITLE "Tela Personalizada" FROM 0,0 TO 300,600 PIXEL
    
    @5,220 BUTTON oBtnSair PROMPT "Sair" SIZE 60,20 PIXEL ACTION ( oDlg:End() )

    @ 28,10 MSPANEL oPanel1 COLORS CLR_BLACK,CLR_HGRAY SIZE 275, 30 OF oDlg

    @ 12,125 SAY "Cabecalho" OF oPanel1 PIXEL

    @ 62,10 MSPANEL oPanel2 COLORS CLR_BLACK,CLR_HGRAY SIZE 275, 30 OF oDlg

    @ 12,125 SAY "Detalhe" OF oPanel2 PIXEL

    @ 97,10 MSPANEL oPanel3 COLORS CLR_BLACK,CLR_HGRAY SIZE 275, 30 OF oDlg

    @ 12,125 SAY "Rodape" OF oPanel3 PIXEL

    ACTIVATE DIALOG oDlg CENTER
 
Return Nil
