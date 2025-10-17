#INCLUDE "TOTVS.ch"



User Function axCadFor()

    Local aArea := FWGetArea()

    // Seleciona o alias SA2 (Fornecedores)
    DbSelectArea("SA2")
    DbSetOrder(1)
    DbGoTop()


    AxCadastro("SA2", "Cadastro de Fornecedores -")

    FWRestArea(aArea)

Return Nil
