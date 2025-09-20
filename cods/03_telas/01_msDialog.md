## 1 - Exercício
```prw
#Include 'TOTVS.CH'


/*/{Protheus.doc} U_MsDialog
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao do comando MsDialog (janela/formulario)
    @see        (https://tdn.totvs.com/pages/)
/*/

  

User Function U_MsDialog()

    Local oDlg


    // Sintaxe
    // DEFINE MsDialog oObjetoDLG TITLE cTitulo FROM nLinIni,nColIni TO nLinFim,nColFim PIXEL



    DEFINE MsDialog oDlg TITLE "Exemplo de MsDialog" FROM 0,0 TO 400,600 PIXEL

    oDlg:lEscClose  := .T.

    oDlg:lMaximized := .T.

    oDlg:lCentered  := .T.
  

    ACTIVATE MsDialog oDlg CENTER

RETURN
```

## O código `U_MsDialog` 
- Esse código cria **uma janela simples no Protheus** usando o comando `MsDialog`.
---

## 1️⃣ A variável `oDlg`

`Local oDlg`
- `oDlg` é **uma variável local** do tipo **objeto MsDialog**.
- No ADVPL, quando você faz:

`DEFINE MsDialog oDlg TITLE "Exemplo" ...`

você **está associando o objeto da janela à variável `oDlg`**.  
Isso permite configurar propriedades da janela depois, como:

```
oDlg:lEscClose := .T.
oDlg:lMaximized := .T.
oDlg:lCentered := .T.
```

Se você não usasse `oDlg`, não conseguiria acessar essas propriedades — a janela ainda apareceria, mas não teria controle refinado.

💡 **Resumo**: `oDlg` é como um “controle remoto” para a janela, permitindo manipular comportamento e aparência.

---

## 2️⃣ O `FROM 0,0 TO 400,600 PIXEL`

`DEFINE MsDialog oDlg TITLE "Exemplo de MsDialog" FROM 0,0 TO 400,600 PIXEL`

- `FROM 0,0` → posição inicial da janela **em pixels**:
    
    - `0` → linha superior da tela (topo)
        
    - `0` → coluna esquerda da tela
        
- `TO 400,600` → tamanho da janela **em pixels**:
    
    - `400` → altura (vertical)
        
    - `600` → largura (horizontal)
        

⚠️ Então `FROM 0,0 TO 400,600` significa:

> “A janela começa no canto superior esquerdo da tela e tem 400 pixels de altura por 600 pixels de largura.”

- Se você quiser a janela menor ou maior, é só mudar os valores.
    
- Exemplo:
    

`FROM 100,100 TO 300,500 PIXEL`

A janela vai aparecer **100 pixels abaixo e 100 pixels à direita do canto superior esquerdo** e terá **300px de altura e 500px de largura**.

---

## 3️⃣ Propriedades da janela

- `oDlg:lEscClose := .T.` → Fecha com ESC.
    
- `oDlg:lMaximized := .T.` → Permite maximizar a janela.
    
- `oDlg:lCentered := .T.` → Abre centralizada, **mesmo que o FROM/TO indique outro ponto**.  
    (O centramento vai sobrepor a posição inicial.)
    

---

## 4️⃣ Exibir a janela

`ACTIVATE MsDialog oDlg CENTER`

- `ACTIVATE` → mostra a janela na tela.
    
- `CENTER` → força centralizar a janela na tela, ignorando parcialmente `FROM 0,0`.
    

---
