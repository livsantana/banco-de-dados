USE avaliacao_22a;

/*Inserir um Novo Livro*/
INSERT INTO livros(titulo, autor, ano_publicacao,disponivel, categoria, isbn, editora, quantidade_paginas, idioma) VALUES 
("As Crônicas de Nárnia", "C.S Lewis", 1950, TRUE, "Fantasia", "978-0064471190", "Harper Collins", 768, "Inglês");

/*2*/
INSERT INTO livros (titulo, autor, ano_publicacao,disponivel, categoria, isbn, editora, quantidade_paginas, idioma) VALUES 
("Cem Anos de Solidão", "Gabriel Garcia Marquez", 1967, TRUE, "Ficção", '978-0241968581', "Penguin Books", 422, 'Espanhol'),
("Harry Potter e a Pedra Filosofal", "J.K. Rowling", 1997, TRUE, "Fantasia", '978-0439708180', "Bloomsbury", 309, "Inglês"),
("O Senhor dos Anéis: A Sociedade do Anel", "J.R.R. Tolkien", 1954, TRUE, "Fantasia", '978-0618640157', "HarperCollins", 423, "Inglês");

/*Inserir Livro com Categoria Específica: Adicione um livro na categoria "História" com detalhes fictícios.*/
INSERT INTO livros(titulo, autor, ano_publicacao,disponivel, categoria, isbn, editora, quantidade_paginas, idioma)
VALUES("Manuscritos Perdidos", "Emily Bronte", 1886, FALSE, "História", '976-0975684375', "Companhia das Letras", 452, "Inglês");

-- Atualizar Disponibilidade: Altere o status de disponibilidade de todos os livros publicados antes de 2000 para FALSE.

UPDATE livros
SET disponivel= FALSE
WHERE ano_publicacao<2000;

-- Atualizar Editora: Atualize a editora do livro "1984" para "Plume Books".


UPDATE livros
SET editora= "Plume Books"
WHERE titulo= "1984";
-- Atualizar Idioma: Mude o idioma de todos os livros da editora "Penguin Books" para "Inglês".

UPDATE livros
SET idioma= "Inglês"
WHERE editora= "Penguin Books";

-- Atualizar Título: Altere o título do livro com ISBN '978-0439708180' para .

UPDATE livros
SET titulo= "Harry Potter e a Pedra Filosofal (Edição Especial)"
where isbn= '978-0439708180';

-- Deletar por Categoria: Delete todos os livros da categoria "Terror".

DELETE FROM livros
WHERE categoria= "Terror";

-- Deletar por Idioma e Ano: Delete todos os livros em "Francês" que foram publicados antes de 1970.

DELETE FROM livros WHERE idioma= 'Francês' and ano_publicacao<1970;

-- Deletar Livro Específico: Remova o livro com título "As Crônicas de Nárnia".

DELETE FROM livros WHERE titulo= "As Crônicas de Nárnia";

-- Deletar por Editora: Apague todos os livros publicados pela editora "Penguin Books".

DELETE FROM livros WHERE editora= "Penguin Books";


-- Selecionar com WHERE: Encontre todos os livros cujo número de páginas é superior a 500.

SELECT * FROM livros
where quantidade_paginas>500;

-- Selecionar com GROUP BY: Agrupe os livros por categoria e conte quantos livros existem em cada categoria.

SELECT categoria ,COUNT(titulo) FROM livros 
GROUP BY categoria;

-- Selecionar com LIMIT: Liste os 5 primeiros livros adicionados à tabela.

SELECT * from livros
limit 5;

-- Selecionar com SUM e COUNT: Calcule o total e a média de páginas dos livros na categoria "Drama".

SELECT SUM(quantidade_paginas), AVG(quantidade_paginas) from livros
WHERE categoria= "Drama";

-- Selecionar com AVG: Encontre a média de ano de publicação dos livros disponíveis.

SELECT AVG(ano_publicacao) from livros 
where disponivel= TRUE;

-- Selecionar com MAX e MIN: Determine o livro mais recente e o mais antigo na tabela.
select * from livros where ano_publicacao in(
SELECT MIN(ano_publicacao) FROM livros

UNION

SELECT max(ano_publicacao) FROM livros);



-- Selecionar com ORDER BY: Ordene todos os livros pelo ano de publicação em ordem decrescente.

SELECT * FROM livros
ORDER BY ano_publicacao desc;

-- Selecionar com UNION: Combine uma lista de todos os títulos de livros em "Inglês" com todos os títulos em "Português".

SELECT * FROM livros
WHERE idioma= "Inglês"

UNION

SELECT * FROM livros
WHERE idioma= "Português";
-- Selecionar Livros de um Autor Específico: Liste todos os livros do autor "George Orwell".

SELECT * FROM livros
WHERE autor= "George Orwell";


