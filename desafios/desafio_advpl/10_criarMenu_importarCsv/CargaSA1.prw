#Include 'protheus.ch'
#Include 'tbiconn.ch'
#Include 'fileio.ch'

/*
	Este programa combina 3 funções:
	- Acesso em pasta
	- Manipular Arquivos (Texto)
	- Gravação com ExecAuto
*/

User Function CargaSA1()

	Local aDados	:= {}
	Local cDirD		:= "C:\temp\log\"
	Local cFileLOG	:= cDirD + "CargaSA1.log"
	Local aHeader

	Private ENTER 	 := CHR(13)+CHR(10)
	Private nHandle1 := 0
	Private nHandle2 := 0
	Private nOk		 := 0	// Total linhas processada
	Private nTotal	 := 0 	// Total de Linhas da planilha
	Private nNok	 := 0 	// Total de linhas Não processado
	
	nHandle1 := FCREATE(cFileLOG)

	if nHandle1 = -1
		Alert("Erro ao criar arquivo - ferror " + Str(Ferror()))
		Return
	Endif

	IniLOG()
	// Visualmente o desenvolvedor já consegue detectar que acabou a rotina, não vai seguir
	// FCREATE

	GravaLOG("Preparar para carregar Cabecalho e Dados")

	cDir := "\SYSTEM\"

	// cGetFile ( [ cMascara], [ cTitulo], [ nMascpadrao], [ cDirinicial], [ lSalvar], [ nOpcoes], [ lArvore], [ lKeepCase] )
	cArquivo := cGetFile("*.csv|*.csv","Selecao de Arquivos",0,cDir,.T.,GETF_LOCALHARD,.T.) 

	nHandle2    := FT_FUSE(cArquivo)		// Está tentando abrir o arquivo escolhido

	// Se houver erro de abertura abandona processamento
	If nHandle2 == -1		// << menos 1 significa que não conseguiu abrir o arquivo....
		cTexto := "Erro de abertura : FERROR " + str(ferror() )
		MsgStop( cTexto , 4)
		GravaLOG( cTexto )
		FClose(nHandle2)
	EndIf

	lCabec	:= .T.
	aCabec := {}
	aDados := {}
	nLinha	:= 0
	nTotal	:= ft_flastrec() -1 // Total de Linhas com conteudo
	nOk		:= 0 				// Linhas processadas
	nNok	:= 0				// Linhas nao processadas 
	While !FT_FEOF() 		
		// Retorna uma linha do arquivo aberto
		GravaLOG( "lendo linha no " + Str( nLinha++ ))

		cLine := FT_FReadLn()
		If lCabec == .T.
			lCabec:= .F.	// Le a primeira linha e desabilita cabelalho
			aAdd(aCabec, StrTokArr(cLine, ","))
		Else
			aAdd(aDados, StrTokArr(cLine, ","))
		Endif

		// Pula para próxima linha
		FT_FSKIP()
	End

	GravaLOG("Conseguiu carregar Cabecalho e Dados")

	aHeader := Array(  Len( aCabec[1] ) )

	For i := 1 to Len( aCabec [1])
		aHeader[ i] := aCabec[ 1, i ]
	Next
	For nCliente := 1 to Len( aDados)
		GravaLOG( "Gravando linha no " + Str( nCliente ) )
		aCols	:= aDados[nCliente]
		xMATA030(aHeader, aCols)	
	Next

	If nOk	== 0 	// Não pocessou nada
			GravaLOG("Não pocessou nada")
	Else

		If CpyS2T( cArquivo, cDirD, .F. )
			GravaLOG("Moveu o arquivo para " + cDirD)
		Else
			GravaLOG("Nao moveu o arquivo. Verifique as permissoes na pasta " + cDirD)
		Endif
	Endif
	FimLOG()

Return

user function xNewDir()
	Local nRet := MakeDir( "\processado" )

	If nRet <> 0
		Conout( "Não foi possível criar o diretório. Erro: " + cValToChar( FError() ) )
	Endif
Return


Static Function IniLog()
	FWrite(nHandle1, REPLICATE("=",130) + ENTER,99)
	FWrite(nHandle1, "INICIO DO LOG"	+ ENTER,99)
	FWrite(nHandle1, REPLICATE("=",130) + ENTER,99)
Return

Static Function GravaLog( _cTEXTO )
	Local cTexto := ""

	cTexto += DtoC( Date() ) + " - "
	cTexto += Time() + " - "
	cTexto += _cTEXTO
	cTexto += ENTER

	FWrite(nHandle1, cTEXTO ,99)
Return( .T. )

Static Function FimLog()
	FWrite(nHandle1, REPLICATE("=",130) + ENTER,99)
	FWrite(nHandle1, "FIM DO LOG"		+ ENTER,99)
	FWrite(nHandle1, "Total de Linhas da planilha"  +str(nTotal)+ ENTER,99)
	FWrite(nHandle1, "Total linhas processadas" 	+str(nOk)	+ ENTER,99)
	FWrite(nHandle1, "Total linhas nao processadas" +str(nNok)	+ ENTER,99)
	FWrite(nHandle1, REPLICATE("=",130) + ENTER,99)
	
	FClose(nHandle1)

Return

Static Function xMATA030(aHeader, aCols)

	Local aSA1Auto := {}	// cabeçalho
	Local aAI0Auto := {}	// itens
	Local nOpcAuto := 3 	// 5.excluir - 3.inserir
	Local lRet := .T.

	Private lMsErroAuto := .F.

	//lRet := RpcSetEnv("T1","D MG 01","Admin")    //abertura de ambiente para rotinas automáticas, permitindo definir empresa e filial

	If lRet

		//----------------------------------
		// Dados do Cliente                 |
		//----------------------------------

		aAdd(aSA1Auto,{"A1_COD"    ,aCols[AScan(aHeader,{|x| Upper(AllTrim(x)) == "A1_COD"		})] ,Nil})
		aAdd(aSA1Auto,{"A1_LOJA"   ,aCols[AScan(aHeader,{|x| Upper(AllTrim(x)) == "A1_LOJA"		})] ,Nil})
		aAdd(aSA1Auto,{"A1_NOME"   ,aCols[AScan(aHeader,{|x| Upper(AllTrim(x)) == "A1_NOME"		})] ,Nil})
		aAdd(aSA1Auto,{"A1_NREDUZ" ,aCols[AScan(aHeader,{|x| Upper(AllTrim(x)) == "A1_NREDUZ"	})] ,Nil}) 
		aAdd(aSA1Auto,{"A1_TIPO"   ,aCols[AScan(aHeader,{|x| Upper(AllTrim(x)) == "A1_TIPO"		})] ,Nil})
		aAdd(aSA1Auto,{"A1_END"    ,aCols[AScan(aHeader,{|x| Upper(AllTrim(x)) == "A1_END"		})] ,Nil}) 
		aAdd(aSA1Auto,{"A1_BAIRRO" ,aCols[AScan(aHeader,{|x| Upper(AllTrim(x)) == "A1_BAIRRO"	})] ,Nil}) 
		aAdd(aSA1Auto,{"A1_EST"    ,aCols[AScan(aHeader,{|x| Upper(AllTrim(x)) == "A1_EST"		})] ,Nil})
		aAdd(aSA1Auto,{"A1_MUN"    ,aCols[AScan(aHeader,{|x| Upper(AllTrim(x)) == "A1_MUN"		})] ,Nil})

		//---------------------------------------------------------
		// Dados do Complemento do Cliente                         |
		//---------------------------------------------------------
		aAdd(aAI0Auto,{"AI0_SALDO" ,30 ,Nil})

		//------------------------------------
		// Chamada para cadastrar o cliente.  |
		//------------------------------------
		MSExecAuto({|a,b,c| MATA030(a,b,c)}, aSA1Auto, nOpcAuto, aAI0Auto)

		If lMsErroAuto 
			lRet := lMsErroAuto
			nNok++
			MostraErro()// não usar via JOB
		Else
			nOk++
			Conout("Cliente incluído com sucesso!") //opção 3
			//	Conout("Cliente excluido com sucesso!") //opção 5
		EndIf

	EndIf

Return (.T.)

Static Function xPasta()

	//Definindo os diretórios
	cDirTerm	:= "C:\temp\processado\" // local o qual receberá as copias 
	cDirSrv		:=  "\processado" 
	aDirAux		:= Directory(cDirSrv+'*.csv')

	//Percorre os arquivos
	For nAtual := 1 To Len(aDirAux)
		//Pegando o nome do arquivo
		cNomArq := aDirAux[nAtual][1]
		//Copia o arquivo do Servidor para a máquina do usuário
		nRetCopy := CpyS2T(cDirSrv+cNomArq, cDirTerm)
	Next nAtual


Return
