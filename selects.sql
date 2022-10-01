-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados
-- 1)
SELECT
    pedidos.id,
    pedidos.status,
    pedidos.cliente_id,
    produtos.id,
    produtos.nome,
    produtos.tipo,
    produtos.preco,
    produtos.pts_de_lealdade
FROM
    pedidos
    JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
    JOIN produtos ON produtos.id = produtos_pedidos.produto_id;

-- 2)
SELECT
    pedido_id as id
FROM
    produtos_pedidos
WHERE
    produto_id = 6;

-- 3)
SELECT
    clientes.nome as gostam_de_fritas
FROM
    clientes
    JOIN pedidos ON clientes.id = pedidos.cliente_id
    JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
WHERE
    produto_id = 6;

-- 4)
SELECT
    SUM(produtos.preco)
FROM
    produtos_pedidos
    JOIN produtos ON produtos.id = produtos_pedidos.produto_id
    JOIN pedidos ON pedidos.id = produtos_pedidos.pedido_id
    JOIN clientes ON clientes.id = pedidos.cliente_id
WHERE
    clientes.id = 5;

-- 5)
SELECT
    produtos.nome,
    COUNT(produtos_pedidos.produto_id)
FROM
    produtos_pedidos
    JOIN produtos ON produtos.id = produtos_pedidos.produto_id
GROUP BY
    produtos.nome
ORDER BY
    produtos.nome;