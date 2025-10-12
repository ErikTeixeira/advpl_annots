# ADVPL Annotations

Repositório criado para armazenar **anotações, exercícios, estudos e exemplos** relacionados à linguagem **ADVPL** (Advanced Protheus Language), utilizada no **ERP TOTVS Protheus**.

O objetivo é servir como material de apoio e consulta rápida durante o aprendizado e desenvolvimento em ADVPL.

---

## 🧠 O que é ADVPL?

O **ADVPL (Advanced Protheus Language)** é a linguagem de programação proprietária da **TOTVS**, usada para personalizar e desenvolver rotinas dentro do **Protheus**, o sistema ERP da empresa.

Ela é baseada em linguagens como **Clipper/xBase**, possuindo uma sintaxe estruturada, suporte a **funções, procedimentos, variáveis locais e globais**, além de **integração direta com o banco de dados** do Protheus.

---

## ⚙️ Estrutura básica

Um código em ADVPL geralmente é organizado em **funções e procedimentos**. Abaixo, um exemplo simples:

```advpl
#Include "Protheus.ch"

User Function OlaMundo()
    Local cNome := "Erik"

    MsgInfo("Olá, " + cNome + "! Bem-vindo ao ADVPL.", "Mensagem")
Return
```

### Explicação:

* `#Include "Protheus.ch"` → Inclui definições e constantes padrão do Protheus.
* `User Function OlaMundo()` → Declara uma função pública que pode ser executada pelo sistema.
* `MsgInfo()` → Exibe uma mensagem em uma caixa de diálogo no Protheus.

---


## 💡 Observações

Este repositório é voltado para **fins de estudo pessoal** e documentação de aprendizado.
Contribuições e sugestões são bem-vindas!

