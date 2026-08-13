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

SELECT * FROM clientes

