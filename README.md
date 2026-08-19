# Prática de Banco de Dados — NexaShop

Atividade prática de consolidação de consultas SQL (MySQL), desenvolvida em dupla para a disciplina de Análise e Desenvolvimento de Sistemas.

## Sobre a atividade

A NexaShop é um e-commerce fictício de eletrônicos e variedades. Assumindo o papel de analistas de dados júnior, a dupla transformou os dados brutos do banco `ecommerce_nexashop` (tabelas `clientes`, `produtos`, `pedidos` e `avaliacoes`) em indicadores de negócio, usando filtros, busca textual, ordenação e classificação com `CASE`.

O trabalho foi dividido em blocos, cada um cobrindo um conjunto de recursos SQL:

- **Bloco 1** — introdução e validação do ambiente
- **Bloco 2** — filtros, busca textual e ordenação (`WHERE`, `LIKE`, `IN`, `BETWEEN`, `IS NULL`, `ORDER BY`)
- **Bloco 3** — agregações e agrupamentos
- **Bloco 4** — classificação com `CASE` e regras de negócio
- **Bloco 5** — consultas avançadas
- **Bloco 6** — ponte para junções (`JOIN`), identificando perguntas de negócio que uma única tabela não responde

## Divisão do trabalho

| Integrante | Blocos |
|---|---|
| Lucas Eduardo Travassos Machado | 1, 3 e 5 |
| Mauricio Ventura Rosa | 2, 4 e 6 |

## Estrutura do repositório

```
consultas_nexashop.sql   # todas as consultas SQL, comentadas e numeradas por bloco/tarefa
docs/                    # relatório de indicadores (Word/PDF) com pergunta de negócio,
                          # consulta, resultado e interpretação de cada tarefa
prints/                  # capturas de tela dos resultados das consultas no MySQL
```

## Como executar

1. Importar a base `ecommerce_nexashop` em um servidor MySQL.
2. Rodar `USE ecommerce_nexashop;` seguido das consultas de `consultas_nexashop.sql`, na ordem em que aparecem (organizadas por bloco e tarefa).

## Turma

Análise e Desenvolvimento de Sistemas — UNISENAI
Professores: Carlos Uchoa e William Sestito

