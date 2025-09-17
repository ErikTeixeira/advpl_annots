## Tipo do arquivo
- `.tlpp` ou `prw`  –> mais atual é o .tlpp

## O `.ch` 
```
#include "Protheus.ch"
#include "Totvs.ch"
```
- é um **arquivo de cabeçalho** que serve para “ensinar” ao seu código quais funções, constantes e macros estão disponíveis no ambiente.
- A extensão **`.ch`** significa **“header file”** (arquivo de cabeçalho).
- Ele funciona parecido com os **arquivos `.h` no C**.
- Sem o `.ch`, o compilador **não reconheceria** funções e recursos que você usa no seu código.

## Para o `#INCLUDE "TOTVS.CH"` (ou qualquer outro include) funcionar:
- **O arquivo precisa existir no seu ambiente** → geralmente fica na pasta:
	``C:\TOTVS\Protheus\Include``

## Toda função em ADVPL precisa de um `return` no final, mesmo que não retorne valores.

