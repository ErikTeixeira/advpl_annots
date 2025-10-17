#include 'totvs.ch'
 
User function painelEx()
    Local oDlg    
    Local oPanel1,oPanel2
        
    DEFINE DIALOG oDlg TITLE "Tela Personalizada" FROM 0,0 TO 300,600 PIXEL
    
    @ 10,10 MSPANEL oPanel1 COLORS CLR_BLACK,CLR_HGRAY SIZE 135, 110 OF oDlg

    @ 10,155 MSPANEL oPanel2 COLORS CLR_BLACK,CLR_HGRAY SIZE 135, 110 OF oDlg

    @ 52,55 SAY "Painel 1" OF oPanel1 PIXEL
    @ 52,55 SAY "Painel 2" OF oPanel2 PIXEL

    // @ 10,155 MSPANEL oPanel2 COLORS CLR_BLACK,CLR_HGRAY PROMPT "Painel 2" SIZE 135, 110 OF oDlg
    
    ACTIVATE DIALOG oDlg CENTER
 
Return Nil
