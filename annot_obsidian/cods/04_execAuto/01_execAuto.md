## 1 - Exercício
```prw
#Include "Protheus.ch"

#include "TBICONN.CH"

/*/{Protheus.doc} MATA030
Função de exemplo para utilização da rotina automática de Clientes.
/*/
//-------------------------------------------------------------------

User Function MATA030()

    Local aSA1Auto := {}
    Local aAI0Auto := {}
    Local nOpcAuto := 3
    Local lRet := .T.
    
    Private lMsErroAuto := .F.
    
    lRet := RpcSetEnv("99","01","Admin")


    If lRet
        //----------------------------------
        // Dados do Cliente
        //----------------------------------

        aAdd(aSA1Auto,{"A1_COD" ,"XBX141" ,Nil})
        aAdd(aSA1Auto,{"A1_LOJA" ,"01" ,Nil})
        aAdd(aSA1Auto,{"A1_NOME" ,"ROTINA AUTOMATICA" ,Nil})
        aAdd(aSA1Auto,{"A1_NREDUZ" ,"ROTAUTO" ,Nil})
        aAdd(aSA1Auto,{"A1_TIPO" ,"F" ,Nil})
        aAdd(aSA1Auto,{"A1_END" ,"BRAZ LEME" ,Nil})
        aAdd(aSA1Auto,{"A1_BAIRRO" ,"CASA VERDE" ,Nil})
        aAdd(aSA1Auto,{"A1_EST" ,"SP" ,Nil})
        aAdd(aSA1Auto,{"A1_MUN" ,"SAO PAULO" ,Nil})
        aAdd(aSA1Auto,{"A1_INCISS" ,"N" ,Nil})

    //   aAdd(aSA1Auto,{"A1_GRPVEN" ,"000001" ,Nil})
        //---------------------------------------------------------
        // Dados do Complemento do Cliente
        //---------------------------------------------------------
        aAdd(aAI0Auto,{"AI0_SALDO" ,30 ,Nil})
        //------------------------------------
        // Chamada para cadastrar o cliente.
        //------------------------------------

        MSExecAuto({|a,b,c| MATA030(a,b,c)}, aSA1Auto, nOpcAuto, aAI0Auto)

        If lMsErroAuto

            lRet := lMsErroAuto

            if isblind()
                Conout("OCORREU UM ERRO!")

            else
                MostraErro()// não usar via JOB

            endif

        Else
            Conout("Cliente incluído com sucesso!")

        EndIf

    EndIf

    RpcClearEnv()

Return lRe
```


Mostra como usar **rotinas automáticas (MSExecAuto)** no Protheus.  
Vou te explicar em detalhes:

---

## 📌 O que o código faz

Essa função `MATA030()` é um **exemplo de cadastro automático de cliente** usando a rotina padrão de clientes (`MATA030`, que no sistema é a tela de "Cadastro de Clientes").  
Em vez de abrir a tela e digitar manualmente, você passa os dados via código e o Protheus já grava no banco.

---

## 📌 Linha a linha

```advpl
#Include "Protheus.ch"
#include "TBICONN.CH"
```

Inclui definições do Protheus e conexão.

---

```advpl
User Function MATA030()
```

Função de usuário (pode ser chamada com `U_MATA030`).

---

```advpl
Local aSA1Auto := {}
Local aAI0Auto := {}
Local nOpcAuto := 3
Local lRet := .T.
Private lMsErroAuto := .F.
```

- `aSA1Auto` → array com os **dados do cliente** (tabela SA1).
    
- `aAI0Auto` → array com os **dados complementares** do cliente (tabela AI0).
    
- `nOpcAuto := 3` → define a operação:
    
    - `3 = inclusão`
        
    - `4 = alteração`
        
    - `5 = exclusão`
        
- `lMsErroAuto` → flag para saber se houve erro.
    

---

```advpl
lRet := RpcSetEnv("99","01","Admin")
```

Configura o **ambiente (empresa/filial/usuário)** onde os dados serão gravados.

- `"99"` = empresa
    
- `"01"` = filial
    
- `"Admin"` = usuário
    

Sem isso, não dá pra gravar no banco.

---

### Cadastro de Cliente (SA1)

```advpl
aAdd(aSA1Auto,{"A1_COD" ,"XBX141" ,Nil})
aAdd(aSA1Auto,{"A1_LOJA" ,"01" ,Nil})
aAdd(aSA1Auto,{"A1_NOME" ,"ROTINA AUTOMATICA" ,Nil})
aAdd(aSA1Auto,{"A1_NREDUZ" ,"ROTAUTO" ,Nil}) 
aAdd(aSA1Auto,{"A1_TIPO" ,"F" ,Nil})
aAdd(aSA1Auto,{"A1_END" ,"BRAZ LEME" ,Nil}) 
aAdd(aSA1Auto,{"A1_BAIRRO" ,"CASA VERDE" ,Nil}) 
aAdd(aSA1Auto,{"A1_EST" ,"SP" ,Nil})
aAdd(aSA1Auto,{"A1_MUN" ,"SAO PAULO" ,Nil})
aAdd(aSA1Auto,{"A1_INCISS" ,"N" ,Nil})
```

Cada `aAdd` adiciona um campo da tabela **SA1 (clientes)**.

- Ex.: `{"A1_COD","XBX141",Nil}` → campo `A1_COD` (código do cliente) recebe `"XBX141"`.
    

---

### Dados complementares (AI0)

```advpl
aAdd(aAI0Auto,{"AI0_SALDO" ,30 ,Nil})
```

Define um campo da tabela **AI0** (complemento de cliente).

---

### Execução automática

```advpl
MSExecAuto({|a,b,c| MATA030(a,b,c)}, aSA1Auto, nOpcAuto, aAI0Auto)
```

Essa linha é o **coração do processo**:

- `MSExecAuto` executa a rotina **MATA030** (clientes), passando os arrays de dados.
    
- O Protheus simula como se fosse a tela sendo usada, mas sem intervenção manual.
    

---

### Tratamento de erro

```advpl
If lMsErroAuto 
	lRet := lMsErroAuto
	if isblind()
		Conout("OCORREU UM ERRO!")
	else
		MostraErro()// não usar via JOB
	endif
Else
	Conout("Cliente incluído com sucesso!")
EndIf
```

- Se deu erro, mostra a mensagem.
    
- Se não, confirma que o cliente foi cadastrado.
    

---

### Limpa ambiente

```advpl
RpcClearEnv()
```

Sai do ambiente configurado.

---

## 📌 Anotação que você trouxe

> Exemplos de ExecAuto:
> 
> - **MATA030** → Cadastro de Clientes (tabela SA1)
>     
> - **MATA120** → Pedido de Compra
>     
> - **MATA410** → Pedido de Venda
>     

Ou seja, esse mesmo esquema pode ser usado para **outros cadastros e documentos**.  
Você só muda:

- A rotina (`MATA120`, `MATA410` etc.).
    
- Os campos nos arrays (`aSC7Auto` para pedido de compra, `aSC5Auto` para pedido de venda, etc.).
    

---

✅ Resumindo: esse código é um **exemplo de inclusão automática de cliente no Protheus**, sem abrir a tela, usando a função **MSExecAuto** para chamar a rotina padrão (`MATA030`).

---

