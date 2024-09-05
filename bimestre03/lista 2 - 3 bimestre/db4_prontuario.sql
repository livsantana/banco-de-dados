CREATE DATABASE db_prontuario_exam;
USE db_prontuario_exam;

CREATE TABLE pacientes (
   paciente_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   data_nascimento DATE,
   sexo VARCHAR(10),
   telefone VARCHAR(15),
   endereco TEXT,
   data_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE prontuarios (
   prontuario_id INT AUTO_INCREMENT PRIMARY KEY,
   paciente_id INT NOT NULL,
   data_consulta DATETIME DEFAULT CURRENT_TIMESTAMP,
   medico VARCHAR(100),
   diagnostico TEXT,
   prescricao TEXT,
   observacoes TEXT,
   FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id)
);

CREATE TABLE consultas (
   consulta_id INT AUTO_INCREMENT PRIMARY KEY,
   paciente_id INT NOT NULL,
   medico VARCHAR(100),
   data_consulta DATETIME DEFAULT CURRENT_TIMESTAMP,
   motivo TEXT,
   FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id)
);

-- Inserindo pacientes
INSERT INTO pacientes (nome, data_nascimento, sexo, telefone, endereco) VALUES
('Ana Lima', '1985-04-23', 'Feminino', '11911111111', 'Rua G, 101'),
('Bruno Souza', '1978-11-10', 'Masculino', '11822222222', 'Rua H, 202'),
('Carla Mendes', '1990-08-30', 'Feminino', '11733333333', 'Rua I, 303');

-- Inserindo prontuários
INSERT INTO prontuarios (paciente_id, medico, diagnostico, prescricao, observacoes) VALUES
(1, 'Dr. Silva', 'Gripe', 'Antitérmicos e repouso', 'Paciente deve retornar em 7 dias'),
(2, 'Dra. Pereira', 'Hipertensão', 'Controle da pressão e mudança de dieta', 'Acompanhamento mensal necessário'),
(3, 'Dr. Santos', 'Enxaqueca', 'Analgésicos e redução de estresse', 'Recomendado exame neurológico');

-- Inserindo consultas
INSERT INTO consultas (paciente_id, medico, motivo) VALUES
(1, 'Dr. Silva', 'Consulta de retorno após tratamento de gripe'),
(2, 'Dra. Pereira', 'Primeira consulta de acompanhamento da hipertensão'),
(3, 'Dr. Santos', 'Consulta inicial para avaliação de enxaqueca crônica');