## 7 - Exercício
```prw
#Include "TOTVS.CH"

/*/{Protheus.doc} U_Legend
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao de FWLegend
    @see        https://tdn.totvs.com/display/public/PROT/FWLegend
/*/

  

User Function Legend()

    Local oLegenda as Object

    oLegenda := FWLegend():New()
    
    oLegenda:Add("", "BR_VERDE"     , "Verde"   )
    oLegenda:Add("", "BR_AZUL"      , "Azul"    )
    oLegenda:Add("", "BR_VERMELHO"  , "Vermelho")
    oLegenda:Add("", "BR_AMARELO"   , "Amarelo" )
    oLegenda:Add("", "BR_BRANCO"    , "Branco"  )
    oLegenda:Add("", "BR_CINZA"     , "Cinza"   )
    oLegenda:Add("", "BR_LARANJA"   , "Laranja" )
    oLegenda:Add("", "BR_MARROM"    , "Marrom"  )

    oLegenda:Activate()
    oLegenda:View()
    oLegenda:Deactivate()
    oLegenda:SetNumber(.T.)
    oLegenda:Activate()
    oLegenda:View()
    oLegenda:Deactivate()
    FreeObj(oLegenda)

Return( .T. )

/*

    Abaixo a lista das cores suportadas:

    =====================================

    "RED"     ou "BR_VERMELHO"

    "GREEN"   ou "BR_VERDE"

    "YELLOW"  ou "BR_AMARELO"

    "BLUE"    ou "BR_AZUL"

    "WHITE"   ou "BR_BRANCO"

    "GRAY"    ou "BR_CINZA"

    "ORANGE"  ou "BR_LARANJA"

    "BROWN"   ou "BR_MARROM"

    "PINK"    ou "BR_PINK"

    "BLACK"   ou "BR_PRETO"

    "VIOLET"  ou "BR_VIOLETA"

    "HGREEN"  ou "BR_VERDE_ESCURO"

    "LBLUE"   ou "BR_AZUL_CLARO"

    "DISABLE" ou "BR_VERMELHO"

    "ENABLE"  ou "BR_VERDE"

*/
```
  
Esse código é um exemplo de como usar o objeto **`FWLegend`** no Protheus (framework de interface da TOTVS). Vou destrinchar parte a parte:

---

### 1️⃣ `#Include "TOTVS.CH"`

Esse include carrega as definições básicas do ambiente TOTVS/AdvPL (constantes, macros, funções padrão).  
É obrigatório em quase todos os fontes.

---

### 2️⃣ Documentação do fonte

```advpl
/*/{Protheus.doc} U_Legend
    @type       Function
    @author     Milton J.dos Santos
    @since      01/03/2020
    @version    1.0.0
    @param      Nenhum
    @return     Vazio (nil)
    @example    Exemplo da utilizacao de FWLegend
    @see        https://tdn.totvs.com/display/public/PROT/FWLegend
/*/
```

Esse bloco é apenas documentação (para gerar help automático via **Protheus Doc**).  
Define nome, tipo, autor, exemplo, etc.

---

### 3️⃣ A função principal

```advpl
User Function Legend()
    Local oLegenda as Object
    
    oLegenda := FWLegend():New()
```

Aqui é criada a função `U_Legend` (executada pelo `SIGAMDI` com `U_Legend`).  
A variável `oLegenda` é um objeto do tipo **`FWLegend`**, que serve para exibir **legendas coloridas** (usadas em grids, relatórios ou consultas).

---

### 4️⃣ Adicionando legendas

```advpl
    oLegenda:Add("", "BR_VERDE"   , "Verde"   )
    oLegenda:Add("", "BR_AZUL"    , "Azul"    )
    oLegenda:Add("", "BR_VERMELHO", "Vermelho")
    ...
```

Cada `Add` inclui uma **linha na legenda**:

- O **primeiro parâmetro** (string vazia no exemplo) poderia ser uma **expressão condicional** (ex.: `"SA1->A1_MSBLQL == '1'"`), mas aqui não está sendo usado.
    
- O **segundo parâmetro** é a **cor** (pode ser `RED` ou `BR_VERMELHO`, por exemplo).
    
- O **terceiro parâmetro** é a **descrição textual** exibida.
    

---

### 5️⃣ Ativar, visualizar, desativar

```advpl
    oLegenda:Activate()
    oLegenda:View()
    oLegenda:Deactivate()
```

- `Activate()` → abre a legenda.
    
- `View()` → mostra na tela.
    
- `Deactivate()` → fecha e libera.
    

Isso é feito duas vezes, porque depois é chamada a opção:

---

### 6️⃣ Mostrar legenda com numeração

```advpl
    oLegenda:SetNumber(.T.)
```

Isso faz a legenda mostrar **índices numéricos** junto das cores.  
Exemplo: `1 - Verde, 2 - Azul, 3 - Vermelho...`

---

### 7️⃣ Liberando objeto

```advpl
    FreeObj(oLegenda)
```

Boas práticas: destrói o objeto da memória após o uso.

---

### 8️⃣ Lista de cores suportadas

No final tem um comentário com todas as cores que podem ser usadas (`BR_VERDE`, `BR_AZUL`, `BR_PRETO`, etc.).

---

✅ **Resumo prático:**  
Essa função `U_Legend` abre uma tela de legenda no Protheus, mostrando várias cores e suas descrições, primeiro sem número e depois com número. É apenas um **exemplo de uso do `FWLegend`**.

---
