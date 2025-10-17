#INCLUDE "TOTVS.ch"

User Function twBrowseEx()

    Local oDlg
    Local oBrowse, oBtnSair
    Local aBrowse

    DEFINE MSDIALOG oDlg TITLE "Tela Customizada" FROM 0,0 TO 400,600 PIXEL    

    // Cria o array com dados (sem status)
    aBrowse := { ;
        {'CLIENTE 001', 'RUA CLIENTE 001', 'BAIRRO CLIENTE 001'}, ;
        {'CLIENTE 002', 'RUA CLIENTE 002', 'BAIRRO CLIENTE 002'}, ;
        {'CLIENTE 003', 'RUA CLIENTE 003', 'BAIRRO CLIENTE 003'} }

    // Define o browse (com 3 colunas)
    oBrowse := TWBrowse():New( ;
        0, 1, 280, 164, ;
        , ;
        {'Cliente', 'Endereço', 'Bairro'}, ; // Cabeçalhos das colunas
        {40, 60, 40}, ;                     // Largura de cada coluna
        oDlg )

    // Define o array de dados no browse
    oBrowse:SetArray(aBrowse)

    // Define a forma como cada linha será exibida
    oBrowse:bLine := {|| { ;
        aBrowse[oBrowse:nAt, 1], ; // Cliente
        aBrowse[oBrowse:nAt, 2], ; // Endereço
        aBrowse[oBrowse:nAt, 3]  ; // Bairro
    } }

    @170,230 BUTTON oBtnSair PROMPT "Sair" SIZE 60,20 PIXEL ACTION ( oDlg:End() )

    ACTIVATE MSDIALOG oDlg CENTERED

Return
