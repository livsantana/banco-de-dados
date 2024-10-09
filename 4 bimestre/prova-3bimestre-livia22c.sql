/* PROVA 01*/

CREATE DATABASE prova_livia22c;
USE prova_livia22c;

CREATE TABLE clientes(
		id_cliente int auto_increment primary key,
        nome varchar(100) not null,
        email varchar(100) not null,
        telefone varchar(15) not null
);

CREATE TABLE pedidos(
	id_pedido int auto_increment primary key,
    id_cliente int,
    data_pedido date,
    total decimal (6, 2),
    foreign key (id_cliente) references clientes(id_cliente) 
);

INSERT INTO clientes(nome, email, telefone) VALUES 
("Alice Souza", "alice.souza@example.com", '11999998888'),
("Bruno Lima", "bruno.lima@example.com", '11988887777'),
("Carla Santos", "carla.santos@example.com", '11977776666'),
("Daniela Oliveira", "daniela.oliveira@example.com", '11966665555'),
("Eduardo Pereira", "eduardo.pereira@example.com", '11955554444');

INSERT INTO pedidos(id_cliente, data_pedido, total) VALUES
(1,'2024-08-01', 250.00),
(2,'2024-08-03', 150.00),
(3,'2024-08-05', 300.00),
(4,'2024-08-07', 450.00),
(5,'2024-08-09', 200.00);

/*	QUESTÃO 3*/
SELECT clientes.email, pedidos.data_pedido FROM clientes INNER JOIN pedidos
ON clientes.id_cliente = pedidos.id_cliente;

/* QUESTÃO 5*/
SELECT clientes.nome, clientes.telefone FROM clientes JOIN pedidos
ON clientes.id_cliente = pedidos.id_cliente
WHERE pedidos.data_pedido = '2024-08-05'
