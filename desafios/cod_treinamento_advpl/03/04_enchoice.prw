
#Include 'TOTVS.CH'

/*/{Protheus.doc} U_Ench2
    @type		Function
    @author		Milton J.dos Santos
    @since		01/03/2020
    @version	1.0.0
    @param		Nenhum
    @return		Vazio (nil)
    @example    Exemplo da utilizacao do comando Enchoice  (uma tela com v√°rios campos conforme cadastro na SX3)
    @see		(https://tdn.totvs.com/pages/)
/*/

User Function enchoiceEx()
    Local oDlg
    Local oBtnSair
    Local cAlias := "SA1"
    Local nReg := 1
    Local nOpc := 1
    Local aPos := {0,0,0,0}
    Local aAlterEnch := {}
    Local nModelo := 3
    Private aCpoEnch := {"A1_COD","A1_NOME"}

    Define MsDialog oDlg TITLE "Tela Customizada" FROM 0,0 TO 400,600 PIXEL

    Enchoice(cAlias, nReg, nOpc, /*aCRA*/, /*cLetra*/, /*cTexto*/, aCpoEnch, aPos, aAlterEnch, nModelo,/*nColMens*/,/* cMensagem*/,/* cTudoOk*/, oDlg, /*lF3*/, /*lMemoria*/, /*lColumn*/, /*caTela*/, /*lNoFolder*/, /*lProperty*/)

    @170,230 BUTTON oBtnSair PROMPT "Bot„o para sair" SIZE 60,20 PIXEL ACTION (oDlg:End())


    ACTIVATE MsDialog oDlg CENTER

Return
