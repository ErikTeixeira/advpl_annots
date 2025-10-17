#include "totvs.ch"
 
user function msBrGetDBase()
 
  local aDados := {}
  local oBrowse := nil
 
  DEFINE DIALOG oDlg TITLE "Exemplo MsBrGetDBase" FROM 180, 180 TO 550, 700 PIXEL           
 
    // Cria array com dados
    aAdd( aDados, { "01", "Nome 01", "Descri��o 01", "Conteudo 01" } )
    aAdd( aDados, { "02", "Nome 02", "Descri��o 02", "Conteudo 02" } )
    aAdd( aDados, { "03", "Nome 03", "Descri��o 03", "Conteudo 03" } )
    aAdd( aDados, { "04", "Nome 04", "Descri��o 04", "Conteudo 04" } )
    aAdd( aDados, { "05", "Nome 05", "Descri��o 05", "Conteudo 05" } )
 
    // Cria browse
    oBrowse := MsBrGetDBase():new( 0, 0, 260, 170,,,, oDlg,,,,,,,,,,,, .F., "", .T.,, .F.,,, )
 
    // Define vetor para a browse
    oBrowse:setArray( aDados )
 
    // Cria colunas do browse
    oBrowse:addColumn( TCColumn():new( "Filial", { || aDados[oBrowse:nAt, 1] },,,, "LEFT",, .F., .F.,,,, .F. ) )
    oBrowse:addColumn( TCColumn():new( "Nome", { || aDados[oBrowse:nAt, 2] },,,, "LEFT",, .F., .F.,,,, .F. ) )
    oBrowse:addColumn( TCColumn():new( "Descri��o", { || aDados[oBrowse:nAt, 3] },,,, "LEFT",, .F., .F.,,,, .F. ) )
    oBrowse:addColumn( TCColumn():new( "Conte�do", { || aDados[oBrowse:nAt, 4] },,,, "LEFT",, .F., .F.,,,, .F. ) )
    oBrowse:Refresh()
 
    // Cria Bot�es com m�todos b�sicos
    TButton():new( 172, 002, "goUp()", oDlg, { || oBrowse:goUp(), oBrowse:setFocus() }, 40, 010,,, .F., .T., .F.,, .F.,,, .F. )
    TButton():new( 172, 052, "goDown()", oDlg, { || oBrowse:goDown(), oBrowse:setFocus() }, 40, 010,,, .F., .T., .F.,, .F.,,, .F. )
    TButton():new( 172, 102, "goTop()", oDlg, { || oBrowse:goTop(), oBrowse:setFocus() }, 40, 010,,, .F., .T., .F.,, .F.,,, .F. )
    TButton():new( 172, 152, "goBottom()", oDlg, { || oBrowse:goBottom(), oBrowse:setFocus() }, 40, 010,,, .F., .T., .F.,, .F.,,, .F. )
 
  ACTIVATE DIALOG oDlg CENTERED
 
return
