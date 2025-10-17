#include 'totvs.ch'
 


User function modeloUm()
    Local oDlg, oBtnSair 
    Local oPanel1
        
    DEFINE DIALOG oDlg TITLE "Tela Personalizada" FROM 0,0 TO 300,600 PIXEL
    
    @5,220 BUTTON oBtnSair PROMPT "Sair" SIZE 60,20 PIXEL ACTION ( oDlg:End() )

    @ 28,10 MSPANEL oPanel1 COLORS CLR_BLACK,CLR_HGRAY SIZE 275, 110 OF oDlg


    @ 52,125 SAY "Cadastro" OF oPanel1 PIXEL


    ACTIVATE DIALOG oDlg CENTER
 
Return Nil
