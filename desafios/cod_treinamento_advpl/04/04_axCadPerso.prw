#INCLUDE "TOTVS.ch"



User Function axCadPer()
    Local aArea := FWGetArea()
    
    Private aRotina := MenuDef()
    Private cCadastro := "Cadastro de Clientes"
    
    // Seleciona o alias SA1 (Clientes)
    DbSelectArea("SA1")
    SA1->(DbSetOrder(1))
    SA1->(DbGoTop())
    
    mBrowse(6, 1, 22, 75, "SA1", cCadastro)
    
    FWRestArea(aArea)
Return Nil



Static Function MenuDef()
    Local aRotina := {}
    
    // Menu de navegação personalizado
    aAdd(aRotina, {"Inicio",                "U_IrInicio",       0, 1})
    aAdd(aRotina, {"Fim",                   "U_IrFim",          0, 2})
    aAdd(aRotina, {"Ir Para",               "U_IrPara",         0, 3})
    aAdd(aRotina, {"Próximo Registro",      "U_ProxReg",        0, 4})
    aAdd(aRotina, {"Registro Anterior",     "U_RegAnt",         0, 5})
    aAdd(aRotina, {"Num. Registro Atual",   "U_NumRegAtual",    0, 6})
    aAdd(aRotina, {"Total de Registros",    "U_TotalReg",       0, 7})
    aAdd(aRotina, {"Muda Ordem Pesquisa",   "U_MudaOrdem",      0, 8})
    
Return aRotina


User Function IrInicio()
    SA1->(DbGoTop())

    MsgInfo("Primeiro registro posicionado!", "Inicio")
Return Nil


User Function IrFim()
    SA1->(DbGoTo(-1))
    MsgInfo("Último registro posicionado!", "Fim")
Return Nil


User Function IrPara()
    Local oDlg, oGet
    Local nReg := 10

    DEFINE MSDIALOG oDlg TITLE "Ir Para Registro" FROM 0, 0 TO 140, 200 PIXEL
        @ 10, 10 SAY "Número do registro:" SIZE 80, 10 PIXEL OF oDlg
        @ 20, 10 MSGET nReg SIZE 50, 10 PIXEL OF oDlg
        @ 40, 10 BUTTON "OK" SIZE 40, 12 PIXEL ACTION (SA1->(DbGoTo(nReg)), oDlg:End()) OF oDlg
    ACTIVATE MSDIALOG oDlg CENTERED

    MsgInfo("Posicionado no registro " + cValToChar(SA1->(Recno())), "Ir Para")
Return Nil


User Function ProxReg()

    If !SA1->(Eof())
        SA1->(DbSkip())

        If SA1->(Eof())

            MsgAlert("Você já está no último registro!", "Atenção")
            SA1->(DbGoBottom())
        EndIf
    EndIf

Return Nil


User Function RegAnt()

    If !SA1->(Bof())
        SA1->(DbSkip(-1))

        If SA1->(Bof())

            MsgAlert("Você já está no primeiro registro!", "Atenção")
            SA1->(DbGoTop())
        EndIf
    EndIf

Return Nil


User Function NumRegAtual()

    Alert("Codigo: "+ SA1->(A1_COD)+", Nome: "+ SA1->(A1_NOME))

Return Nil


User Function U_TotalReg()
    Local nTot := SA1->(LastRec())
    MsgInfo("Total de registros: " + cValToChar(nTot), "Total")
Return Nil


User Function MudaOrdem()

    SA1->(DbSetOrder())

Return Nil



