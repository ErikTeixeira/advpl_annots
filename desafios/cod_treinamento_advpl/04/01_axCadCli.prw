#INCLUDE "TOTVS.ch"



User Function axCadCli()

    Local aArea := FWGetArea()

    // Seleciona o alias SA1 (clientes)
    DbSelectArea("SA1")
    DbSetOrder(1)
    DbGoTop()


    AxCadastro("SA1", "Cadastro de Clientes -")

    FWRestArea(aArea)

Return Nil
