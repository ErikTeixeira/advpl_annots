#INCLUDE "TOTVS.ch"

User Function twCheckBoxEx()
    
    Local oDlg, oBrowse, oBtnSair
    Local aBrowse := {}
    Local oChecked := LoadBitmap(GetResources(),'LBOK')      // Checkbox marcado
    Local oUncheck := LoadBitmap(GetResources(),'LBNO')      // Checkbox desmarcado
    
    DEFINE MsDialog oDlg TITLE "Exemplo TWBrowse" FROM 180,180 TO 550,700 PIXEL
        
    oBrowse := TWBrowse():New( 01 , 01, 260,184,,{'Ok','Codigo','Descrição', 'Bairro'},{20,30,30},;
        oDlg,,,,,{||},,,,,,,.F.,,.T.,,.F.,,, )
        
    aBrowse := {  {.T.,'CLIENTE 001','RUA CLIENTE 001','BAIRRO CLIENTE 001'},;
                  {.F.,'CLIENTE 002','RUA CLIENTE 002','BAIRRO CLIENTE 002'},;
                  {.T.,'CLIENTE 003','RUA CLIENTE 003','BAIRRO CLIENTE 003'} }
        
    oBrowse:SetArray(aBrowse)
    
    oBrowse:bLine := {||{If(aBrowse[oBrowse:nAt,01],oChecked,oUncheck),aBrowse[oBrowse:nAt,02],;
        aBrowse[oBrowse:nAt,03],aBrowse[oBrowse:nAt,04] } }
        
    // Troca o estado do checkbox no duplo click do mouse
    oBrowse:bLDblClick := {|| aBrowse[oBrowse:nAt][1] := !aBrowse[oBrowse:nAt][1],;
        oBrowse:DrawSelect()}
    
    @150,190 BUTTON oBtnSair PROMPT "Fechar Tela" SIZE 60,20 PIXEL ACTION ( oDlg:End() )
    
    ACTIVATE MsDialog oDlg CENTERED

Return
