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

/*Bloco 2 -  Filtros, busca textual e ordenação*/

	/*Tarefa 2.1 - Clientes ativos da Região Sul*/

		-- Listando clintes ativos de SC, PR, e RS, por ordem de estado e depois por nome

		SELECT
			nome, status, estado
			FROM clientes
			WHERE status = 'ativo' AND estado IN ('PR', 'SC', 'RS')
			ORDER BY estado, nome;


	/*Tarefa 2.2 — Busca de cliente por nome (tela de atendimento)*/

		-- Consultando cliente por nome com o termo (bru)

		SELECT 
			* FROM clientes WHERE nome LIKE 'bru%' 
	
	/*Tarefa 2.3 — Clientes sem telefone cadastrado*/

		-- Listando nome, e-mail, cidade e estados de clientes com telefones nulos

		SELECT
			nome, email, cidade, estado
			FROM clientes
			WHERE telefone = IS NULL

	/*Tarefa 2.4 — Pedidos de ticket intermediário aprovados*/

		-- Listando pedidos aprovados com valores totais entre 100,00 e 500,00 ordendados do maior para o menor

		SELECT 
			* FROM pedidos
			WHERE status = 'Aprovado' AND valor_total BETWEEN 100 AND 500
			ORDER BY valor_total DESC

	/*Tarefa 2.5 — Alerta de reposição de estoque*/

		-- Listando nome, categoria e estoque dos produtos ativos com estoque menor que 10, ordenados do menor estoque para o maior.
		
		SELECT 
			nome, categoria, estoque
			FROM produtos 
			WHERE ativo = 1 AND estoque < 10
			ORDER BY estoque ASC

	/*Tarefa 2.6 — Alcance das campanhas de cupom*/

		-- Liste id, valor_total e cupom_desconto dos pedidos que tiveram cupom aplicado (não nulo).

		SELECT 
			id, valor_total, cupom_desconto
			FROM pedidos
			WHERE cupom_desconto IS NOT NULL

/*Bloco 4 — Classificação com CASE e regras de negócio*/

	/*Tarefa 4.1 — Classificando avaliações*/

		-- Usando CASE, classifique cada avaliação (coluna nota) em 'Excelente' (5), 'Boa' (4), 'Regular'(3) ou 'Insatisfatória' (1 ou 2).

		SELECT 
			nota,
			CASE
				WHEN nota = 1 THEN 'Insatisfatória'
				WHEN nota = 2 THEN 'Insatisfatória'
				WHEN nota = 3 THEN 'Regular'
				WHEN nota = 4 THEN 'Boa'
				WHEN nota = 5 THEN 'Excelente'
			END AS resultado_avaliacao
			FROM avaliacoes;
	
	/*Tarefa 4.2 — Quantas avaliações caem em cada faixa*/

	--  A partir da classificação da tarefa 4.1, mostre quantas avaliações existem em cada faixa, da maior para a menor quantidade, em uma única consulta.










