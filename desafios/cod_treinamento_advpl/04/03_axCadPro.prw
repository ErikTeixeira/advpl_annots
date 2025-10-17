#INCLUDE "TOTVS.ch"



User Function axCadPro()

    Local aArea := FWGetArea()

    // Seleciona o alias SB1 (Produtos)
    DbSelectArea("SB1")
    DbSetOrder(1)
    DbGoTop()


    AxCadastro("SB1", "Cadastro de Produtos -")

    FWRestArea(aArea)

Return Nil
