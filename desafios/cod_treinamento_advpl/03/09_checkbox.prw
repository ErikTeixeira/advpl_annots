#INCLUDE "TOTVS.CH"



User Function checkBoxEx()

    Local oDlg, oBtnSair, oChkBox1, oChkBox2, oChkBox3
    Local lCheck1 := .F., lCheck2 := .F., lCheck3 := .F.


    DEFINE MSDIALOG oDlg TITLE "Tela Customizada" FROM 0,0 TO 400,600 PIXEL

    @10,10 CHECKBOX oChkBox1 VAR lCheck1 PROMPT "CheckBox1" SIZE 100,30 OF oDlg PIXEL
    @20,10 CHECKBOX oChkBox2 VAR lCheck2 PROMPT "CheckBox2" SIZE 100,30 OF oDlg PIXEL
    @30,10 CHECKBOX oChkBox3 VAR lCheck3 PROMPT "CheckBox3" SIZE 100,30 OF oDlg PIXEL


    @170,230 BUTTON oBtnSair PROMPT "Fechar Tela" SIZE 60,20 PIXEL ACTION ( oDlg:End() )

    ACTIVATE MSDIALOG oDlg CENTER

Return Nil
