CREATE DATABASE db_financas_exam;
USE db_financas_exam;

CREATE TABLE contas (
   conta_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   tipo VARCHAR(50),
   saldo DECIMAL(15, 2) DEFAULT 0.00,
   data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transacoes (
   transacao_id INT AUTO_INCREMENT PRIMARY KEY,
   conta_id INT NOT NULL,
   tipo VARCHAR(50),
   valor DECIMAL(15, 2) NOT NULL,
   data_transacao DATETIME DEFAULT CURRENT_TIMESTAMP,
   descricao TEXT,
   FOREIGN KEY (conta_id) REFERENCES contas(conta_id)
);

CREATE TABLE orcamentos (
   orcamento_id INT AUTO_INCREMENT PRIMARY KEY,
   categoria VARCHAR(100),
   valor_planejado DECIMAL(15, 2) NOT NULL,
   data_inicio DATE,
   data_fim DATE
);

-- Inserindo contas
INSERT INTO contas (nome, tipo, saldo) VALUES
('Conta Corrente', 'Conta Corrente', 5000.00),
('Poupança', 'Conta Poupança', 12000.00),
('Investimentos', 'Conta Investimento', 20000.00);

-- Inserindo transações
INSERT INTO transacoes (conta_id, tipo, valor, descricao) VALUES
(1, 'Débito', 1000.00, 'Pagamento de aluguel'),
(2, 'Crédito', 1500.00, 'Depósito mensal'),
(3, 'Crédito', 5000.00, 'Rendimento de investimentos');

-- Inserindo orçamentos
INSERT INTO orcamentos (categoria, valor_planejado, data_inicio, data_fim) VALUES
('Alimentação', 2000.00, '2024-01-01', '2024-01-31'),
('Transporte', 800.00, '2024-01-01', '2024-01-31'),
('Lazer', 1000.00, '2024-01-01', '2024-01-31');
