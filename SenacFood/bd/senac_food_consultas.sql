-- 1. Consultas Simples

-- 1.1 Listar todos os produtos
SELECT * FROM produto;

-- 1.2 Listar todos os produtos de uma categoria específica (Exemplo: "Sanduíches")
SELECT * FROM produto WHERE categoria = 'Sanduíches';

-- 1.3 Buscar produtos disponíveis (disponibilidade = true)
SELECT * FROM produto WHERE disponibilidade = true;

-- 1.4 Buscar produtos com um preço específico ou maior (Exemplo: preço maior que 10)
SELECT * FROM produto WHERE preco > 10;

-- 1.5 Buscar um produto específico pelo nome (Exemplo: "Misto quente")
SELECT * FROM produto WHERE nome = 'Misto quente';

-- 2. Consultas com Agregações

-- 2.1 Calcular o preço médio de todos os produtos
SELECT AVG(preco) AS preco_medio FROM produto;

-- 2.2 Contar o número de produtos em cada categoria
SELECT categoria, COUNT(*) AS num_produtos FROM produto GROUP BY categoria;

-- 2.3 Calcular o preço total de todos os produtos disponíveis
SELECT SUM(preco) AS preco_total FROM produto WHERE disponibilidade = true;

-- 3. Consultas com Ordenação e Limitação

-- 3.1 Listar os produtos mais caros
SELECT * FROM produto ORDER BY preco DESC LIMIT 10;

-- 3.2 Listar os 5 produtos mais baratos
SELECT * FROM produto ORDER BY preco ASC LIMIT 5;

-- 3.3 Listar produtos em ordem alfabética
SELECT * FROM produto ORDER BY nome;

-- 4. Consultas com Junções

-- 4.1 Consultar todos os itens de um pedido (Exemplo: "Pedido #1")
SELECT ip.*, p.nome, p.preco 
FROM item_pedido ip
JOIN produto p ON ip.id_produto = p.id_produto
WHERE ip.id_pedido = 1;

-- 4.2 Consultar todos os pedidos de um cliente (Exemplo: Cliente com id_cliente = 1)
SELECT pe.id_pedido, pe.data_pedido, p.nome, ip.quantidade
FROM pedido pe
JOIN item_pedido ip ON pe.id_pedido = ip.id_pedido
JOIN produto p ON ip.id_produto = p.id_produto
WHERE pe.id_cliente = 1;

-- 4.3 Consultar os pedidos com seus respectivos status (Exemplo: "Em preparo")
SELECT p.id_pedido, p.data_pedido, p.status, c.nome AS cliente
FROM pedido p
JOIN cliente c ON p.id_cliente = c.id_cliente
WHERE p.status = 'Em preparo';

-- 5. Consultas Complexas

-- 5.1 Listar os produtos mais vendidos (Exemplo: com base no número de vezes que aparece em item_pedido)
SELECT p.nome, COUNT(ip.id_produto) AS num_vendas
FROM item_pedido ip
JOIN produto p ON ip.id_produto = p.id_produto
GROUP BY p.nome
ORDER BY num_vendas DESC
LIMIT 10;

-- 5.2 Listar o total gasto por cada cliente em seus pedidos
SELECT c.nome AS cliente, SUM(p.preco * ip.quantidade) AS total_gasto
FROM pedido pe
JOIN item_pedido ip ON pe.id_pedido = ip.id_pedido
JOIN produto p ON ip.id_produto = p.id_produto
JOIN cliente c ON pe.id_cliente = c.id_cliente
GROUP BY c.nome;

-- 5.3 Produtos mais vendidos por categoria
SELECT p.categoria, p.nome, COUNT(ip.id_produto) AS num_vendas
FROM item_pedido ip
JOIN produto p ON ip.id_produto = p.id_produto
GROUP BY p.categoria, p.nome
ORDER BY p.categoria, num_vendas DESC;

-- 5.4 Encontrar os produtos com maior margem de lucro (Preço de venda - Custo)
SELECT p.nome, (p.preco - p.custo) AS margem_lucro
FROM produto p
ORDER BY margem_lucro DESC
LIMIT 10;

-- 6. Consultas com Subconsultas

-- 6.1 Buscar o pedido mais recente de um cliente (Exemplo: Cliente com id_cliente = 1)
SELECT * FROM pedido 
WHERE id_cliente = 1 
AND data_pedido = (SELECT MAX(data_pedido) FROM pedido WHERE id_cliente = 1);

-- 6.2 Produtos que foram pedidos em um valor acima da média
SELECT p.nome
FROM produto p
WHERE p.preco > (SELECT AVG(preco) FROM produto);

-- 6.3 Consultar os pedidos feitos por um cliente com valor total acima de um valor específico
SELECT pe.id_pedido, SUM(p.preco * ip.quantidade) AS total
FROM pedido pe
JOIN item_pedido ip ON pe.id_pedido = ip.id_pedido
JOIN produto p ON ip.id_produto = p.id_produto
WHERE pe.id_cliente = 1
GROUP BY pe.id_pedido
HAVING total > 50;
