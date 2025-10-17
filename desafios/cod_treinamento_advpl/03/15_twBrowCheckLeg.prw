#INCLUDE "TOTVS.ch"

User Function twChkLeg()
    
    Local oDlg, oBrowse, oBtnSair
    Local aBrowse := {}
    Local oChecked := LoadBitmap(GetResources(),'LBOK')      // Checkbox marcado
    Local oUncheck := LoadBitmap(GetResources(),'LBNO')      // Checkbox desmarcado
    Local oVerde   := LoadBitmap(GetResources(),'br_verde')  // Bola verde
    Local oVermelho:= LoadBitmap(GetResources(),'br_vermelho') // Bola vermelha
    
    DEFINE MsDialog oDlg TITLE "Exemplo TWBrowse - Checkbox e Bolas" FROM 180,180 TO 550,750 PIXEL
        
    oBrowse := TWBrowse():New( 01 , 01, 280,184,,{'Ok','Leg','Codigo','Descrição', 'Bairro'},{20,20,40,80,80},;
        oDlg,,,,,{||},,,,,,,.F.,,.T.,,.F.,,, )
        
    // Estrutura: {Checkbox, Status(bola), Codigo, Descrição, Bairro}
    aBrowse := {  {.T., .T., 'CLIENTE 001','RUA CLIENTE 001','BAIRRO CLIENTE 001'},;
                  {.F., .F., 'CLIENTE 002','RUA CLIENTE 002','BAIRRO CLIENTE 002'},;
                  {.T., .T., 'CLIENTE 003','RUA CLIENTE 003','BAIRRO CLIENTE 003'},;
                  {.F., .T., 'CLIENTE 004','RUA CLIENTE 004','BAIRRO CLIENTE 004'} }
        
    oBrowse:SetArray(aBrowse)
    
    // Primeira coluna: Checkbox | Segunda coluna: Bola colorida | Demais: texto
    oBrowse:bLine := {||{If(aBrowse[oBrowse:nAt,01],oChecked,oUncheck),;
                         If(aBrowse[oBrowse:nAt,02],oVerde,oVermelho),;
                         aBrowse[oBrowse:nAt,03],;
                         aBrowse[oBrowse:nAt,04],;
                         aBrowse[oBrowse:nAt,05] } }
        
    // Duplo click na primeira coluna alterna o checkbox
    oBrowse:bLDblClick := {|| If(oBrowse:nColPos == 1,;
                              (aBrowse[oBrowse:nAt][1] := !aBrowse[oBrowse:nAt][1], oBrowse:DrawSelect()),;
                              If(oBrowse:nColPos == 2,;
                                 (aBrowse[oBrowse:nAt][2] := !aBrowse[oBrowse:nAt][2], oBrowse:DrawSelect()),;
                                 Nil)) }
    
    @150,210 BUTTON oBtnSair PROMPT "Fechar Tela" SIZE 60,20 PIXEL ACTION ( oDlg:End() )
    
    ACTIVATE MsDialog oDlg CENTERED

Return
