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