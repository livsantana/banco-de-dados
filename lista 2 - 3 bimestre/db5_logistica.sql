CREATE DATABASE db_logistica_exam;
USE db_logistica_exam;

CREATE TABLE fornecedores (
   fornecedor_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   contato VARCHAR(100),
   telefone VARCHAR(15),
   endereco TEXT
);

CREATE TABLE produtos (
   produto_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   descricao TEXT,
   preco DECIMAL(10, 2) NOT NULL,
   fornecedor_id INT,
   estoque INT NOT NULL,
   FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(fornecedor_id)
);

CREATE TABLE armazens (
   armazem_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   localizacao VARCHAR(100)
);

CREATE TABLE movimentacao_estoque (
   movimentacao_id INT AUTO_INCREMENT PRIMARY KEY,
   produto_id INT NOT NULL,
   armazem_id INT NOT NULL,
   quantidade INT NOT NULL,
   tipo_movimentacao VARCHAR(50),
   data_movimentacao DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (produto_id) REFERENCES produtos(produto_id),
   FOREIGN KEY (armazem_id) REFERENCES armazens(armazem_id)
);

CREATE TABLE entregas (
   entrega_id INT AUTO_INCREMENT PRIMARY KEY,
   produto_id INT NOT NULL,
   quantidade INT NOT NULL,
   endereco_entrega TEXT,
   data_entrega DATETIME,
   status VARCHAR(50),
   FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

-- Inserindo fornecedores
INSERT INTO fornecedores (nome, contato, telefone, endereco) VALUES
('Fornecedor A', 'Carlos Lima', '11444444444', 'Av. J, 1000'),
('Fornecedor B', 'Mariana Costa', '11333333333', 'Rua K, 500'),
('Fornecedor C', 'Renato Santos', '11222222222', 'Rua L, 300');

-- Inserindo produtos
INSERT INTO produtos (nome, descricao, preco, fornecedor_id, estoque) VALUES
('Produto X', 'Descrição do produto X', 100.00, 1, 100),
('Produto Y', 'Descrição do produto Y', 200.00, 2, 50),
('Produto Z', 'Descrição do produto Z', 150.00, 3, 75);

-- Inserindo armazéns
INSERT INTO armazens (nome, localizacao) VALUES
('Armazém Central', 'Centro'),
('Armazém Norte', 'Zona Norte'),
('Armazém Sul', 'Zona Sul');

-- Inserindo movimentações de estoque
INSERT INTO movimentacao_estoque (produto_id, armazem_id, quantidade, tipo_movimentacao) VALUES
(1, 1, 50, 'Entrada'),
(2, 2, 30, 'Saída'),
(3, 3, 20, 'Entrada');

-- Inserindo entregas
INSERT INTO entregas (produto_id, quantidade, endereco_entrega, data_entrega, status) VALUES
(1, 10, 'Rua M, 120', '2024-09-15', 'Enviado'),
(2, 5, 'Rua N, 220', '2024-09-16', 'Entregue'),
(3, 15, 'Rua O, 320', '2024-09-17', 'Pendente');