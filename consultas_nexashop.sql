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

/*Bloco 3 — Indicadores agregados*/

	/*Tarefa 3.1 — Radar de ticket médio*/

		SELECT 
			-- KPI que quantifica o número de pedidos
			COUNT(id) as "Nº de Pedidos Aprovados",

			/* Não faz sentido utilizar o AVG nessa tarefa pois, ao calcular
			o banco faz: (somatória do valor total) / (quantidade de registros).
			O problema é que, um registro não significa quantidade = 1,
			o que aumenta o ticket médio de maneira incorreta */
			ROUND(AVG(valor_total), 2) as "Ticket Médio Incorreto",

			/* Essa é a maneira certa de calcular o ticket médio: (soma
			do valor total) / (soma da quantidade vendida) */
			ROUND(SUM(valor_total)/SUM(quantidade), 2) as "Ticket Médio Correto",

			-- KPI que retorna ao pedido de maior valor
			MAX(valor_total) as "Maior valor",

			-- KPI que retorna ao pedido de menor valor
			MIN(valor_total) as "Menor valor"

		FROM pedidos

		/* Filtro que faz todas as consultas serem realizadas apenas nos pedidos aprovados
		evitando alterar os indicadores para pedidos com outros status */
		WHERE status = "Aprovado";

	/* Tarefa 3.2 — Faturamento por forma de pagamento */

		-- Visão resumida do total dos pedidos aprovados, por forma de pagamento
		SELECT 
			forma_pagamento as 'Forma Pagamento',
			SUM(valor_total) as 'Faturamento'
		FROM pedidos
		WHERE status = "Aprovado"
		GROUP BY forma_pagamento
		ORDER BY Faturamento DESC;

	/*Tarefa 3.3 — Onde estão os clientes da NexaShop*/

		-- Visão resumida da distribuição de clientes por estado
		SELECT
			estado,
			COUNT(id) as `Quantidade de clientes`
		FROM clientes
		GROUP BY estado
		ORDER BY `Quantidade de clientes` DESC;

	/*Tarefa 3.4 — Estados prioritários para expansão*/

		-- Visão resumida da distribuição de clientes com mais de 200 por estado
		-- Exatamente a mesma consulta anterior, com uso do having
		SELECT
			estado,
			COUNT(id) as `Quantidade de clientes`
		FROM clientes
		GROUP BY estado
		HAVING `Quantidade de clientes`>200
		ORDER BY `Quantidade de clientes` DESC;

	/*Tarefa 3.5 -  Perfil etário por segmento de cliente*/

		-- Análise rápida da faixa etária por segmento
		SELECT
			segmento,
            ROUND(AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURRENT_DATE())), 0) as `Idade Média`
		FROM clientes
		GROUP BY segmento;

	/*Tarefa 3.6 — Valor de estoque parado por categoria*/

		-- Análise do valor acumulado em estoque por categoria do produto
		SELECT
			categoria,
			(preco * estoque) as `Valor total em estoque`
		FROM produtos
		-- Assumindo que um produto ativo é =1, pois a tabela não deixa claro essa informação
		WHERE ativo = 1
		GROUP BY categoria
		ORDER BY `Valor total em estoque` DESC;

        
        