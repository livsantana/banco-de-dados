-- Selecionar Livros Disponíveis: Encontre todos os livros que estão disponíveis para empréstimo.

SELECT * FROM livros
WHERE disponivel= TRUE;

-- Selecionar por Editora: Liste todos os livros publicados pela editora "HarperCollins".

SELECT * FROM livros
WHERE editora= "HarperCollins";

-- Selecionar por Ano de Publicação: Encontre todos os livros publicados entre 2000 e 2010.

SELECT * FROM livros 
WHERE ano_publicacao BETWEEN 2000 AND 2010
ORDER BY ano_publicacao;

-- Selecionar com COUNT e HAVING: Conte quantos livros cada autor tem na tabela e mostre apenas os autores com mais de 3 livros.
SELECT autor, COUNT(titulo) FROM Livros
GROUP BY autor
HAVING count(titulo) > 3;

-- Selecionar com LIKE: Encontre todos os livros cujo título contém a palavra "Senhor".

SELECT * FROM livros
WHERE titulo LIKE "%Senhor%";

-- Selecionar com IN: Liste todos os livros que estão na categoria "Fantasia", "Ficção Científica" ou "Fábula".
SELECT * FROM livros 
WHERE categoria IN ("Fantasia", "Ficção científica","Fábula");

-- Selecionar com DISTINCT: Encontre todos os diferentes idiomas em que os livros foram escritos.
SELECT DISTINCT idioma AS "Idiomas" FROM livros;

-- Selecionar com BETWEEN: Liste todos os livros cujo número de páginas está entre 200 e 400.
SELECT * FROM LIVROS 
WHERE quantidade_paginas BETWEEN 200 AND 400
ORDER BY quantidade_paginas;

-- Selecionar com EXISTS: Verifique se existem livros na categoria "História".
SELECT EXISTS 
( SELECT * FROM livros WHERE categoria="História") as "Categoria História";

-- Selecionar Títulos e Anos de Publicação: Liste os títulos e anos de publicação de todos os livros, ordenados pelo ano de publicação.
SELECT titulo, ano_publicacao FROM livros
ORDER BY ano_publicacao;