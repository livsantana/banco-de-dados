
/*1. E-commerce e Gestão de Inventário*/

/*1) Escreva uma consulta SQL que recupere todos os pedidos juntamente com
o nome e o email dos clientes que fizeram esses pedidos. Utilize INNER
JOIN para combinar as tabelas de pedidos e clientes.
*/

SELECT pedidos.*, clientes.*
FROM pedidos 
INNER JOIN clientes
ON pedidos.cliente_id = clientes.cliente_id;

/*2) Crie uma consulta para listar todos os produtos e, caso existam, os
detalhes dos pedidos em que esses produtos foram vendidos. Utilize LEFT
JOIN para incluir todos os produtos, mesmo aqueles que não foram
vendidos.
*/

SELECT * from produtos 
LEFT JOIN itens_pedido
on produtos.produto_id = itens_pedido.produto_id;

/*3) Desenvolva uma consulta para obter o nome do cliente e o total do pedido
para todos os pedidos realizados, incluindo clientes que possam não ter
nenhum pedido associado. Use LEFT JOIN.*/

SELECT clientes.nome, pedidos.pedido_id, pedidos.total 
FROM clientes LEFT JOIN pedidos
ON clientes.cliente_id= pedidos.cliente_id;

/*4) Escreva uma consulta para listar todos os itens de pedido junto com o
nome dos produtos. Utilize INNER JOIN para combinar as tabelas de itens
de pedido e produtos.
*/

SELECT itens_pedido.*, produtos.nome 
FROM itens_pedido INNER JOIN produtos
ON itens_pedido.produto_id = produtos.produto_id;

/*5) Elabore uma consulta para exibir todos os clientes e seus pedidos, mas
também inclua clientes que ainda não fizeram pedidos. Utilize LEFT JOIN
entre as tabelas de clientes e pedidos.*/

SELECT clientes.*, pedidos.* FROM clientes LEFT JOIN pedidos
ON clientes.cliente_id= pedidos.cliente_id;

/*6) Elabore uma consulta para exibir os detalhes de cada pedido (pedido_id, nome do cliente, total do pedido) e todos os itens do pedido
(nome do produto, quantidade, preço unitário). Utilize INNER JOIN para combinar as tabelas de pedidos, clientes e itens de pedido.*/

SELECT pedidos.pedido_id, clientes.nome, pedidos.total, produtos.id, itens_pedido.quantidade