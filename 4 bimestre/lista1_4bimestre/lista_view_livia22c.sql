use db_atividade_view;

/*1. Exibir lista de alunos e seus cursos
Crie uma view que mostre o nome dos alunos e as disciplinas em que estão matriculados, incluindo o nome do curso.*/
CREATE VIEW alunos_e_curso AS
SELECT aluno.nome AS 'nome do aluno', disciplina.*, curso.nome AS 'nome do curso' FROM aluno 
INNER JOIN matricula on aluno.id_aluno = matricula.id_aluno
INNER JOIN disciplina on disciplina.id_disciplina = matricula.id_disciplina
INNER JOIN curso on curso.id_curso = disciplina.id_curso;

SELECT * FROM alunos_e_curso;

/*2. Exibir total de alunos por disciplina
Crie uma view que mostre o nome das disciplinas e a quantidade de alunos matriculados em cada uma.*/

CREATE VIEW qtd_alunos_por_disciplina AS
SELECT disciplina.nome, count(aluno.id_aluno) AS 'quantidade de alunos' 
FROM disciplina JOIN matricula on matricula.id_disciplina = disciplina.id_disciplina
JOIN aluno on matricula.id_aluno = aluno.id_aluno
GROUP BY disciplina.nome;

SELECT * FROM qtd_alunos_por_disciplina ; 

/*3. Exibir alunos e status das suas matrículas
Crie uma view que mostre o nome dos alunos, suas disciplinas e o status da matrícula (Ativo, Concluído, Trancado).*/

CREATE VIEW alunos_e_status AS 
SELECT aluno.nome AS 'nome do aluno', disciplina.*, matricula.status FROM aluno 
JOIN matricula ON aluno.id_aluno = matricula.id_aluno
JOIN disciplina ON disciplina.id_disciplina = matricula.id_matricula;

SELECT * FROM alunos_e_status;
/*4. Exibir professores e suas turmas
Crie uma view que mostre o nome dos professores e as disciplinas que eles lecionam, com os horários das turmas.*/

CREATE VIEW professores_e_disciplinas AS 
SELECT professor.nome AS 'nome do professor', disciplina.*, turma.horario 
FROM professor INNER JOIN turma ON professor.id_professor= turma.id_professor
INNER JOIN disciplina ON disciplina.id_disciplina = turma.id_disciplina; 

SELECT * FROM professores_e_disciplinas;
/*5. Exibir alunos maiores de 20 anos
Crie uma view que exiba o nome e a data de nascimento dos alunos que têm mais de 20 anos.*/
CREATE VIEW maiores_de_20anos AS 
SELECT aluno.nome, aluno.data_nascimento FROM aluno  
WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) > 20;

SELECT * FROM maiores_de_20anos; 
/*6. Exibir disciplinas e carga horária total por curso
Crie uma view que exiba o nome dos cursos, a quantidade de disciplinas associadas e a carga horária total de cada curso.*/
CREATE VIEW disciplinas_e_carga AS
SELECT curso.nome, COUNT(disciplina.id_disciplina) as 'total de disciplinas', curso.carga_horaria
FROM curso INNER JOIN disciplina ON curso.id_curso = disciplina.id_curso
GROUP BY curso.nome, curso.carga_horaria;

SELECT * FROM disciplinas_e_carga;
/*7. Exibir professores e suas especialidades
Crie uma view que exiba o nome dos professores e suas especialidades.*/
CREATE VIEW professor_e_especialidade AS
SELECT nome, especialidade FROM professor;

SELECT * FROM professor_e_especialidade;
/*8. Exibir alunos matriculados em mais de uma disciplina
Crie uma view que mostre os alunos que estão matriculados em mais de uma disciplina.*/

CREATE VIEW matriculados_em_varias_disciplinas AS 
SELECT aluno.* FROM aluno JOIN matricula ON aluno.id_aluno = matricula.id_aluno
GROUP BY 
    aluno.nome
HAVING 
    COUNT(matricula.id_disciplina) > 1;

SELECT * FROM matriculados_em_varias_disciplinas;
/*9. Exibir alunos e o número de disciplinas que concluíram
Crie uma view que exiba o nome dos alunos e o número de disciplinas que eles concluíram.*/
CREATE VIEW disciplinas_concluidas as
SELECT aluno.nome, COUNT(matricula.id_disciplina) as 'disciplinas concluídas'
FROM aluno JOIN matricula ON aluno.id_aluno = matricula.id_aluno
WHERE matricula.status = 'Concluído'
GROUP BY aluno.nome;

SELECT * FROM disciplinas_concluidas ;
/*10. Exibir todas as turmas de um semestre específico
Crie uma view que exiba todas as turmas que ocorrem em um determinado semestre (ex.: 2024.1).*/
CREATE VIEW turmas_do_semestre as
SELECT turma.* FROM turma 
WHERE semestre= '2024.1';

SELECT * FROM turmas_do_semestre;
/*11. Exibir alunos com matrículas trancadas
Crie uma view que exiba o nome dos alunos que têm matrículas no status "Trancado".*/
CREATE VIEW matriculas_trancadas AS
SELECT aluno.nome FROM aluno JOIN matricula on aluno.id_aluno = matricula.id_aluno
WHERE matricula.status like ('T%') 
GROUP BY aluno.nome;

SELECT * FROM matriculas_trancadas;
/*12. Exibir disciplinas que não têm alunos matriculados

Crie uma view que exiba as disciplinas que não possuem alunos matriculados.*/
CREATE VIEW disciplinas_sem_alunos AS
SELECT disciplina.* FROM disciplina 
JOIN matricula ON disciplina.id_disciplina = matricula.id_disciplina
WHERE matricula.id_aluno IS NULL;

SELECT * FROM disciplinas_sem_alunos;

/*13. Exibir a quantidade de alunos por status de matrícula

Crie uma view que exiba a quantidade de alunos para cada status de matrícula (Ativo, Concluído, Trancado).*/
CREATE VIEW status_de_matricula AS
SELECT status, count(id_aluno) AS 'qtd alunos' FROM matricula 
GROUP BY status;

SELECT * FROM status_de_matricula;
/*14. Exibir o total de professores por especialidade
Crie uma view que exiba a quantidade de professores por especialidade (ex.: Engenharia de Software, Ciência da Computação).*/
CREATE VIEW professores_por_especialidade AS
SELECT especialidade, count(id_professor) AS 'qtd professor' FROM professor 
GROUP BY especialidade;

SELECT * FROM professores_por_especialidade;
/*15. Exibir lista de alunos e suas idades
Crie uma view que exiba o nome dos alunos e suas idades com base na data de nascimento.*/
CREATE VIEW idade_alunos AS
SELECT nome, FORMAT((DATEDIFF(CURDATE(), data_nascimento) /365), 0) AS 'idade' FROM ALUNO;

SELECT * FROM idade_alunos;
/*16. Exibir alunos e suas últimas matrículas
Crie uma view que exiba o nome dos alunos e a data de suas últimas matrículas.*/
CREATE VIEW ultimas_matriculas AS
SELECT aluno.nome, max(matricula.data_matricula )
FROM aluno INNER JOIN matricula ON aluno.id_aluno = matricula.id_aluno
GROUP BY aluno.nome;

SELECT * FROM ultimas_matriculas;
/*17. Exibir todas as disciplinas de um curso específico
Crie uma view que exiba todas as disciplinas pertencentes a um curso específico, como "Engenharia de Software".*/

CREATE VIEW disciplinas_curso AS
SELECT curso.nome AS 'nome_curso', disciplina.nome AS 'nome_disciplina' FROM curso 
INNER JOIN disciplina ON curso.id_curso = disciplina.id_curso
WHERE curso.nome= 'Engenharia de Software';

SELECT * FROM disciplinas_curso;

/*18. Exibir os professores que não têm turmas
Crie uma view que exiba os professores que não estão lecionando em nenhuma turma.*/

CREATE VIEW professores_sem_aula AS 
SELECT professor.* FROM professor RIGHT JOIN turma on professor.id_professor= turma.id_professor
WHERE professor.id_professor IS NULL;

SELECT * FROM professores_sem_aula;
/*19. Exibir lista de alunos com CPF e email
Crie uma view que exiba o nome dos alunos, CPF e email.*/
CREATE VIEW dados_alunos AS
SELECT nome, cpf, email FROM aluno;

SELECT * FROM dados_alunos;
/*20. Exibir o total de disciplinas por professor
Crie uma view que exiba o nome dos professores e o número de disciplinas que cada um leciona.*/

CREATE VIEW disciplinas_por_professor AS
SELECT professor.nome, COUNT(id_disciplina) as 'disciplinas lecionadas'
FROM professor
INNER JOIN turma ON turma.id_professor = prfessor.id_professor
GROUP BY professor.nome;

SELECT * FROM disciplinas_por_professor;