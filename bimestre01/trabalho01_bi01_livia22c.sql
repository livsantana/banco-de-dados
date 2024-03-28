DROP DATABASE IF EXISTS sistema_ecommerce;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS produto;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS itens;

CREATE DATABASE IF NOT EXISTS sistema_ecommerce;
USE sistema_ecommerce;

CREATE TABLE IF NOT EXISTS cliente(
	id_cliente int unsigned auto_increment primary key,
	nome varchar(100) not null,
    endereco varchar(250) not null,
    email varchar(70) not null,
    celular varchar(15) not null,
    dt_nasc date not null
);

CREATE TABLE produto(
	id_produto int unsigned auto_increment,
	nome_produto varchar(150) not null,
    preco decimal(10,2) not null,
    descricao varchar(255) not null,
    quantidade_estoque bigint unsigned not null,
    primary key (id_produto, nome_produto, preco)
);

CREATE TABLE pedidos(
		id_pedido int unsigned auto_increment primary key,
	id_cliente int unsigned,
    dt_compra date not null,
    valor_total decimal (8,2) not null,
    dt_entrega date not null,
    foreign key(id_cliente)  references cliente(id_cliente)
);

CREATE TABLE itens(
		id_item int unsigned auto_increment primary key,
	id_pedido int unsigned,
	id_produto int unsigned ,
    preco decimal(10,2) not null,
	quantidade int unsigned,
    valor_total decimal (8,2),
    foreign key (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);

INSERT INTO cliente (nome, endereco, email, celular, dt_nasc)
VALUES('Francisca Pacheco', 'Rua Antônio Ramos, 41', 'pachecofran45@gmail.com', 949746834, "1996-04-27"),
('Mariana Macedo', 'Rua Marcelo Pera, 794', 'marimacedo@gmail.com', 992105853, "2002-02-25"),
('Valdisley dos Santos', 'Rua Henrique Vedia, 69', 'valdisleysantos798@outlook.com', 940028922, "1962-03-26"),
('Jacinto Ramos', 'Rua Lins do Rego, 676', 'ramosdejacinto@gmail.com', 992732956, "1975-11-30"),
('Mayck Wazovski', 'Rua Cipriano Reis, 96', 'mayckwazovski@gmail.com', 912742985, "1978-06-28"),
('Michael Jackson', 'Rua Alexandre Carvalho, 1958', 'rusbemichael@gmail.com', 982013681, "1958-08-29"),
('Olavo Pinto', 'Rua Márcio Silva,394', 'olavoolavo@gmail.com', 904286903,"1930-10-19"),
('Joaquim Macedo', 'Rua Marcelo Pera, 794', 'jojomacedo@gmail.com', 983705884, "1977-05-15"),
('Bianca Rocha', 'Rua Alexandre Dumas, 1478', 'pretyxbiancaa@gmail.com', 993590234, "2004-07-16"),
('Violeta Vaz', 'Rua Avanhandava, 1956', 'vivi.vaz@gmail.com', 992295803, "2002-10-23");

SELECT * FROM cliente;

INSERT INTO produto (nome_produto, preco, descricao, quantidade_estoque)
VALUES('Lápis grafite Faber Castell', 1.90, "Este lápis de grafite convencem através de sua boa qualidade de escrita. Tem forma hexagonal e o chumbo extra resistente à ruptura", 3980),
('Fichário Yes A4', 63.70, "Fichário A4 compacto disponível nas cores: azul, rosa, vermelho, laranja, branco e preto", 6538),
("Apontador maped com repositório", 5.79, "Esse apontador possui 1 furo, depósito transparente e abertura articulada.", 198893),
('Mochila impermeável para notebook Swissport', 279.90, "Mochila impermeável com compartimento para notebook de até 15.6' polegadas. Disponível na cor preta", 785),
('Notebook Dell Vostro', 5894.99, "Notebook Dell da linha Vostro, com 15'9 polegadas, 512GB de armazenamento e 16GB de RAM", 213),
('Caderno 20 matérias spiral', 49.80, "Caderno universitário 20 matérias disponível nas cores: azul, rosa, preto e branco", 765),
('Samsung Tab S8 Plus', 5630.90, "Galaxy Tab S8 Ultra inclui a plataforma Qualcomm Snapdragon 8 Gen 1, 16 GB de RAM e generosos 512 GB de armazenamento interno,", 637),
("Kit marca-texto tons pastéis Pilot", 12.15, "Kit Marca textos a base de álcool. Kit vem com as cores em tons pastéis: amarelo, laranja, verde, roxo, rosa e azul", 145),
("Estojo 2 divisórias rabisk", 25.80, "Estojo em tecido poliéster com duas divisórias. Disponível nas cores: Verde, azul, roxo, rosa, branco e azul", 347),
("Pasta sanfonada 12 divisórias DAC", 26.70, "Pasta sanfonada de plástico com 12 divisórias. Disponível nas cores: azul, rosa, preto, vermelho e branco", 254 );

SELECT * FROM produto;

INSERT INTO pedidos(id_cliente, dt_compra,valor_total,dt_entrega)
VALUES(1, "2024-03-23", 148.51, "2024-03-29"),
(2, "2024-01-23", 6183.89, "2024-01-30"),
(3, "2023-12-30", 2113.67, "2024-01-08"),
(4, "2024-01-03", 85.89, "2024-01-10"),
(5, "2024-02-29", 159.50, "2024-03-05"),
(6, "2024-03-23", 6968.90, "2024-03-30"),
(7, "2024-02-23", 98.80, "2024-02-29"),
(2,"2024-03-27", 1348.51, "2024-04-04"),
(10, "2024-03-22", 34.80, "2024-03-28"),
(9, "2024-03-23", 167.80, "2024-03-29");
SELECT * FROM pedidos;

INSERT INTO itens (id_produto, id_pedido,preco,quantidade, valor_total)
VALUES(1, 2, 1.90, 5, 9.50),
(2, 4, 63.70, 1, 63.90),
(3, 6, 5.79, 3, 17.37),
(4, 9, 279.90, 1, 279.90),
(5, 6, 5894.99, 1, 5894.99),
(6,6,  49.80, 3, 149.40 ),
(7, 2, 5630.90, 1, 5630.90),
(8,3,  12.15,2, 24.50),
(9, 1, 25.80, 3, 77.40),
(10, 10, 26.70, 1, 26.70);
SELECT * FROM itens;

UPDATE cliente SET email = "santosvaldys@hotmail.com" WHERE id_cliente= 3;
UPDATE produto SET preco = "45.80" WHERE id_produto= 6;
UPDATE pedidos SET dt_entrega = "2024-04-10" WHERE id_pedido= 4;
UPDATE itens SET quantidade= 10 WHERE id_item= 1; 

DELETE FROM cliente WHERE nome= "Mariana Macedo";
DELETE FROM pedidos WHERE id_pedido= 5;

/*Em um sistema de e-commerce, o cliente deverá ter a melhor experiência de compra possível. Para isso, 
modele um sistema que armazenará os dados do cliente: nome, endereço, e-mail, celular e data de nascimento. 
Os produtos deverão ser armazenados com os seguintes dados: nome, preço, descrição e quantidade em estoque.
 Cada cliente poderá realizar pedidos, e este será descrito com: número do pedido, data de compra, valor total,
 data estimada de entrega. Cada pedido conterá uma lista de itens, relacionado aos produtos, com: quantidade, 
 valor unitário e valor total.
   Inserir 10 registros por tabelas;
   4 comandos que atualizem alguns destes registros;
   2 comandos que excluem registros
*/