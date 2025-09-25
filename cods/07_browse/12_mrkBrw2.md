## 12 - Exercício
```prw
#Include 'TOTVS.CH'

  

/*/{Protheus.doc} U_MrkBrw2

    @type       Function

    @author     Milton J.dos Santos

    @since      01/03/2020

    @version    1.0.0

    @param      Nenhum

    @return     Vazio (nil)

    @example    Exemplo da utilizacao de MBrowse

    @see        https://tdn.totvs.com/display/public/framework/MarkBrow

/*/

  

User Function MrkBrw2

Local aCampos := {  {"CB_OK"        ,,''        },;

                    {"CB_USERLIB"   ,,"Usuario" },;

                    {"CB_TABHORA"   ,,"Hora"    },;

                    {"CB_DTTAB"     ,,"Data"    }}

  

Private cMarca      := GetMark()

Private cCadastro   := "Cadastro de Contrato"

Private aRotina     := { { "Pesquisar" , "AxPesqui" , 0, 1 }}

  

MarkBrow( "SCB", "CB_OK","!CB_USERLIB",aCampos,, cMarca,"MarkAll()",,,,"Mark()" )

  

Return

  

// Grava marca no campo

  

Static Function Mark()

  

RecLock( "SCB", .F. )

If IsMark( "CB_OK", cMarca )

    Replace CB_OK With Space(2)

Else

    Replace CB_OK With cMarca

EndIf

MsUnLock()

  

Return

  

// Grava marca em todos os registros válidos

  

Static Function MarkAll()

Local nRecno := Recno()

  

dbSelectArea("SCB")

dbGotop()

Do While !Eof()

    Mark()

    dbSkip()

Enddo

dbGoto( nRecno )

  

Return
```


---

## 📌 Resumo 

Esse código cria uma **rotina personalizada no Protheus que abre um `MarkBrow` na tabela SCB (contratos)**, permitindo marcar/desmarcar registros individualmente ou em massa, gravando a marca no campo `CB_OK`.

👉 Serve para **controle visual de registros**: o usuário pode selecionar contratos na tela e o sistema salva essa marca no banco.

---

## 📝 Explicando linha por linha

```advpl
#Include 'TOTVS.CH'
```

- Inclui as definições padrão do Protheus (constantes, funções globais, etc).
    

---

```advpl
/*/{Protheus.doc} U_MrkBrw2
    ...
/*/
```

- Documentação do fonte (cabeçalho Protheus DOC).
    
- Informa nome da função (`U_MrkBrw2`), autor, data, versão, exemplo de uso, etc.
    

---

```advpl
User Function MrkBrw2
```

- Define a função de usuário `U_MrkBrw2`, que pode ser executada no Protheus via `CTRL+F12` ou associada a menus.
    

---

```advpl
Local aCampos := { {"CB_OK"    ,,''       },;
                   {"CB_USERLIB",,"Usuario"},;
                   {"CB_TABHORA",,"Hora"   },;
                   {"CB_DTTAB"  ,, "Data"  }}
```

- Define os **campos que serão exibidos no browser**:
    
    - `CB_OK` → campo de marcação.
        
    - `CB_USERLIB` → usuário.
        
    - `CB_TABHORA` → hora.
        
    - `CB_DTTAB` → data.
        
- Cada item da matriz é `{campo, expressão, título}`.
    

---

```advpl
Private cMarca     := GetMark()
```

- Obtém o símbolo usado para marcar registros (ex.: “X”).
    

---

```advpl
Private cCadastro  := "Cadastro de Contrato"
```

- Texto usado como **título/cabeçalho** da rotina.
    

---

```advpl
Private aRotina    := { { "Pesquisar" , "AxPesqui" , 0, 1 }}
```

- Define o menu de opções da tela (`Pesquisar` que chama a função `AxPesqui`).
    

---

```advpl
MarkBrow( "SCB", "CB_OK","!CB_USERLIB",aCampos,, cMarca,"MarkAll()",,,,"Mark()" )
```

- Chama o **MarkBrow**, que abre a tela.
    
    - `"SCB"` → tabela Contratos.
        
    - `"CB_OK"` → campo que será usado para marcar.
        
    - `"!CB_USERLIB"` → filtro (exclui registros com CB_USERLIB?).
        
    - `aCampos` → colunas que aparecerão.
        
    - `cMarca` → símbolo da marcação.
        
    - `"MarkAll()"` → rotina de marcar todos.
        
    - `"Mark()"` → rotina de marcar individualmente.
        

---

```advpl
Return
```

- Finaliza a função principal.
    

---

### 🔹 Rotina auxiliar para marcar 1 registro

```advpl
Static Function Mark()
    RecLock( "SCB", .F. )
    If IsMark( "CB_OK", cMarca )
        Replace CB_OK With Space(2)   // Se já está marcado → desmarca
    Else
        Replace CB_OK With cMarca     // Se não está → marca
    EndIf
    MsUnLock()
Return
```

- Faz o **toggle** da marca no registro atual da SCB.
    

---

### 🔹 Rotina auxiliar para marcar todos

```advpl
Static Function MarkAll()
    Local nRecno := Recno()
    dbSelectArea("SCB")
    dbGotop()
    Do While !Eof()
        Mark()          // marca cada registro
        dbSkip()        // vai para o próximo
    Enddo
    dbGoto( nRecno )    // volta para a posição original
Return
```

- Percorre todos os registros da tabela SCB.
    
- Marca/desmarca todos de uma vez.
    
- Ao final, volta para o registro em que o usuário estava.
    

---

✅ Resumindo:  
Esse código cria uma **interface no Protheus para gerenciar contratos (SCB)**, permitindo marcar individualmente ou em lote os registros, gravando o status no campo `CB_OK`.

---