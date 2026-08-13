USE ecommerce_nexashop;

/*Atividade 0*/

SELECT 
	'clientes' AS tabela, COUNT(*) AS total FROM clientes
UNION ALL
SELECT 
	'produtos' AS tabela, COUNT(*) as total FROM produtos
UNION ALL
SELECT 'pedido' AS tabela, COUNT(*) AS total FROM pedidos
UNION ALL
SELECT 'avaliacoes' AS tabela, COUNT(*) AS total FROM avaliacoes;

/*Bloco 1 - Reconhecimento do banco*/

	/*Tarefa 1.1 — Primeiro contato com os dados*/

		-- Listagem de 10 registros com todas as colunas da tabela clientes
		SELECT * FROM clientes LIMIT 10;

		-- Listagem de 10 registros com todas as colunas da tabela produtos
		SELECT * FROM produtos LIMIT 10;

		-- Listagem de 10 registros com todas as colunas da tabela pedidos
		SELECT * FROM pedidos LIMIT 10;

		-- Listagem de 10 registros com todas as colunas da tabela avaliacoes
		SELECT * FROM avaliacoes LIMIT 10;

	/*Tarefa 1.2 — Catálogo de produtos para o marketing*/

		-- Listagem limpa do catálogo de produto, sem as colunas id e ativo
		SELECT
			nome as nome_produto,
			categoria,
			marca,
			preco as "Valor (R$)",
			estoque
		FROM produtos;

	/*Tarefa 1.3 — Quantas categorias a loja realmente vende*/

		-- Listagem de todas as categorias dos produtos
		SELECT DISTINCT(categoria) as "Lista de categorias"
		FROM produtos;
	
	/*Tarefa 1.4 — Formas de pagamento e canais de venda aceitos*/

		-- Listagem de todas as formas de pagamento dos pedidos
		SELECT DISTINCT(forma_pagamento) as "Lista formas de pagamento"
		FROM pedidos;

		-- Listagem de todos os canais de venda dos pedidos
		SELECT DISTINCT(canal_venda) as "Lista canais de venda"
		FROM pedidos;
