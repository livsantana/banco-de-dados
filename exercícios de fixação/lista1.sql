-- lista 1
/*1. Selecionar Todos os Produtos -Escreva uma consulta que selecione todos os campos de todos os produtos na tabela produtos.*/
SELECT * FROM produtos;

/*2. Selecionar Produtos Específicos - Escreva uma consulta para selecionar o nome e preco dos produtos que têm um preço superior a 100.*/
SELECT * FROM produtos
WHERE preco> 100;

/*.3 Produtos com Estoque Baixo-Escreva uma consulta para selecionar o nome e quantidade_estoque dos produtos com uma quantidade em estoque menor que 20.*/
SELECT nome, quantidade_estoque FROM produtos
WHERE quantidade_estoque<20;


/*4. Produtos Por Faixa de Preço-Escreva uma consulta para selecionar o nome e preco dos produtos categorizados em faixas de preço: abaixo de 50, entre 50 e 100, e acima de 100.*/
SELECT nome, preco, 'Abaixo de 50' categoria
from produtos
where preco <50 
    
UNION
    
SELECT nome, preco, 'Entre 50 e 100' categoria
from produtos
where preco between 50 and 100
    
UNION
    
SELECT nome, preco, 'Acima de 100' categoria
from produtos
where preco >100;

/*5. Atualização de Preços
Sem atualizar a tabela, escreva uma consulta que mostre o nome e o preco atualizado dos produtos, aumentando todos os preços em 10%.*/

SELECT nome, preco*1.1 FROM produtos;

/*6. Ordenar Produtos por Disponibilidade
Escreva uma consulta para selecionar o nome, preco e quantidade_estoque de todos os produtos, ordenados pela quantidade_estoque em ordem decrescente.*/

SELECT nome, preco, quantidade_estoque FROM produtos
ORDER BY quantidade_estoque desc;