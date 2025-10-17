#INCLUDE "TOTVS.CH"

User Function tMultiGetEx()
    Local oDlg, oMemo
    Local cTexto := "Digite aqui um texto com várias linhas..."
    Local oBtnTexto, oBtnSair
    
    DEFINE MSDIALOG oDlg TITLE "Tela Customizada" FROM 0, 0 TO 400, 600 PIXEL
        
        @ 10, 10 SAY "Observa��es:" SIZE 80, 10 PIXEL OF oDlg
        
        /*
        {|u| If(PCount()>0, cTexto:=u, cTexto)} → Bloco de código que define o valor do campo;
        Se receber um parâmetro (PCount()>0), atualiza a variável cTexto;
        Caso contrário, apenas retorna o valor atual de cTexto.
        */

        oMemo := TMultiGet():New( 25, 10, {|u| If(PCount()>0, cTexto:=u, cTexto)}, ;
                                  oDlg, 130, 50, , , , , , .T. )
        
        @ 80, 10 BUTTON oBtnTexto PROMPT "Botão para sair" SIZE 60, 20 PIXEL ;
                 ACTION (Alert(cTexto))

        @170,230 BUTTON oBtnSair PROMPT "BotÃ£o para sair" SIZE 60,20 PIXEL ACTION (oDlg:End())
        
    
    ACTIVATE MSDIALOG oDlg CENTERED

Return NIL
