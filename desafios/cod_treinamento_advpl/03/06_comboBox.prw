#INCLUDE "TOTVS.CH"

User Function comboBoxEx()

    Local oDlg, oSay, oCbo, oBtnSair
    Local aArea := FWGetArea()
    Local aItens := {"Item 1", "Item 2", "Item 3", "Item 4"}
    Local cOpcao := aItens[1] 

    DEFINE MSDIALOG oDlg TITLE "Tela Customizada" FROM 0, 0 TO 400, 600 PIXEL

        @ 20, 10 SAY oSay PROMPT "Selecione uma Item:" SIZE 100, 15 PIXEL OF oDlg

        @ 20, 90 MSCOMBOBOX oCbo VAR cOpcao ITEMS aItens SIZE 50, 100 PIXEL OF oDlg

        @170,230 BUTTON oBtnSair PROMPT "Botão para sair" SIZE 60,20 PIXEL ACTION (oDlg:End())


    ACTIVATE MSDIALOG oDlg CENTERED

    FWRestArea(aArea)

Return NIL
