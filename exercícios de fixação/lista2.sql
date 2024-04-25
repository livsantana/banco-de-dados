-- lista 2
/*1.  Contar Produtos em Estoque -escreva uma consulta que conte o total de produtos disponíveis em estoque.*/
SELECT sum(quantidade_estoque) FROM produtos;

/*2. Média de Preços-Escreva uma consulta que calcule a média dos preços dos produtos.*/
SELECT avg(preco) FROM produtos;

/*3. Listar Produtos com "Modelo 20" no Nome -Escreva uma consulta para encontrar todos os produtos que têm "Modelo 20" em seu nome, selecionando todas as informações desses produtos.*/
SELECT * FROM produtos
WHERE nome LIKE '%Modelo 20%';

/*4. Produtos com Preço entre 50 e 150 -Escreva uma consulta para selecionar o nome, preco e descricao dos produtos com preço entre 50 e 150.*/
SELECT nome, preco, descricao FROM produtos
WHERE preco BETWEEN 50 and 100;

/*5. Listar os 5 Produtos Mais Baratos - Escreva uma consulta para listar o nome e preco dos 5 produtos mais baratos.*/
SELECT nome, preco FROM produtos
ORDER BY preco ASC
LIMIT 5;

/*6. Produtos que Não Estão em Estoque-Escreva uma consulta para selecionar o nome dos produtos que não têm nenhum item em estoque.*/
SELECT nome FROM produtos
WHERE quantidade_estoque=0;

/*7. Listar Produtos com Descrição - Escreva uma consulta para selecionar o nome e descricao dos produtos que possuem uma descrição (não é nula ou vazia).*/
SELECT nome, descricao FROM produtos
WHERE descricao != '';

/*8. Produtos com Preço Acima da Média - Escreva uma consulta para selecionar o nome e preco dos produtos cujo preço está acima da média dos preços de todos os produtos.*/
SELECT nome, preco FROM produtos
WHERE preco > (SELECT AVG(preco) FROM produtos);

/*9. Selecionar Produtos com "SSD" no Nome - Escreva uma consulta para selecionar todas as informações dos produtos que têm "SSD" no nome.*/
SELECT * FROM produtos
WHERE nome like '%SSD%';

-- 10. Produtos Ordenados por Preço em Ordem Decrescente -Escreva uma consulta para listar o nome e preco de todos os produtos, ordenados pelo preço em ordem decrescente.
SELECT nome, preco FROM produtos
ORDER BY preco DESC;

-- 11. Listar Produtos com Quantidade de Estoque Par -Escreva uma consulta para selecionar o nome e quantidade_estoque dos produtos cuja quantidade em estoque é um número par.
SELECT nome, quantidade_estoque FROM produtos 
WHERE quantidade_estoque%2=0;

/*12. Selecionar Nome e Descrição de Produtos com Preço Inferior a 100 e em Estoque
Escreva uma consulta para selecionar o nome e descricao dos produtos que têm preço inferior a 100 e uma quantidade em estoque superior a 0.*/

SELECT nome, descricao FROM produtos
WHERE preco<100 and quantidade_estoque>0; 	
