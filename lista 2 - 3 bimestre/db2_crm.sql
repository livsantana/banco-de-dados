/*1) Elabore uma consulta para obter todos os clientes, incluindo os que não
participaram de nenhuma campanha. Utilize LEFT JOIN entre as tabelas de
clientes e participações de campanha.
*/

SELECT  clientes.* from clientes left join participacoes_campanha
on participacoes_campanha.cliente_id = clientes.cliente_id;

/*2) Desenvolva uma consulta que liste todas as campanhas e os clientes que
participaram delas. Utilize INNER JOIN para combinar as tabelas de
campanhas e participações de campanha.*/

SELECT campanhas.*, participacoes_campanha.cliente_id
FROM campanhas
INNER JOIN participacoes_campanha ON participacoes_campanha.campanha_id = campanhas.campanha_id; 

/*3) Elabore uma consulta para obter todos os clientes, incluindo os que não
participaram de nenhuma campanha. Utilize LEFT JOIN entre as tabelas de
clientes e participações de campanha.*/

SELECT clientes.*
FROM clientes LEFT JOIN participacoes_campanha
ON clientes.cliente_id = participacoes_campanha.cliente_id;


/*4) Escreva uma consulta para listar todos os clientes e as campanhas que
participaram, mesmo que não haja clientes associados a uma campanha
específica. Utilize RIGHT JOIN entre as tabelas de clientes e campanhas.
*/

SELECT clientes.*
FROM clientes RIGHT JOIN participacoes_campanha
ON clientes.cliente_id = participacoes_campanha.cliente_id;

/*5)Crie uma consulta para exibir os detalhes de todas as interações feitas por
clientes, incluindo o nome do cliente, o tipo de interação e os detalhes.
Utilize INNER JOIN para associar as tabelas de interações e clientes.
*/

SELECT clientes.nome, interacoes.* 
FROM clientes INNER JOIN interacoes
ON clientes.cliente_id = interacoes.cliente_id;

/*6) : Crie uma consulta que liste todas as campanhas e o número
total de clientes que participaram de cada campanha. Inclua campanhas
que não tiveram participações. Utilize LEFT JOIN entre as tabelas de
campanhas e participações de campanha*/

SELECT campanhas.*, sum(participacoes_campanha.cliente_id)
FROM campanhas LEFT JOIN participacoes_campanha
ON campanhas.campanha_id = participacoes_campanha.campanha_id
GROUP BY campanhas.campanha_id;