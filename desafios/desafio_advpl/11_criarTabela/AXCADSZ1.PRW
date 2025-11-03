#INCLUDE "TOTVS.CH"

/*

Exemplo de AxCadastro - Modelo 1 (Uma unica tabela)

*/

User Function AxCADSZ1()

Local aRotAdic	:= {} 
Local bPre		:= {||MsgAlert('Chamada antes da funcao',   'TITULO')}
Local bOK		:= {||MsgAlert('Chamada ao clicar em OK',   'TITULO'), .T.}
Local bTTS		:= {||MsgAlert('Chamada durante transacao', 'TITULO')}
Local bNoTTS	:= {||MsgAlert('Chamada apos transacao',    'TITULO')}    
Local aButtons	:= {}//adiciona botões na tela de inclusão, alteração, visualização e exclusao

aAdd(aButtons,{ "PRODUTO", {|| MsgAlert("Teste", 'TITULO')}, "Teste", "Botao Teste" }  ) //adiciona chamada no aRotina
aAdd(aRotAdic,{ "Adicional","U_Adic()", 0 , 6 })

AxCadastro("SZ1", "Clientes de E-Commerce", "U_DelOk()", "U_COK()", aRotAdic, bPre, bOK, bTTS, bNoTTS, , , aButtons, , )  

Return(.T.)                        

User Function DelOk()  
MsgAlert("Chamada antes do delete") 
Return 

User Function COK()    
MsgAlert("Clicou botao OK") 
Return .t.      

User Function Adic()   
MsgAlert("Rotina adicional") 
Return
