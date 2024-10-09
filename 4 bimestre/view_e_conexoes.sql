/*CREATE  USER user identified by "senha "  -> cria um usuário e uma senha para ele para limitar seu acesso ao db
GRANT SELECT, INSERT, UPDATE, DELETE ON database;   -> or "privilégios cedidos ao user"
GRANT concede permissões
GRANT all privileges -> Permite tudo
-> Aq estamos criando o user q fica entre a aplicação e o servidor
*/

/*  VIEW
 -> Cria uma tabela virtual, que não existe no db, facilitanod a consulta

CREATE VIEW vw_completo AS (insira consulta aq)

SELECT * FROM vw_completo --> acessa a view, que pode ser tratada como se fosse uma tabela comum, msm não existindo realmente no db

-> PARA ALTERAR A VIEW
	-> Não tem como alterar a view só mudando o select, ent usa-se CREATE OR REPLACE VIEW na linha onde a view e é criada
    -> o ALTER tbm pode ser usado, mas não é comumente usado 
*/