
/*Exercício 1: Listar todos os pedidos com detalhes do cliente
Escreva uma consulta SQL que retorne o ID do pedido, a data do pedido, o nome completo do cliente e 
o email para todos os pedidos. Use um JOIN para combinar as tabelas Orders e Customers.*/
SELECT orders.*, CONCAT(customers.first_name, " ", customers.last_name)  as "Nome completo", customers.email 
FROM orders INNER JOIN customers
ON orders.customer_id= customers.customer_id;

/*Exercício 2: Encontrar todos os produtos pedidos por um cliente específico
Escreva uma consulta SQL que retorne o nome do produto e a quantidade pedida para todos os produtos 
pedidos por um cliente com um customer_id específico (por exemplo, customer_id = 1). Essa consulta 
deve combinar as tabelas Order_Items, Orders e Products.*/
SELECT products.product_name, order_items.quantity, orders.customer_id 
FROM orders
INNER JOIN order_items
INNER JOIN products
ON products.product_id= order_items.product_id
WHERE orders.customer_id=1;

/*Exercício 3: Calcular o total gasto por cada cliente Escreva uma consulta SQL que calcule o total gasto por cada cliente. O resultado deve incluir o nome completo do cliente e
 o total gasto. Essa consulta deve usar JOINs para combinar as tabelas  Customers, Orders, Order_Items e Products, e deve usar uma função de agregação para calcular o total.*/

SELECT CONCAT(customers.first_name, " ", customers.last_name), SUM(order_items.quantity*products.price) 
FROM customers INNER JOIN orders
ON customers.customer_id= orders.customer_id
INNER JOIN order_items
ON orders.order_id = order_items.order_id
INNER JOIN products
ON order_items.product_id = products.product_id
GROUP BY 
customers.customer_id, customers.first_name, customers.last_name;

/*Exercício 4: Encontrar os clientes que nunca fizeram um pedido
Escreva uma consulta SQL que retorne os nomes dos clientes que nunca fizeram um pedido. Para isso,
 use um LEFT JOIN entre as tabelas Customers e Orders e filtre os resultados para encontrar 
 clientes sem pedidos.*/
 
SELECT CONCAT(customers.first_name, " ", customers.last_name) AS "Nome completo" 
FROM customers LEFT JOIN orders
ON customers.customer_id = orders.customer_id 
WHERE  orders.order_id is null;

/*Exercício 5: Listar os produtos mais vendidosEscreva uma consulta SQL que retorne o nome do produto e a quantidade total vendida, ordenando os
resultados pelos produtos mais vendidos. Combine as tabelas Order_Items e Products, e utilize uma função de agregação para somar a quantidade vendida de cada produto.*/

SELECT products.product_name, order_items.quantity
FROM products JOIN order_items
ON products.product_id= order_items.product_id
ORDER BY order_items.quantity DESC;