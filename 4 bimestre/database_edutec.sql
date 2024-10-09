CREATE DATABASE db_edutec_2024;
USE db_edutec_2024;

-- Criar a tabela para armazenar os usuários da app
CREATE TABLE usuario(
	id_usuario bigint unsigned auto_increment primary key,
    email varchar(100) not null unique,
    senha varchar(100) not null, -- senha aberta, sem incriptação
    nome varchar(100) not null,
    -- genero enum('m','f','o'),
    qtd_tentativas tinyint default 0 not null, -- default == padrão. Preenche automaticamente um valor padrão a este campo
    bloqueado enum ('s','n') default 'n' not null-- por padrão, o usuário não está bloqueado. Caso este exceda as tentativas, é bloqueado
    -- se n tiver o default, ele cria o campo como nulo, assim como os outros que não tem um valor padrão
);
-- Usuário da app para testes
INSERT INTO usuario(email, senha, nome) -- aq tamo supondo q ja tem o usuario, seria o login
VALUES ('astrogilda@gmail.com', '@senhadaora', 'Astrogilda');

-- criando um usuário de banco de dados para o server app e restingindo suas permições, para se conectar ao bd
CREATE USER usr_mathtech IDENTIFIED BY 'p@ssw0rd';

-- user criado, bora conceder os acessos

GRANT SELECT, INSERT, UPDATE, DELETE
ON db_edutec_2024.* 
TO usr_mathtech;
